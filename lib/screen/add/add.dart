import 'package:flutter/material.dart';

class  HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 49, 48, 48);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Add",
          style: TextStyle(
            color: Color.fromARGB(255, 248, 246, 246),
            fontSize: 22.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(" Add"),
      ),
    );
  }
}
