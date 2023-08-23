import 'package:dht/utils/app_colors.dart';
import 'package:dht/utils/assets_path.dart';
import 'package:dht/utils/navigation_utils/routes.dart';
import 'package:dht/utils/size_utils.dart';
import 'package:dht/widgets/app_binding.dart';
import 'package:dht/widgets/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class Dht extends StatelessWidget {
  const Dht({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: AppColors.safeAreaColor,
    //   systemNavigationBarColor: AppColors.safeAreaColor,
    // ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        disabledColor: Colors.transparent,
        fontFamily: AssetsPath.robotoFonts,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      builder: (context, child) {
        SizeUtils().init(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
    );
  }
}
