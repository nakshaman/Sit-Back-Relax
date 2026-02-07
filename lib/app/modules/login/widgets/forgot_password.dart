import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class ForgotPassword extends GetView<LoginController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: controller.forgotPassword,
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
