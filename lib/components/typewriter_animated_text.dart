import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypewriterAnimated extends StatelessWidget {
  const TypewriterAnimated(
      {@required this.tittle, @required this.colors, @required this.num});
  final String tittle;
  final Color colors;
  final double num;

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      text: [tittle],
      textAlign: TextAlign.center,
      textStyle: TextStyle(
        color: colors,
        fontSize: MediaQuery.of(context).size.height * num,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
