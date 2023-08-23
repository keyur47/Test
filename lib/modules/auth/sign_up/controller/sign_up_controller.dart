import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dht/helper/app_constant.dart';
import 'package:dht/modules/auth/sign_up/model/sign_up_modal.dart';
import 'package:dht/utils/navigation_utils/navigation.dart';
import 'package:dht/utils/navigation_utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {

  /// Controller

  TextEditingController emailSignUPTextEditingController = TextEditingController();
  TextEditingController passwordSignUPTextEditingController = TextEditingController();


  /// FocusNode

  FocusNode emailSignUPTextFocusNode = FocusNode();
  FocusNode passwordSignUPTextFocusNode = FocusNode();


  RxBool isSignUpButtonNotEmpty = false.obs;
  RxString isSignUpEmailError = ''.obs;
  RxString isSignUpPasswordError = ''.obs;
  RxString isSignUpUserNameError = ''.obs;
  RxString isSignUpLastNameError = ''.obs;
  RxString isSignUpFirstNameError = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void dispose() {
    emailSignUPTextFocusNode.dispose();
    passwordSignUPTextFocusNode.dispose();
    super.dispose();
  }

  void onInit() {
    emailSignUPTextFocusNode.addListener(() {
      if (!emailSignUPTextFocusNode.hasFocus) {
        emailValidation();
      }
    });
    passwordSignUPTextFocusNode.addListener(() {
      if (!passwordSignUPTextFocusNode.hasFocus) {
        passWordValidation();
      }
    });

    super.onInit();
  }

  emailValidation() {
    if (emailSignUPTextEditingController.text.isEmpty) {
      // isSignUpEmailError.value = 'Please enter email';
    } else if (!(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailSignUPTextEditingController.text.trim()))) {
      isSignUpEmailError.value = 'Please enter valid email';
    } else {
      isSignUpEmailError.value = '';
    }
    signUpButtonNotEmpty();
  }

  passWordValidation() {
    if (passwordSignUPTextEditingController.text.isEmpty) {
      // isSignUpPasswordError.value = 'Please enter Password';
    }
    else if (!(RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(passwordSignUPTextEditingController.text.trim()))) {
      isSignUpPasswordError.value =
          'Password must be Uppercase,Lowercase,digit and specialCharacters';
    }
    else {
      isSignUpPasswordError.value = '';
    }
    signUpButtonNotEmpty();
  }


  void signUpButtonNotEmpty() {
    if (emailSignUPTextEditingController.text.isNotEmpty &&
        passwordSignUPTextEditingController.text.isNotEmpty &&
        isSignUpEmailError.value.isEmpty &&
        isSignUpPasswordError.value.isEmpty) {
      isSignUpButtonNotEmpty.value = true;
    } else {
      isSignUpButtonNotEmpty.value = false;
    }
  }


  final signUpFormKey = GlobalKey<FormState>();

  Future<void> insertUserDetail(UserDetail data) async {
    try {
      data.userId = AppConstant.databaseReference.collection('userDetail').doc().id;
      await AppConstant.databaseReference.collection("userDetail").doc(data.userId).set(
        data.toJson(),
        SetOptions(merge: true),
      );
      Navigation.popAndPushNamed(Routes.signInScreen);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<bool> usernameCheck({String? email}) async {
    final result =
    await AppConstant.databaseReference.collection("userDetail").where("email", isEqualTo: email).get();

    return result.docs.isEmpty;
  }

}
