import 'package:flutter/material.dart';
import 'package:star_wars_flutter/apis/species_api.dart';
import 'package:star_wars_flutter/components/container_planets_species.dart';
import 'package:star_wars_flutter/components/text_characters.dart';
import 'package:star_wars_flutter/components/typewriter_animated_text.dart';
import 'package:star_wars_flutter/models/species_constructor.dart';

// ignore: must_be_immutable
class Species extends StatefulWidget {
  static String idRouts = 'species_';
  List url;

  Species({this.url});
  @override
  _SpeciesState createState() => _SpeciesState();
}

class _SpeciesState extends State<Species> {
  Future getSpecie;
  @override
  void initState() {
    super.initState();
    getSpecie = SpeciesApi().getDataSpecies(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
              future: getSpecie,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  SpeciesConstructor specie = snapshot.data;
                  return Center(
                    child: ContainerPlanetsSpecies(
                      list: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TypewriterAnimated(
                            tittle: '${specie.nameSpecies}',
                            colors: Colors.black,
                            num: 0.05,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          TextWidget(
                            textList:
                                'Classificação: ${specie.classification} ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Designção: ${specie.designation} ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Altura média: ${specie.averageHeight} ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Cores da pele: ${specie.skinColors}. ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Cores do cabelo: ${specie.hairColors}. ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Cores dos olhos: ${specie.eyeColors}. ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Longevidade: ${specie.averageLifespan} ',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextWidget(
                            textList: 'Linguagem: ${specie.language} ',
                            height: height * 0.04,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  if (snapshot.data == null) {
                    return RaisedButton(
                        child: TextWidget(
                            textList: 'Espécie não identificada',
                            height: height * 0.04),
                        onPressed: () {
                          Navigator.pop(context);
                        });
                  } else {
                    return TextWidget(
                        textList: 'Espécie não identificada',
                        height: height * 0.04);
                  }
                }
              })),
    );
  }
}
