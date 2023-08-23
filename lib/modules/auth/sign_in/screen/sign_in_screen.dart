import 'dart:developer';

import 'package:dht/helper/validation_utils.dart';
import 'package:dht/modules/auth/sign_in/controller/sign_in_controller.dart';
import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/navigation_utils/navigation.dart';
import 'package:dht/utils/navigation_utils/routes.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:dht/utils/strings_utils.dart';
import 'package:dht/widgets/app_text.dart';
import 'package:dht/widgets/button.dart';
import 'package:dht/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.verticalBlockSize * 8,
            left: SizeUtils.horizontalBlockSize * 6,
            right: SizeUtils.horizontalBlockSize * 6,
          ),
          child: Form(
            key: signInController.signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AssetsPath.logo,
                    scale: 4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 3),
                  child: AppText(
                    fontFamily: AssetsPath.robotoSerifFonts,
                    text: StringsUtils.login,
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_30(),
                    color: AppColors.orange,
                  ),
                ),

                CustomTextField(
                  maxLine: 1,
                  controller: signInController.emailSignInTextEditingController,
                  focusNode: signInController.emailSignInTextFocusNode,
                  hintText: StringsUtils.email,
                  validator: AppValidator.emailValidator,
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1.9,
                ),
                CustomTextField(
                  isPassword: true,
                  maxLine: 1,
                  controller:
                  signInController.passwordSignInTextEditingController,
                  focusNode: signInController.passwordSignInTextFocusNode,
                  hintText: StringsUtils.password,
                  validator: AppValidator.passwordValidator,

                ),
                Align(
                  alignment: Alignment.centerRight,
                   child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 1.4),
                    child: AppText(text: "Forgot Password?",fontSize: SizeUtils.fSize_12(),fontWeight: FontWeight.w500,color: AppColors.textColor[200]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 1.8),
                  child: createButton(
                      onTap: () async {
                        if (signInController.signInFormKey.currentState!.validate()) {
                          await signInController.getData();
                        }
                      },
                      text: StringsUtils.signIN,
                      fontSize: SizeUtils.fSize_18()),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1,
                ),
                RichText(
                  text: TextSpan(
                    text: StringsUtils.doNtHaveAnAccount,
                    style: TextStyle(
                      color: AppColors.textColor[200],
                      fontWeight: FontWeight.w500,
                      fontSize: SizeUtils.fSize_14(),
                    ),
                    children: [
                      TextSpan(
                        recognizer:  TapGestureRecognizer()..onTap = (){
                          Navigation.replace(Routes.signUpScreen);
                        },
                        text: StringsUtils.signUP,
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_14(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
