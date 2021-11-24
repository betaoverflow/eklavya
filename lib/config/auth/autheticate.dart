import 'package:eklavya/screens/auth/loginScreen.dart';
import 'package:eklavya/screens/chatRoom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return ChatRoomScreen();
    } else {
      return LoginScreen();
    }
  }
}
