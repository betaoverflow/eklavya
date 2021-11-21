import 'package:flutter/material.dart';
import 'package:eklavya/config/color.dart';
import 'package:eklavya/config/fonts.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key, this.ratings}) : super(key: key);
  final ratings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
              ratings.toInt(),
              (index) =>
                  Icon(MIcons.star_fill_16, size: 12, color: MColor.yellow))
          .toList(),
    );
  }
}
