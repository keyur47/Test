import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dht/helper/app_constant.dart';
import 'package:dht/helper/toast_helper.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dht/modules/dashbord/home/model/home_model.dart';


class HomeController extends GetxController {
  TextEditingController weightController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateController = TextEditingController();
  final questionFormKey = GlobalKey<FormState>();
  final questionUpdateFormKey = GlobalKey<FormState>();
  RxList<WeightDetail> weightDetail = <WeightDetail>[].obs;

  RxBool editButton = false.obs;

  Future<void> insertWeightDetail({WeightDetail? data}) async {
    try {
      data?.userId = AppConstant.databaseReference.collection('WeightDetail').doc().id;
      await AppConstant.databaseReference.collection("WeightDetail").doc(data?.userId).set(
            data!.toJson(),
            SetOptions(merge: true),
          );
      // Get.back();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateNotes({
    String? userId,
    questions,
    dateTime,
  }) async {
    Map<String, dynamic> data = {'weight': questions, 'time': dateTime, 'userId': userId};

    await FirebaseFirestore.instance.collection("WeightDetail").doc(userId).update(data);
  }

  Future<void> deleteRecords({
    String? userId,
  }) async {
    FirebaseFirestore.instance.collection("WeightDetail").doc(userId).delete().then((value) {
      AppToast.toastMessage(StringsUtils.delete);
    });
  }
}
