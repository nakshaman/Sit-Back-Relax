import 'package:appknit/app/modules/signup/services/signup_api.dart';
import 'package:appknit/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      Get.snackbar('Error', 'Name , Email and Password required');
      return;
    }
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      final response = await SignUpApi.signup(
        name: name,
        email: email,
        password: password,
      );
      if (response["statusCode"] == 200 &&
          response["body"]["success"] == true) {
        Get.snackbar('Success', 'SignUp Successfull');
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
          'Email Verification',
          response["body"]["message"] ?? 'Something went Wrong',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Server error Try again');
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
