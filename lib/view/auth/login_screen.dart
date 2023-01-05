import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';

import '../../core/utils/constance.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 20.0,
          left: 20.0,
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
              onPress: () {},
              text: 'SIGN IN',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(text: '--OR--', alignment: Alignment.center,color: Colors.grey,),
            TextButton(onPressed: (){}, child: Row(
              children: [

              ],
            )),
          ],
        ),
      ),
    );
  }
}
