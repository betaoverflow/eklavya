import 'package:flutter/material.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({Key? key}) : super(key: key);

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Roadmap Screen"),
    ));
  }
}
