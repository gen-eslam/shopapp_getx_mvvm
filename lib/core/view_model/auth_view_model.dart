import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_mvvm_getx_besia/core/services/firestore_user.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';
import 'package:shop_app_mvvm_getx_besia/model/user_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/home_screen.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  bool hidePass = true;
  bool isValidate = true;

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
    Get.offAll(HomeScreen());
  }

  ///Sign In With Email And Pass
  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        "Sign In Success",
        "Enjoy",
        colorText: Colors.white,
        backgroundColor: primaryColor,
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(HomeScreen());
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

  /// SIGN UP
  void signUpWithEmailAndPassword() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password,).then((user) async {
        await FireStoreUser().addUserToFireStore(
            UserModel(userId: user.user!.uid,
                email: user.user!.email,
                name: user.user!.displayName,
                pic: ""),);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e);
    }
  }

  ///SAVE User Data

  /// show password methods
  void showHidePassword() {
    hidePass = !hidePass;
    update();
  }

  IconData passwordIcon() {
    return hidePass ? Icons.remove_red_eye : Icons.visibility_off;
  }


}
