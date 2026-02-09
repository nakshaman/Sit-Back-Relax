import 'package:appknit/app/data/models/todo_model.dart';
import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final TodoModel toDo;
  final VoidCallback onTap;

  const ToDoCard({
    super.key,
    required this.toDo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('desc ${toDo.dueDateTime}');
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CHECK ICON
          GestureDetector(
            onTap: onTap,
            child: Icon(
              toDo.marked ? Icons.check_circle : Icons.radio_button_unchecked,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),

          // MAIN CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE + DATE ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Expanded(
                      child: Text(
                        toDo.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // DATE & TIME (TOP RIGHT)
                    if (toDo.dueDateTime != null)
                      Text(
                        _formatDateTime(toDo.dueDateTime!),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),

                // DESCRIPTION (FULL WIDTH BELOW)
                if (toDo.description.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      toDo.description,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime date) {
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

  return "${date.day} ${months[date.month - 1]} | "
      "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
}
