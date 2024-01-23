import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _loginController.formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: height * 0.1),
            const LogoTile(),
            const SizedBox(height: 20),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!!!",
                ),
                Text(
                  "This is the best news app in the world.",
                ),
              ],
            ),
            const SizedBox(height: 50),
            CustomFormField(
              hintText: "Username",
              controller: _loginController.usernameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username cannot be empty';
                } else if (value.length < 6) {
                  return "Username should be more than 6 characters ";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomFormField(
              hintText: "Password",
              controller: _loginController.passwordController,
              validator: (value) {
                return _loginController.validatePassword(value ?? '');
              },
            ),
            const SizedBox(height: 90),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                  color: Colors.blue,
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: _loginController.isSignInLoading.value
                      ? () {}
                      : () => _loginController.signIn(),
                  child: _loginController.isSignInLoading.value
                      ? const CircularProgressIndicator.adaptive()
                      : Text(
                          "Sign In".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: validator,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          labelText: hintText,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}

class LogoTile extends StatelessWidget {
  const LogoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: ClipOval(
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
