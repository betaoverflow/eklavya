import 'package:flutter/material.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({Key? key}) : super(key: key);

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Opportunities Screen"),
    ));
  }
}
