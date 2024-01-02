import 'package:flutter/material.dart';
import 'package:profile_app/news_app/dashboard_paeg.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Page"),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DashboardScreen()),
              (route) => false);
        },
        child: Text("Next Page"),
      ),
    );
  }
}
