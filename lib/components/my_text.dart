import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String giveText;
  final double fontSize;
  final Color color;
  const MyText({
    super.key,
    required this.giveText,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      giveText,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
