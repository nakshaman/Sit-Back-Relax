import 'package:appknit/app/modules/login/widgets/email_field.dart';
import 'package:appknit/app/modules/login/widgets/forgot_password.dart';
import 'package:appknit/app/modules/login/widgets/login_footer.dart';
import 'package:appknit/app/modules/login/widgets/login_button.dart';
import 'package:appknit/app/modules/login/widgets/login_header.dart';
import 'package:appknit/app/modules/login/widgets/or_line.dart';
import 'package:appknit/app/modules/login/widgets/password_field.dart';
import 'package:appknit/app/modules/login/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              LoginHeader(),
              SizedBox(
                height: 48,
              ),
              SocialButtons(),
              SizedBox(
                height: 24,
              ),
              OrLine(),
              SizedBox(
                height: 24,
              ),
              EmailField(
                labelText: 'Email',
                textController: controller.emailController,
              ),
              SizedBox(
                height: 16,
              ),
              PasswordField(
                passwordController: controller.passwordController,
              ),
              SizedBox(
                height: 32,
              ),
              LoginButton(
                text: 'Login',
                onPress: controller.login,
              ),
              SizedBox(
                height: 16,
              ),
              ForgotPassword(),
              Spacer(),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
