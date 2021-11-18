import 'package:flutter/material.dart';

class Mentorship extends StatefulWidget {
  const Mentorship({Key? key}) : super(key: key);

  @override
  _MentorshipState createState() => _MentorshipState();
}

class _MentorshipState extends State<Mentorship> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Mentorship Screen"),
    ));
  }
}
