import 'package:flutter_custom_utils/util/duration_utils.dart';
import 'package:get/get.dart';
import 'package:task_app/Ui/home/bind/home_bind.dart';
import 'package:task_app/utils/route/routes.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  @override
  void onInit() async {
    final status = await HomePageController().checkConnectivity();
    print('status:${status.toString()}');
    
    super.onInit();
    3.cSeconds.cDelay(() {
      Get.offAllNamed(Routes.homepageView);
    });
  }
}
