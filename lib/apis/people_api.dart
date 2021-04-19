import 'package:dio/dio.dart';
import 'package:star_wars_flutter/models/people_constructor.dart';
import 'package:star_wars_flutter/providers/db_characters.dart';

class PeopleApiProvider {
  Future<List<PeopleConstructor>> getAllPeople() async {
    String next = '';
    int page = 1;
    List<PeopleConstructor> characters = [];
    await DBPeopleProvider.db.deleteAllPeopleConstructor();
    do {
      String url = 'https://swapi.dev/api/people/?page=$page';
      Response response = await Dio().get(url);
      Map<String, dynamic> data = response.data;
      List<dynamic> decodedData = data['results'];
      if (response.statusCode == 200) {
        for (int i = 0; i < decodedData.length; i++) {
          PeopleConstructor character =
              PeopleConstructor.fromJson(decodedData[i]);
          characters.add(character);
          await DBPeopleProvider.db.createPeopleConstructor(character);
        }
      } else {
        print(response.statusCode);
      }
      next = data['next'];
      page++;
    } while (next != null);
    return characters;
  }
}
