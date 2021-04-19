import 'dart:convert';

List<PlanetConstructor> planetFromJson(String str) =>
    List<PlanetConstructor>.from(
        json.decode(str).map((x) => PlanetConstructor.fromJson(x)));

String planetToJson(List<PlanetConstructor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlanetConstructor {
  String namePlanet;
  dynamic rotationPlanet;
  dynamic orbitalPlanet;
  dynamic diameter;
  String climate;
  dynamic gravity;
  String terrain;
  dynamic surfaceWater;
  dynamic population;

  PlanetConstructor({
    this.namePlanet,
    this.rotationPlanet,
    this.orbitalPlanet,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
  });

  factory PlanetConstructor.fromJson(
    Map<String, dynamic> json,
  ) {
    return PlanetConstructor(
        namePlanet: json['name'],
        rotationPlanet: json['rotation_period'],
        orbitalPlanet: json['orbital_period'],
        diameter: json['diameter'],
        climate: json['climate'],
        gravity: json['gravity'],
        terrain: json['terrain'],
        surfaceWater: json['surface_water'],
        population: json['population']);
  }
  Map<String, dynamic> toJson() => {
        "name": namePlanet,
        "rotation_period": rotationPlanet,
        "orbital_period": orbitalPlanet,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
      };
}
