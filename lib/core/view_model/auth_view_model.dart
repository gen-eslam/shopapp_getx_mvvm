import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  bool hidePass = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///google signIn
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  ///Sign In With Email And Pass
  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      Get.snackbar(
        "Error Login Account",
        error.toString(),
        colorText: Colors.white,
        backgroundColor: errorColor,
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// show password methods
  void showHidePassword() {
    hidePass = !hidePass;
    update();
  }

  IconData passwordIcon() {
    return hidePass ? Icons.remove_red_eye : Icons.visibility_off;
  }
  ///TODO Validate Email RGX
  void showErrorMessage(String? value) {

    Get.snackbar("Empty parameter", "this field required ",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(30));
  }
}
