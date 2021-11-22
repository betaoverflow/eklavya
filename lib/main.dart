import 'package:eklavya/screens/onboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:eklavya/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
