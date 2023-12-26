import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Container(
        height: 400,
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
              onPressed: () {},
              child: const Text("elevated button"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Text button"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: const Icon(
          Icons.call,
          color: Colors.white,
        ),
      ),
    );
  }
}
