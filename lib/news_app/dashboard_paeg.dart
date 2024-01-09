import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/news_app/detail_page.dart';

import '../api/api_service.dart';
import '../model/album_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ImagePicker picker = ImagePicker();
  final List<String> imageList = [
    "assets/images/profile_pic_1.jpg",
    "assets/images/profile_pic.jpg"
  ];

  XFile? image;
  bool isImageLoading = false;

  final _apiService = ApiService();

  Album? album;

  bool isApiLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAlbumData();
  }

  void loadAlbumData() async {
    setState(() {
      isApiLoading = true;
    });
    final data = await _apiService.fetchAlbum();
    album = data;
    setState(() {
      isApiLoading = false;
    });
    print(album?.email);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "News",
                icon: Icon(Icons.newspaper),
              ),
              Tab(
                text: "Images",
                icon: Icon(Icons.photo),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // -------- First Tab  --------------
            FirstTabView(imageList: imageList),
            // -------- Second Tab  --------------
            PageView.builder(
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    _onImageButtonPress();
                  },
                  child: Column(
                    children: [
                      if (!isImageLoading)
                        const CircularProgressIndicator.adaptive(),
                      if (image?.path != null)
                        SizedBox(
                          height: 200,
                          child: Image.file(
                            File(image!.path),
                          ),
                        ),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          imageList[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // -------- Third Tab  --------------
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: const Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/profile_pic.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("+977-98908080"),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("example.com@gmail.com"),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Gender:"),
                          Row(
                            children: [
                              Radio(
                                value: "Male",
                                groupValue: "Male",
                                onChanged: (String? value) {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Male"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Female",
                                groupValue: "Female",
                                onChanged: (String? value) {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Female"),
                            ],
                          ),
                        ],
                      ),
                      const Text("Hobbies:"),
                      Row(
                        children: [
                          const Text("1. Football:"),
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text("2. BasketBall:"),
                          Checkbox(value: false, onChanged: (value) {}),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Success"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  child: const Text("Ok"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Error"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                              title: const Text("Alert box"),
                              content: const Text("Are you sure ?"),
                            ),
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onImageButtonPress() async {
    setState(() {
      isImageLoading = true;
    });
    await picker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        image = value;
        isImageLoading = false;
      });
    });
  }
}

class FirstTabView extends StatelessWidget {
  const FirstTabView({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 7,
                  color: Colors.black.withOpacity(0.07),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset(
                    imageList[0],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Heading section",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "This is description of the app. This is description of the app. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              content: Text(
                                  "This is description of the app. This is description of the app./n This is description of the app. This is description of the app. This is description of the app. This is description of the app."),
                            );
                          },
                        );
                      },
                      child: const Text("Read More"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(),
                        //     settings: RouteSettings(
                        //       arguments: {}
                        //     )
                        //   ),
                        // );
                        //--- passing data with constructor -----
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RecommendtaionPage(
                              title: "Detail",
                              description: "This is description",
                            ),
                          ),
                        );
                        // ---- named routed with arguments -----
                        Navigator.of(context).pushNamed(
                          "/detailPage",
                          arguments: [
                            "name",
                            "info",
                            "address",
                          ],
                        );
                      },
                      child: const Text("Next Page"),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ListView(
                              shrinkWrap: true,
                              children: const [
                                ListTile(
                                  title: Text("Email"),
                                  leading: Icon(Icons.email),
                                ),
                                ListTile(
                                  title: Text("Call"),
                                  leading: Icon(Icons.phone),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 30),
      ),
    );
  }
}
