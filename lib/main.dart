import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app_mvvm_getx_besia/core/services/database/cart_database_helper.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/login_view.dart';

import 'package:shop_app_mvvm_getx_besia/view/control_view.dart';

import 'core/services/shared_preferences.dart';
import 'core/utils/binding.dart';
import 'core/utils/constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home:  LocalData().getString(idToken) ==null? LoginView(): const ControlView(),
       theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
