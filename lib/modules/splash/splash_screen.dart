import 'dart:async';
import 'package:dht/helper/shared_preferences.dart';
import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/navigation_utils/navigation.dart';
import 'package:dht/utils/navigation_utils/routes.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isCheckSignIn = false;

  @override
  void initState() {
    isCheckSignIn = AppPreference.getBoolean("isCheckSignIn");

    super.initState();
    startTimeOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: SizeUtils.horizontalBlockSize * 75,
              child: Image.asset(
                AssetsPath.authBGImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimeOut() {
    Timer(
      const Duration(seconds: 3),
      () {
        isCheckSignIn == true
            ? Navigation.popAndPushNamed(
                Routes.home,
              )
            : Navigation.popAndPushNamed(
                Routes.signUpScreen,
              );
      },
    );
  }
}
