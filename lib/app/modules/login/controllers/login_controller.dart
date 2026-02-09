import 'package:appknit/app/data/services/auth_service.dart';
import 'package:appknit/app/modules/login/services/login_api.dart';
import 'package:appknit/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginWithFacebook() {}
  void loginWithApple() {}
  void loginWithGoogle() {}

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.closeAllSnackbars();
      Get.snackbar('Error', 'Name ,Email and Password is required');
      return;
    }

    if (isLoading.value) return;

    try {
      isLoading.value = true;

      final response = await LoginApi.login(email: email, password: password);

      // debugPrint("LOGIN RESPONSE: $response");

      final body = response["body"];
      final statusCode = response["statusCode"];

      Get.closeAllSnackbars(); //  stop stacked snackbars

      //  LOGIN SUCCESS (THIS IS THE ONLY SUCCESS CHECK)
      final accessToken = body?["data"]?["accessToken"];

      if (statusCode == 200 && accessToken != null) {
        // debugPrint("ACCESS TOKEN: $accessToken");
        final accessToken = body?["data"]?["accessToken"];
        Get.find<AuthService>().saveToken(accessToken);
        // Sucess snackbar
        Get.snackbar(
          "Success",
          body["message"] ?? "Login successful",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
          boxShadows: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
          titleText: Text(
            'Success',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            'Login completed successfully',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        );

        Get.offAllNamed(Routes.HOME);
        return;
      }

      // LOGIN FAILED
      Get.snackbar(
        "Login Failed",
        body?["message"] ?? "Invalid credentials",
      );
    } catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar("Error", "Server error. Try again");
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void signUp() {
    Get.toNamed(Routes.SIGNUP);
  }

  void forgotPassword() {}
}
