import 'package:dht/helper/toast_helper.dart';
import 'package:dht/helper/validation_utils.dart';
import 'package:dht/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:dht/modules/auth/sign_up/model/sign_up_modal.dart';
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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpController signUpController = Get.find();

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
            key: signUpController.signUpFormKey,
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
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 3),
                  child: AppText(
                    fontFamily: AssetsPath.robotoSerifFonts,
                    text: StringsUtils.createAccount,
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_30(),
                    color: AppColors.orange,
                  ),
                ),
                CustomTextField(
                  maxLine: 1,
                  validator: AppValidator.emailValidator,
                  controller: signUpController.emailSignUPTextEditingController,
                  focusNode: signUpController.emailSignUPTextFocusNode,
                  hintText: StringsUtils.email,
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1.9,
                ),
                CustomTextField(
                  isPassword: true,
                  validator: AppValidator.passwordValidator,
                  maxLine: 1,
                  controller: signUpController.passwordSignUPTextEditingController,
                  focusNode: signUpController.passwordSignUPTextFocusNode,
                  hintText: StringsUtils.password,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 3),
                  child: createButton(
                      onTap: () async {
                        if (signUpController.signUpFormKey.currentState!.validate()) {
                          final validUserName = await signUpController.usernameCheck(
                            email: signUpController.emailSignUPTextEditingController.text.trim(),
                          );
                          print("validUserName:-->  ${validUserName}");
                          print("validUserName:-->  ${validUserName}");
                          if (validUserName) {
                            setUserData();
                          } else {
                            AppToast.toastMessage("UserName Already");
                          }
                        }
                      },
                      text: StringsUtils.signUP,
                      fontSize: SizeUtils.fSize_18()),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 0.5,
                ),
                RichText(
                  text: TextSpan(
                    text: StringsUtils.alreadyHaveAnAccount,
                    style: TextStyle(
                      color: AppColors.textColor[200],
                      fontWeight: FontWeight.w500,
                      fontSize: SizeUtils.fSize_14(),
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigation.popAndPushNamed(Routes.signInScreen);
                          },
                        text: StringsUtils.signIN,
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_14(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setUserData() async {
    signUpController.isLoading.value = true;
    UserDetail userDetail = UserDetail(
      email: signUpController.emailSignUPTextEditingController.text.trim(),
      password: signUpController.passwordSignUPTextEditingController.text.trim(),
    );
    await signUpController.insertUserDetail(userDetail);
    signUpController.isLoading.value = false;
    signUpController.emailSignUPTextEditingController.clear();
    signUpController.passwordSignUPTextEditingController.clear();
  }
}
