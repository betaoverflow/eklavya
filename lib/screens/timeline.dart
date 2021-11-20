import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required this.item}) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(item), fit: BoxFit.cover))),
        ));
  }
}
