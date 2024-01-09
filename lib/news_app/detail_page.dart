import 'package:flutter/material.dart';
import 'package:profile_app/news_app/information_page.dart';
import 'package:profile_app/widgets/custom_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title, required this.description});
  final String title, description;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // final List? dataList = ModalRoute.of(context)?.settings.arguments as List?;
    // print(dataList);
    print(widget.description);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Go Back"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InformationPage(),
                ),
              );
            },
            child: Text("Next Page"),
          ),
          CustomBlueButton(
            textData: '',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class RecommendtaionPage extends StatelessWidget {
  const RecommendtaionPage(
      {super.key, required this.title, required this.description});
  final String title, description;

  @override
  Widget build(BuildContext context) {
    print(description);
    return const Placeholder();
  }
}
