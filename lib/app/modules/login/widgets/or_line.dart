import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 30,
            indent: 24,
            endIndent: 24,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Text(
          'or',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Divider(
            height: 30,
            indent: 24,
            endIndent: 24,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
