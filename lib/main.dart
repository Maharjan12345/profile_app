import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/login/screen/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('en', 'US'),
      // routes: {
      //   "/detailPage": (context) => DetailPage(),
      // },
      home: const LoginPage(),
    );
  }
}
