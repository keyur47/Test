import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dht/helper/app_constant.dart';
import 'package:dht/helper/date_helper.dart';
import 'package:dht/helper/shared_preferences.dart';
import 'package:dht/helper/validation_utils.dart';
import 'package:dht/modules/dashbord/home/controller/home_controller.dart';
import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:dht/widgets/app_text.dart';
import 'package:dht/widgets/appbar.dart';
import 'package:dht/widgets/button.dart';
import 'package:dht/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? isUserId;
  var data = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    isUserId = AppPreference.getUserIdString("isUserID");
    super.initState();
  }

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        leadingIcon: true,
        title: StringsUtils.edit,
        actions: [
          Icon(
            Icons.add,
            color: AppColors.black,
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 4,
          )
        ],
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeUtils.horizontalBlockSize * 6,
            right: SizeUtils.horizontalBlockSize * 6,
            top: SizeUtils.verticalBlockSize * 2,
          ),
          child: Form(
            key: homeController.questionUpdateFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(
                  text: StringsUtils.update,
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
                    controller: homeController.updateNameController,
                    focusNode: FocusNode(),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 2,
                ),
                createButton(
                  text: StringsUtils.save,
                  onTap: () async {
                    if (homeController.questionUpdateFormKey.currentState!.validate()) {
                      await homeController.updateNotes(
                        questions: homeController.updateNameController.text.trim(),
                        dateTime: dateInMillisecondsSinceEpoch(DateTime.now()),
                        userId: data[0]["userId"],
                      );
                      homeController.updateController.clear();
                      Get.back();
                    }
                  },
                  fontSize: SizeUtils.fSize_18(),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 6,
                ),
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
