import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({@required this.textList, this.height});
  final String textList;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Text(
      textList,
      style: TextStyle(
        color: Colors.black,
        fontSize: height,
      ),
    );
  }
}
