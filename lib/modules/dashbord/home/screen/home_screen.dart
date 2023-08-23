import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dht/helper/app_constant.dart';
import 'package:dht/helper/date_helper.dart';
import 'package:dht/helper/shared_preferences.dart';
import 'package:dht/helper/validation_utils.dart';
import 'package:dht/modules/dashbord/edit/edit_screen.dart';
import 'package:dht/modules/dashbord/home/controller/home_controller.dart';
import 'package:dht/modules/dashbord/home/model/home_model.dart';

import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:dht/widgets/app_text.dart';
import 'package:dht/widgets/appbar.dart';
import 'package:dht/widgets/button.dart';
import 'package:dht/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? isUserId;

  @override
  void initState() {
    isUserId = AppPreference.getUserIdString("isUserID");
    super.initState();
  }

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        leadingIcon: false,
        title: StringsUtils.home,
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeUtils.horizontalBlockSize * 6,
            right: SizeUtils.horizontalBlockSize * 6,
            top: SizeUtils.verticalBlockSize * 2,
          ),
          child: Form(
            key: homeController.questionFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(
                  text: StringsUtils.weight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 1.5),
                  child: CustomTextField(
                    validator: AppValidator.isFirstNameValid,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    spreadRadius: 0,
                    controller: homeController.weightController,
                    focusNode: FocusNode(),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 2,
                ),
                createButton(
                  text: StringsUtils.save,
                  onTap: () async {
                    if (homeController.questionFormKey.currentState!.validate()) {
                      WeightDetail data = WeightDetail(
                        weight: homeController.weightController.text.trim(),
                        time: dateInMillisecondsSinceEpoch(DateTime.now()),
                      );
                      await homeController.insertWeightDetail(
                        data: data,
                      );
                      homeController.weightController.clear();
                    }
                  },
                  fontSize: SizeUtils.fSize_18(),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 6,
                ),
                StreamBuilder(
                    stream: AppConstant.databaseReference
                        .collection("WeightDetail")
                        .orderBy("time", descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      homeController.weightDetail.clear();
                      snapshot.data?.docs.forEach((element) {
                        log("${element.data()}");
                        WeightDetail requestedModel =
                            WeightDetail.fromJson(element.data() as Map<String, dynamic>);
                        homeController.weightDetail.add(requestedModel);
                      });
                      return SingleChildScrollView(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeController.weightDetail.length,
                          itemBuilder: (context, index) {
                            var data = homeController.weightDetail[index];
                            TextEditingController title = TextEditingController(text: data.weight);
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 2,
                              ),
                              child: CustomTextField(
                                controller: title,
                                readOnly: true,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(EditScreen(), arguments: [
                                          {"userId": "${data.userId}"},
                                        ]);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await homeController.deleteRecords(
                                          userId: data.userId,
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// titleText
Widget titleText({String? text, String? image}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        text: text ?? '',
        fontWeight: FontWeight.w500,
        fontSize: SizeUtils.fSize_16(),
      ),
    ],
  );
}
