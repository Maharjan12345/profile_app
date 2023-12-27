import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // If you want to initialize or declare the variable write here

  List<String> dataList = ["Apple", "Ball", "Cat", "Bat", "Dog"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Profile App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // this widget allows us to make the body scrollable
        scrollDirection: Axis.vertical,
        child: Container(
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
                child: const Text("elevated button"),
              ),
            ],
          ),
        ),
        /* ---- Listview builder ----
          --- use this when your require only for limited widgets ---
         ListView(
          children: [
          Text("data"),
          Text("data"),
        ],
      ),
      */

        /* ---- Listview builder ----

          -- use this widget for unlimted widgets ----
        ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) => Text(
          dataList[index],
        ),
      ),
      */
        /* ---- Listview separated
          -- use this widget when you required a separator after a widget in the list ----
        ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 50,
        ),
        itemCount: dataList.length,
        itemBuilder: (context, index) => Text(
          dataList[index],
        ),
      ),
      */
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: const Icon(
          Icons.call,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade500,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: "Info",
          ),
        ],
      ),
    );
  }
}
