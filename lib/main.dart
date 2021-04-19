import 'package:flutter/material.dart';
import 'package:star_wars_flutter/screens/characters.dart';
import 'package:star_wars_flutter/screens/people.dart';
import 'package:star_wars_flutter/screens/my_home_page.dart';
import 'package:star_wars_flutter/screens/planets.dart';
import 'package:star_wars_flutter/screens/species.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      title: 'Wiki Star Wars',
      home: MyHomePage(),
      initialRoute: MyHomePage.idRouts,
      routes: {
        MyHomePage.idRouts: (context) => MyHomePage(),
        People.idRouts: (context) => People(),
        CharactersData.idRouts: (context) => CharactersData(),
        Planets.idRouts: (context) => Planets(),
        Species.idRouts: (context) => Species(),
      },
    );
  }
}
