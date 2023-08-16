import 'dart:async';

import 'package:get/get.dart';
import 'package:green_egypt/services/biometric_auth.dart';

class GetCashPageController extends GetxController {
  late bool userAuthorized;
  late double opacity;

  @override
  void onInit() async {
    opacity = 0;
    userAuthorized = false;
    await showBiometricAuth();
    super.onInit();
  }

  Future<void> showBiometricAuth() async {
    await BiometricController.instance
        .authinticateWithFingerprint(
            messageToUser: 'we need to verify that it is you first !!')
        .then((isAuthorized) {
      if (isAuthorized) {
        showUserQrcode();
      } else {}
    });
  }

  void showUserQrcode() {
    userAuthorized = true;
    update();
    Timer(Duration(milliseconds: 250), () {
      opacity = 1;
      update();
    });
  }
}
