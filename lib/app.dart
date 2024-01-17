import 'package:firebase_setu_original/src/bindings/general_bindings.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/Onboarding.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/login/login.dart';
import 'package:firebase_setu_original/src/features/authentication/screens/signup/signup.dart';
import 'package:firebase_setu_original/src/utils/constants/colors.dart';
import 'package:firebase_setu_original/src/utils/constants/text_strings.dart';
import 'package:firebase_setu_original/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(), //initiate network manager
      // home: const Scaffold(
      //   backgroundColor: TColors.accent,
      // ));
      home: Scaffold(),
    );
  }
}
