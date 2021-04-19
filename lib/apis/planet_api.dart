import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:star_wars_flutter/models/planet_constructor.dart';

class PlanetApi {
  Future getDataPlanet(String url) async {
    http.Response response = await http.get(url);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    if (response.statusCode == 200) {
      return PlanetConstructor.fromJson(decodedData);
    } else {
      print(response.statusCode);
    }
  }
}
