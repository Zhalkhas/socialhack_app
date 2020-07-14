import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget{
  final List data = new List.generate(20, (index) => index+1);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.person_outline),
      title: Text("Order $index"),
      subtitle: Text("Address of $index"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),),
  );

}