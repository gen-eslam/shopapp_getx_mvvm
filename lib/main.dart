import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/login_screen.dart';

import 'core/utils/binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: LoginScreen(),
    );
  }
}

