import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile_app/news_app/dashboard_paeg.dart';

class LoginController extends GetxController {
  var isSignInLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    isSignInLoading.value = true;
    if (formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));
      isSignInLoading.value = false;
      Get.to(const DashboardScreen());
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) => const DashboardScreen(),
      //   ),
      //   (route) => false,
      // );
    } else {
      isSignInLoading.value = false;
    }
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}
