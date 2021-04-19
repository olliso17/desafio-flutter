import 'package:flutter/material.dart';
import 'package:star_wars_flutter/components/text_characters.dart';

class ButtonPlanetsSpecies extends StatelessWidget {
  ButtonPlanetsSpecies({@required this.title, this.onpressed});
  final String title;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white24,
              Colors.white70,
              Colors.black,
            ],
          )),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      child: FlatButton(
          child: TextWidget(
            textList: title,
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          onPressed: onpressed),
    );
  }
}
