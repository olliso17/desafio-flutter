import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:star_wars_flutter/models/species_constructor.dart';

class SpeciesApi {
  Future getDataSpecies(List url) async {
    print(url.toString());
    if (url.isNotEmpty) {
      http.Response response = await http.get(url.first);
      var decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return SpeciesConstructor.fromJson(decodedData);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
