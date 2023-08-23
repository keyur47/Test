import 'dart:convert';

import 'package:dht/helper/app_constant.dart';
import 'package:dht/helper/shared_preferences.dart';
import 'package:dht/helper/toast_helper.dart';
import 'package:dht/modules/auth/sign_in/model/sign_in_model.dart';
import 'package:dht/utils/navigation_utils/routes.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailSignInTextEditingController = TextEditingController();
  TextEditingController passwordSignInTextEditingController = TextEditingController();

  FocusNode emailSignInTextFocusNode = FocusNode();
  FocusNode passwordSignInTextFocusNode = FocusNode();

  RxBool isSignInButtonNotEmpty = false.obs;
  RxString isEmailSignInError = ''.obs;
  RxString isPasswordSignInError = ''.obs;
  RxBool isLoading = false.obs;

  RxBool isLogin = false.obs;

  @override
  void dispose() {
    emailSignInTextFocusNode.dispose();
    passwordSignInTextFocusNode.dispose();
    super.dispose();
  }

  final signInFormKey = GlobalKey<FormState>();

  Future getData() async {
    try {
      AppConstant.databaseReference
          .collection("userDetail")
          .where("email", isEqualTo: emailSignInTextEditingController.text)
          .where("password", isEqualTo: passwordSignInTextEditingController.text)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          for (var result in querySnapshot.docs) {
            isLogin.value = true;
            Map<dynamic, dynamic> data = result.data();
            LoginModel loginUser = loginModelFromJson(jsonEncode(data));
            AppPreference.setBoolean("isCheckSignIn", value: isLogin.value);
            AppPreference.setUserIdString("isUserID", loginUser.userId.toString());
            AppToast.toastMessage(StringsUtils.loginSuccess);
            Get.offNamed(Routes.home);
            emailSignInTextEditingController.clear();
            passwordSignInTextEditingController.clear();
            isLogin.value = false;
          }
        } else {
          isLogin.value = false;
          emailSignInTextEditingController.clear();
          passwordSignInTextEditingController.clear();
          AppToast.toastMessage(StringsUtils.loginFailed);
        }
      });
      isLogin.value = false;
    } catch (e, st) {
      isLogin.value = false;
    }
  }
}
