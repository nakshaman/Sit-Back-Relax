import 'package:appknit/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailField extends GetView<LoginController> {
  const EmailField({
    super.key,
    required this.textController,
    required this.labelText,
  });
  final TextEditingController textController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              labelText,
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
        TextField(
          controller: textController,
          style: TextStyle(letterSpacing: 1.5, fontSize: 16),
          decoration: const InputDecoration(
            hintText: 'example@email.com',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
