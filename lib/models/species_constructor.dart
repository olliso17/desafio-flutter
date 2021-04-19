import 'dart:convert';

List<SpeciesConstructor> specieFromJson(String str) =>
    List<SpeciesConstructor>.from(
        json.decode(str).map((x) => SpeciesConstructor.fromJson(x)));

String specieToJson(List<SpeciesConstructor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpeciesConstructor {
  String nameSpecies;
  String classification;
  String designation;
  dynamic averageHeight;
  String skinColors;
  String hairColors;
  String eyeColors;
  dynamic averageLifespan;
  String language;

  SpeciesConstructor({
    this.nameSpecies,
    this.classification,
    this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.language,
  });
  factory SpeciesConstructor.fromJson(Map<String, dynamic> json) {
    return SpeciesConstructor(
        nameSpecies: json['name'],
        classification: json['classification'],
        designation: json['designation'],
        averageHeight: json['average_height'],
        skinColors: json['skin_colors'],
        hairColors: json['hair_colors'],
        eyeColors: json['eye_colors'],
        averageLifespan: json['average_lifespan'],
        language: json['language']);
  }
  Map<String, dynamic> toJson() => {
        "name": nameSpecies,
        "classification": classification,
        "designation": designation,
        "average_height": averageHeight,
        "skin_colors": skinColors,
        "hair_colors": hairColors,
        "eye_colors": eyeColors,
        "average_lifespan": averageLifespan,
        "language": language,
      };
}
