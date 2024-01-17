import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setu_original/app.dart';
import 'package:firebase_setu_original/firebase_options.dart';
import 'package:firebase_setu_original/src/data/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  ///---- 1.  Add widget binding
  ///
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///

  /// --- 2. init local storage
  await GetStorage.init();

  /// --- 3. await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  

  /// --- 4. initalise firebase and authentication repo.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  /*
  this above means if once the firebase initalization is completed 
  related to any platform web, android , ios.
  then  using 'then' keyword we initalise our auth repo
  ? after firebase is initalised we let auth repo to navigate the user where ever he wanted.
   */
  //
  //
  runApp(const App());
}
