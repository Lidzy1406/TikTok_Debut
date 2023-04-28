import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 49, 48, 48);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Home",
          style: TextStyle(
            color: Color.fromARGB(255, 248, 246, 246),
            fontSize: 22.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Color.fromARGB(255, 250, 249, 249),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(" Home"),
      ),
    );
  }
}
