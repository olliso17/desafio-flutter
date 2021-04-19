import 'package:flutter/material.dart';
import 'package:star_wars_flutter/apis/people_api.dart';
import 'package:star_wars_flutter/components/typewriter_animated_text.dart';
import 'package:star_wars_flutter/screens/people.dart';

class MyHomePage extends StatefulWidget {
  static String idRouts = 'home_page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getAllPeople;
  @override
  void initState() {
    super.initState();
    getAllPeople = PeopleApiProvider().getAllPeople();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getAllPeople,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/espaco2.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        TypewriterAnimated(
                          tittle: 'Bem Vindos ao Wiki de Star Wars',
                          colors: Colors.white54,
                          num: 0.05,
                        ),
                        SizedBox(
                          height: height * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 3),
                            ],
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: width * 0.9,
                          height: height * 0.3,
                          child: FlatButton(
                            focusColor: Colors.grey,
                            child: Image.asset('images/starWars.jpg'),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, People.idRouts);
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    ),
                  );
                }
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
              }),
        ),
      ),
    );
  }
}
