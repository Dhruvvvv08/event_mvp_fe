import 'package:event_demo_mac/features/auth/presentation/screens/email_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController progressController;
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    progressController.addListener(() {
      progress.value = progressController.value;
    });

    progressController.forward().whenComplete(() async {
      await Future.delayed(const Duration(milliseconds: 500));
     Get.to(EmailLogin());
    });
  }

  @override
  void onClose() {
    progressController.dispose();
    super.onClose();
  }
}
