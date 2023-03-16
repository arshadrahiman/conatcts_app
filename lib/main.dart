import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/utils/route/app_pages.dart';
import 'package:task_app/utils/route/routes.dart';
import 'package:task_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  openDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          )),
      getPages: AppPages.pages,
    );
  }
}


