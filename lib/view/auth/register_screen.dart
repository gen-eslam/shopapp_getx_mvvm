import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/login_screen.dart';

import '../../core/utils/constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.off(LoginScreen());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Form(
                  key: _formRegisterKey,
                  child: Column(
                    children: [
                      const CustomText(text: "Sign Up", fontSize: 30),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        text: "Name",
                        hint: "gen-islam",
                        onSave: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          return value!.isEmpty ? "Name must be filled" : null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        text: "Email",
                        hint: "gen_eslam2002@gmail.com",
                        onSave: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return value!.isEmpty ? "Email must be filled" : null;
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
                            return value!.isEmpty
                                ? "Password must be filled"
                                : null;
                          },
                          suffixIcon: IconButton(
                            color: primaryColor,
                            icon: Icon(
                              controller.passwordIcon(),
                            ),
                            onPressed: () {
                              controller.showHidePassword();
                            },
                          ),
                        );
                      }),

                      const SizedBox(
                        height: 40,
                      ),

                      CustomButton(
                        onPress: () {
                          _formRegisterKey.currentState!.save();
                          if (_formRegisterKey.currentState!
                              .validate()) {

                            controller.signUpWithEmailAndPassword();
                          }
                        },
                        text: 'SIGN UP',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
