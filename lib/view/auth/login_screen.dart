import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button_social.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';
import '../../core/utils/constance.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            right: 20.0,
            left: 20.0,
          ),
          child: Column(
            children: [
             Container(
               padding: const EdgeInsets.only(
                 top: 10,
                 bottom: 10,
                 left: 10,
                 right: 10,
               ),


               decoration: BoxDecoration(
                   color: Colors.white,
                   shape: BoxShape.rectangle,
                 boxShadow: [
                   BoxShadow(color:Colors.grey.withOpacity(0.2) ,
                     blurRadius: 10,
                     spreadRadius: 3,
                     offset:const Offset(0,3),
                   ),
                 ]

               ),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: const [
                       CustomText(text: "Welcome", fontSize: 30),
                       CustomText(text: "Sign Up", color: primaryColor, fontSize: 18),
                     ],
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   const CustomText(
                     text: "Sign in to Continue",
                     fontSize: 14,
                     color: Colors.grey,
                   ),
                   const SizedBox(
                     height: 30,
                   ),
                   CustomTextFormField(
                     text: "Email",
                     hint: "gen_eslam2002@gmail.com",
                     onSave: (value) {},
                     validator: (value) {},
                   ),
                   const SizedBox(
                     height: 40,
                   ),
                   CustomTextFormField(
                     text: "Password",
                     hint: "*********",
                     onSave: (value) {},
                     validator: (value) {},
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   const CustomText(
                     text: "Forget Password?",
                     fontSize: 14,
                     alignment: Alignment.topRight,
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   CustomButton(
                     onPress: () {

                     },
                     text: 'SIGN IN',
                   ),
                 ],
               ),
             ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: '--OR--',
                alignment: Alignment.center,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                  imagePath: "assets/images/google.png",
                  text: 'Sign In with Google',
                  onPressed: () {
                    controller.googleSignInMethod();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
