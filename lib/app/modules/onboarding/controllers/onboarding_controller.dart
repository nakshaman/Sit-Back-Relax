import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      "title": "Find and provide great services easily",
      "image": "assets/images/onboard1.png",
    },
    {
      "title": "In app direct messages to service providers",
      "image": "assets/images/onboard2.png",
    },
    {
      "title":
          "Rate and Review your favourite service providers on the Platform",
      "image": "assets/images/onboard3.png",
    },
  ];
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.offAllNamed('/login');
    }
  }

  void skip() {
    pageController.jumpToPage(pages.length - 1);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
