import 'dart:developer';

import 'package:fashion_store/model/user_model.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var userInfo =
      UserModel(id: '', orders: [], favourites: [], name: '', email: '').obs;

  bool isVisiable = false;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  bool get getIsVisiable => isVisiable;
  void get setIsVisible {
    isVisiable = !isVisiable;
    update();
  }

  bool isLoading = false;
  bool get getIsLoading => isLoading;
  void get setIsLoading {
    isLoading = !isLoading;
    update();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn google = GoogleSignIn();
  void signUpToFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      update();
      setUserInfo(
        name: name,
        email: email,
      );
      update();
      await getUserInfo();
      Get.offNamed(Routes.mainPage);
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'weak-password') {
        message = 'Your password is so weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'This account is already used';
      } else {
        message = title;
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString().replaceAll(RegExp('-'), ' '),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  void logInToFirebase(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      update();
      await getUserInfo();
      Get.offNamed(Routes.mainPage);
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'user-not-found') {
        message = 'email not found';
      } else if (error.code == 'wrong-password') {
        message = 'Password isn`t correct';
      } else {
        message = title;
      }
      Get.snackbar(
        title,
        snackPosition: SnackPosition.BOTTOM,
        message,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString().replaceAll(RegExp('-'), ' '),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  void get logInWithGoogle async {
    try {
      final GoogleSignInAccount? googleUser = await google.signIn();
      setUserInfo(
        name: googleUser!.displayName!,
        email: googleUser.email,
      );
      update();
      await getUserInfo();
      Get.offNamed(Routes.mainPage);
    } catch (error) {
      log(error.toString());
      Get.snackbar(
        'Error',
        error.toString().replaceAll(RegExp('-'), ' '),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  void sendPasswordRestEmail({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'user-not-found') {
        message = 'email not found';
      } else if (error.code == 'wrong-password') {
        message = 'Password isn`t correct';
      } else {
        message = title;
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString().replaceAll(RegExp('-'), ' '),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  void logOutToFirebase() async {
    try {
      await auth.signOut();
      await google.signOut();
      update();
      Get.offNamed(Routes.logInPage);
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'weak-password') {
        message = 'Your password is so weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'This account is already used';
      } else {
        message = title;
      }
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        title,
        message,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    } catch (error) {
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        error.toString().replaceAll(RegExp('-'), ' '),
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  void setUserInfo({
    required String name,
    required String email,
  }) async {
    UserModel userModel = UserModel(
        orders: [],
        favourites: [],
        name: name,
        email: email,
        id: FirebaseAuth.instance.currentUser!.uid);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toJson(userModel));
      update();
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        error.code.toString().replaceAll(RegExp('-'), ' '),
        error.message!,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        borderRadius: 20,
      );
    }
  }

  Future<void> getUserInfo() async {
    final String uuid = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uuid).get();
      final Map<String, dynamic>? data = documentSnapshot.data();
      userInfo.value = UserModel.fromJson(data!);
    } catch (e) {
      log(e.toString());
    }
  }
}
