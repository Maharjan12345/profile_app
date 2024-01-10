import 'package:flutter/material.dart';
import 'package:profile_app/news_app/dashboard_paeg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignInLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _formKey,
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
              controller: _usernameController,
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
              controller: _passwordController,
              validator: (value) {
                return validatePassword(value ?? '');
              },
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                height: 60,
                onPressed: isSignInLoading ? () {} : () => _signIn(context),
                child: isSignInLoading
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
          ],
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    setState(() => isSignInLoading = true);
    if (_formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() => isSignInLoading = false);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
        (route) => false,
      );
    } else {
      setState(() => isSignInLoading = false);
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
