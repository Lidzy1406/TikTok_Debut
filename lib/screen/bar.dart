import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';


import 'add/add.dart';
import 'home/home.dart';
import 'profil/profil.dart';

const _kPages = <String, Widget>{
  'home': HomePage(),
  'add ':VideoPickerScreen(),
  'profil': ProfilPage(),
};

class BarPage extends StatefulWidget {
  const BarPage({super.key});

  @override
  _BarPage createState() => _BarPage();
}

class _BarPage extends State<BarPage> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  for (final icon in _kPages.values) icon,
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          style: _tabStyle,
          backgroundColor: Color.fromARGB(255, 17, 17, 17),
          items: const <TabItem>[
            TabItem(icon: Icon(Icons.house_outlined,color: Colors.white,), title: 'Home'),
            TabItem(icon: Icon(Icons.add_circle_outline, color: Colors.white), title: ' add'),
            TabItem(icon: Icon(Icons.account_circle_outlined, color: Colors.white,), title: 'Profil'),
          ],
          color: Color.fromARGB(255, 253, 250, 250),
          activeColor: Colors.yellow[600],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}