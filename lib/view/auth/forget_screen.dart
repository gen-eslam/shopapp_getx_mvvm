import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/login_screen.dart';

import '../../core/utils/constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

  ForgetScreen({super.key});

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
                        color: primaryColor.withOpacity(0.15),
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Form(
                  key: _formRegisterKey,
                  child: Column(
                    children: [
                      const CustomText(
                        text: "Forget Password",
                        fontSize: 25,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/forgetpass.png",
                        width: 250,
                      ),
                      CustomTextFormField(
                        autofillHints: true,
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
                        return CustomButton(
                          inProcess: controller.inProcess,
                          onPress: () {
                            _formRegisterKey.currentState!.save();
                            if (_formRegisterKey.currentState!.validate()) {
                              controller.resetPassword(controller.email);
                            }
                          },
                          text: 'Send Email',
                        );
                      }),
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
