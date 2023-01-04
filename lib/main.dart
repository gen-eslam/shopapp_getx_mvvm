import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/login_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: LoginScreen(),
      )
    );
  }
}

