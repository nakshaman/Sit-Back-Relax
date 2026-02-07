import 'package:appknit/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PasswordField extends GetView<LoginController> {
  const PasswordField({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Obx(
          () => TextField(
            obscureText: controller.isPasswordHidden.value,
            controller: passwordController,
            obscuringCharacter: '●',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 3,
              // color: Colors.grey,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.togglePassword,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
