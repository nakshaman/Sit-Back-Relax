import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginFooter extends GetView<LoginController> {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account ? ",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        GestureDetector(
          onTap: controller.signUp,
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.green, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
