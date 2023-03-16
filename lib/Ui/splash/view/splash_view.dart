import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_app/res/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Lottie.asset(
            AppImages.splashLottie,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
