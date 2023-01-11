import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';

import '../../core/utils/constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
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
              BoxShadow(color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              ),
            ]

        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(text: "Welcome", fontSize: 30),
                  CustomText(
                      text: "Sign Up", color: primaryColor, fontSize: 18),
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
                onSave: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  controller.showErrorMessage(value);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<AuthViewModel>(builder: (logic) {
                return CustomTextFormField(
                  text: "Password",
                  hint: "*********",
                  obscureText: controller.hidePass,
                  onSave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {

                  },
                  suffixIcon: IconButton(
                    color: primaryColor,
                    icon: Icon(controller.passwordIcon(),),
                    onPressed: () {
                      controller.showHidePassword();
                    },
                  ),

                );
              }),
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
      ),
    );
  }
}
