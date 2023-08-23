import 'package:dht/modules/auth/sign_in/controller/sign_in_controller.dart';
import 'package:dht/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:dht/modules/dashbord/home/controller/home_controller.dart';

import 'package:get/get.dart';
import 'package:dht/utils/size_utils.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
    Get.put<SignInController>(SignInController());
    Get.put<HomeController>(HomeController());


  }
}
