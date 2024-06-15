import 'dart:async';
import 'package:ptkp/global_resources.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startSplashScreen();
    super.onInit();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, () async {
      Get.offAll(
        () => box.read('token') == null
            ? const LoginScreen()
            : const HomeScreen(),
      );
    });
  }
}
