import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/components/button_planets_species.dart';
import 'package:star_wars_flutter/components/text_characters.dart';
import 'package:star_wars_flutter/components/typewriter_animated_text.dart';
import 'package:star_wars_flutter/models/people_constructor.dart';
import 'package:star_wars_flutter/providers/db_characters.dart';
import 'package:star_wars_flutter/screens/planets.dart';
import 'package:star_wars_flutter/screens/species.dart';

// ignore: must_be_immutable
class CharactersData extends StatefulWidget {
  static String idRouts = 'characters_data';
  int indexs;

  CharactersData({
    this.indexs,
  });

  @override
  _CharactersDataState createState() => _CharactersDataState();
}

class _CharactersDataState extends State<CharactersData> {
  Future<int> getIndex() async =>
      await Future.delayed(Duration(seconds: 3), () {
        return widget.indexs;
      });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: DBPeopleProvider.db.getAllPeopleConstructor(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            List<PeopleConstructor> listOfPeople = snapshot.data;
            print(listOfPeople);
            return Center(
              child: Container(
                height: height * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.white70,
                        Colors.white12,
                      ],
                    )),
                width: width,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.6,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TypewriterAnimated(
                              tittle: '${listOfPeople[widget.indexs].textName}',
                              colors: Colors.black,
                              num: 0.06,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextWidget(
                              textList:
                                  'Gênero: ${listOfPeople[widget.indexs].textGender}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Ano/Nascimento: ${listOfPeople[widget.indexs].textBirthYear}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Altura: ${listOfPeople[widget.indexs].numHeight}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Peso: ${listOfPeople[widget.indexs].numMass}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Cor da pele: ${listOfPeople[widget.indexs].textSkinColor}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Cor do cabelo: ${listOfPeople[widget.indexs].textHairColor}',
                              height: height * 0.04,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextWidget(
                              textList:
                                  'Cor dos olhos: ${listOfPeople[widget.indexs].textEyeColor}',
                              height: height * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ButtonPlanetsSpecies(
                            title: 'Planeta que Reside ou Residiu',
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Planets(
                                            url: listOfPeople[widget.indexs]
                                                .homerWorld,
                                          )));
                            }),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ButtonPlanetsSpecies(
                            title: 'Espécie',
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Species(
                                            url: listOfPeople[widget.indexs]
                                                .species,
                                          )));
                            })
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TypewriterAnimated(
                      tittle: 'Aguarde um instante',
                      colors: Colors.white,
                      num: 0.05),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
