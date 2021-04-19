import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:star_wars_flutter/components/text_characters.dart';
import 'package:star_wars_flutter/components/typewriter_animated_text.dart';
import 'package:star_wars_flutter/models/people_constructor.dart';
import 'package:star_wars_flutter/providers/db_characters.dart';
import 'package:star_wars_flutter/screens/characters.dart';

class People extends StatefulWidget {
  static String idRouts = 'list_star_war';
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  TextEditingController nameController = TextEditingController();
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 90,
    keepScrollOffset: true,
  );

  // ignore: missing_return

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: DBPeopleProvider.db.getAllPeopleConstructor(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                List<PeopleConstructor> listOfPeople = snapshot.data;
                print(listOfPeople.toString());
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black,
                      Colors.black87,
                    ],
                  )),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      height: height * 0.07,
                      child: TextField(
                        controller: nameController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          hintText: 'Escreva o nome do Personagem',
                          hintStyle: TextStyle(
                              color: Colors.black, fontSize: height * 0.03),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: listOfPeople.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
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
                                width: width * 0.8,
                                height: height * 0.25,
                                child: FlatButton(
                                    splashColor: Colors.amberAccent,
                                    child: ListView(
                                      children: [
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        TypewriterAnimated(
                                          tittle:
                                              '${listOfPeople[index].textName}',
                                          colors: Colors.black,
                                          num: 0.04,
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Center(
                                          child: TextWidget(
                                            textList:
                                                'Gênero: ${listOfPeople[index].textGender}',
                                            height: height * 0.03,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              textList:
                                                  'Altura: ${listOfPeople[index].numHeight}',
                                              height: height * 0.03,
                                            ),
                                            TextWidget(
                                              textList:
                                                  'Peso: ${listOfPeople[index].numMass} Kg',
                                              height: height * 0.03,
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            splashColor: Colors.amberAccent,
                                            icon: Icon(
                                              Icons.whatshot,
                                              color: Colors.black,
                                              size: height * 0.05,
                                            ),
                                            onPressed: () {}),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CharactersData(
                                            indexs: index,
                                          ),
                                        ),
                                      );
                                      print(index);
                                    }),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                            ],
                          );
                        }),
                  ]),
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
            },
          ),
        ),
      ),
    );
  }
}
