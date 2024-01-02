import 'package:flutter/material.dart';
import 'package:profile_app/news_app/dashboard_paeg.dart';
import 'package:profile_app/news_app/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routes: {
      //   "/detailPage": (context) => DetailPage(),
      // },
      home: const DashboardScreen(),
    );
  }
}
