import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addtodo_controller.dart';
import '../widgets/title_section.dart';
import '../widgets/description_section.dart';
import '../widgets/date_time_section.dart';
import '../widgets/add_button.dart';

class AddtodoView extends GetView<AddtodoController> {
  const AddtodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Add Item',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            TitleSection(),
            SizedBox(height: 24),
            DescriptionSection(),
            SizedBox(height: 20),
            DateTimeSection(),
            Spacer(),
            AddButton(),
          ],
        ),
      ),
    );
  }
}
