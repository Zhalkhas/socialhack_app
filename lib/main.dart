import 'package:flutter/material.dart';
import 'package:socialhack_app/widgets/map.dart';
import 'package:socialhack_app/widgets/orders.dart';
import 'package:socialhack_app/widgets/profile.dart';

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final listWidgets = [
    OrdersList(),
    MapWidget(),
    ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S0c1@l h@ck3rs"),
      ),
      body: listWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

void main() {
  runApp(MaterialApp(home: MainScreen()));
}
