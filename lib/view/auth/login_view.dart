import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/forget_view.dart';
import 'package:shop_app_mvvm_getx_besia/view/auth/register_view.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button_social.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';
import '../../core/utils/constance.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formLogInKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                  key: _formLogInKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(text: "Welcome", fontSize: 30),
                          CustomTextButton(
                              text: "Sign Up",
                              onPressed: () {
                                Get.to(RegisterView());
                              },
                              textColor: primaryColor,
                              fontSize: 18),
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextButton(
                            text: "Forget Password?",
                            fontSize: 14,
                            onPressed: () {
                              Get.to(ForgetView());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthViewModel>(builder: (logic) {
                        return CustomButton(
                          inProcess: controller.inProcess,
                          onPress: () {
                            _formLogInKey.currentState!.save();
                            if (_formLogInKey.currentState!.validate()) {
                              controller.signInWithEmailAndPassword();
                            }
                          },
                          text: 'SIGN IN',
                        );
                      }),
                    ],
                  ),
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
