import 'package:flutter/material.dart';

class ContainerPlanetsSpecies extends StatelessWidget {
  const ContainerPlanetsSpecies({
    @required this.list,
  });
  final ListView list;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white70,
                Colors.white38,
              ],
            )),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: list,
        ),
      ),
    );
  }
}
