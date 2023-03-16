import 'package:get/get.dart';
import 'package:task_app/Ui/home/bind/home_bind.dart';
import 'package:task_app/Ui/home/view/home_page_view.dart';
import 'package:task_app/Ui/splash/bind/splash_bind.dart';
import 'package:task_app/Ui/splash/view/splash_view.dart';
import 'package:task_app/Ui/user_details/view/user_details_view.dart';
import 'package:task_app/utils/route/routes.dart';

abstract class AppPages {
  static final pages = [

    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),  

     GetPage(
      name: Routes.homepageView,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
     GetPage(
      name: Routes.detailsPage,
      page: () =>  UserDetailsPageView(),
      binding: HomePageBinding(),
    ),

  ];
}
