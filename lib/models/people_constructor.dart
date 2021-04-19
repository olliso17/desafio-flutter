import 'dart:convert';

List<PeopleConstructor> peopleFromJson(String str) =>
    List<PeopleConstructor>.from(
        json.decode(str).map((x) => PeopleConstructor.fromJson(x)));

String peopleToJson(List<PeopleConstructor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PeopleConstructor {
  String homerWorld;
  String textName;
  String textGender;
  String textHairColor;
  String textSkinColor;
  String textEyeColor;
  String textBirthYear;
  int numHeight;
  double numMass;
  List<dynamic> films;
  List<dynamic> species;
  List<dynamic> vehicles;

  PeopleConstructor({
    this.homerWorld,
    this.numMass,
    this.numHeight,
    this.textName,
    this.textGender,
    this.textBirthYear,
    this.textEyeColor,
    this.textHairColor,
    this.textSkinColor,
    this.films,
    this.species,
    this.vehicles,
  });

  factory PeopleConstructor.fromJson(Map<String, dynamic> json) {
    return PeopleConstructor(
      textName: json['name'],
      textGender: json['gender'],
      numHeight: (json['height'] != 'unknown')
          ? int.parse(json['height'].toString())
          : 0,
      numMass: (json['mass'] != 'unknown')
          ? double.parse(json['mass'].toString().replaceAll(',', '.'))
          : 0.00,
      textBirthYear: json['birth_year'],
      textEyeColor: json['eye_color'],
      textHairColor: json['hair_color'],
      textSkinColor: json['skin_color'],
      homerWorld: json['homeworld'],
      films: json['films'],
      species: json['species'],
      vehicles: json['vehicles'],
    );
  }
  factory PeopleConstructor.fromDB(Map<String, dynamic> json) {
    print(json.toString());
    return PeopleConstructor(
      textName: json['name'],
      textGender: json['gender'],
      numHeight: json['height'],
      numMass: json['mass'],
      textBirthYear: json['birth_year'],
      textEyeColor: json['eye_color'],
      textHairColor: json['hair_color'],
      textSkinColor: json['skin_color'],
      homerWorld: json['homeworld'],
      films: json['films'] != '' ? json['films'].split(',') : [],
      species: json['species'] != '' ? json['species'].split(',') : [],
      vehicles: json['vehicles'] != '' ? json['vehicles'].split(',') : [],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": textName,
        "gender": textGender,
        "height": numHeight,
        "mass": numMass,
        "birth_year": textBirthYear,
        "eye_color": textEyeColor,
        "hair_color": textHairColor,
        "skin_color": textSkinColor,
        "homeworld": homerWorld,
        "films": films.join(','),
        "species": species.join(','),
        "vehicles": vehicles.join(','),
      };
}
