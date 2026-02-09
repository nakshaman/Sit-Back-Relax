import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import '../controllers/addtodo_controller.dart';

class DateTimeSection extends GetView<AddtodoController> {
  const DateTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Due Date',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _dateField(context),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Due Time',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _timeField(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dateField(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.pickDate(context),
        child: _box(
          Icons.calendar_today,
          controller.selectedDate.value == null
              ? "DD MM YYYY"
              : _formatDate(controller.selectedDate.value!),
        ),
      ),
    );
  }

  Widget _timeField(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.pickTime(context),
        child: _box(
          Icons.access_time,
          controller.selectedTime.value == null
              ? "HH:MM"
              : controller.selectedTime.value!.format(context),
        ),
      ),
    );
  }

  Widget _box(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: text == "DD MM YYYY" || text == "HH:MM"
                  ? Colors.grey.shade500
                  : Colors.white,
            ),
          ),
          Spacer(),
          Icon(icon, color: Colors.white, size: 18),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final day = date.day;
    final month = months[date.month - 1];
    final year = date.year;

    return "$day $month $year";
  }
}
