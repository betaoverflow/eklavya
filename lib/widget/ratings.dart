import 'package:flutter/material.dart';
import 'package:eklavya/config/fonts.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key, this.ratings}) : super(key: key);
  final ratings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          List.generate(ratings.toInt(), (index) => Icon(Icons.star)).toList(),
    );
  }
}
