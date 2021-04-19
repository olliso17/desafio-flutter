import 'package:flutter/material.dart';
import 'package:star_wars_flutter/apis/planet_api.dart';
import 'package:star_wars_flutter/components/container_planets_species.dart';
import 'package:star_wars_flutter/components/text_characters.dart';
import 'package:star_wars_flutter/components/typewriter_animated_text.dart';
import 'package:star_wars_flutter/models/planet_constructor.dart';

// ignore: must_be_immutable
class Planets extends StatefulWidget {
  static String idRouts = 'planets_';

  String url;

  Planets({
    this.url,
  });
  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  Future getPlanet;
  @override
  void initState() {
    super.initState();
    getPlanet = PlanetApi().getDataPlanet(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
              future: getPlanet,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  PlanetConstructor planet = snapshot.data;
                  return Center(
                    child: ContainerPlanetsSpecies(
                      list: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          TypewriterAnimated(
                            tittle: 'Planeta ${planet.namePlanet}',
                            colors: Colors.black,
                            num: 0.05,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          TextWidget(
                            textList: 'Rotação: ${planet.rotationPlanet}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'Órbita: ${planet.orbitalPlanet}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'Diâmetro: ${planet.diameter}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'Clima: ${planet.climate}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'Gravidade: ${planet.gravity}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'Terreno: ${planet.terrain}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList:
                                'Água da Superfície: ${planet.surfaceWater}',
                            height: height * 0.04,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextWidget(
                            textList: 'População: ${planet.population}',
                            height: height * 0.04,
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
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
              })),
    );
  }
}
