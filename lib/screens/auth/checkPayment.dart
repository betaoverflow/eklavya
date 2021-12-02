import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../chatRoom.dart';
import '../pricing.dart';
import 'loginScreen.dart';

void checkPaymentStatusAndRedirect(context) async {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  if (_auth.currentUser != null) {
    print(_auth.currentUser);
    var res =  await _firestore.collection("users").doc(_auth.currentUser!.uid).get();
    String plan = res.data()!["plan"];

    if (plan == "Free") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Pricing()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatRoomScreen()),
      );
    }
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}