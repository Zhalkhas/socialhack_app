import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.all(50),
          child: ListTile(
            title: Text("Volunteer Volunteerovich"),
            subtitle: Text("Have 4000 babushkas served"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("pressed???"),
        child: Icon(Icons.person),
      ));
}
