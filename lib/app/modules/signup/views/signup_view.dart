import 'package:appknit/app/modules/login/widgets/email_field.dart';
import 'package:appknit/app/modules/login/widgets/login_button.dart';
import 'package:appknit/app/modules/login/widgets/password_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailField(
                  labelText: 'Name',
                  textController: controller.nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                EmailField(
                  labelText: 'E-Mail',
                  textController: controller.emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordField(
                  passwordController: controller.passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                LoginButton(
                  text: 'Sign up',
                  onPress: controller.signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
