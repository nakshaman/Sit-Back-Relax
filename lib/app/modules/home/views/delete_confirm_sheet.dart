import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> showDeleteConfirmSheet() {
  return Get.bottomSheet<bool>(
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Delete Item',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Are you sure you want to delete this item?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24, height: 1),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Get.back(result: true),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => Get.back(result: false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    isDismissible: true,
    backgroundColor: Colors.transparent,
  );
}
