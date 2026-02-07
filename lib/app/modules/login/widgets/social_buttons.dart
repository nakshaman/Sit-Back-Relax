import 'package:appknit/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SocialButtons extends GetView<LoginController> {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 15,
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: _button(
            imagePath: 'assets/icons/facebook@2x.png',
            onTap: controller.loginWithFacebook,
          ),
        ),
        Expanded(
          child: _button(
            imagePath: 'assets/icons/apple@2x.png',
            onTap: controller.loginWithApple,
          ),
        ),
        Expanded(
          child: _button(
            imagePath: 'assets/icons/google@2x.png',
            onTap: controller.loginWithGoogle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

Widget _button({required String imagePath, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.blue,
      ),
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}
