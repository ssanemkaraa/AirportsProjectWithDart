// To parse this JSON data, do
//
//     final airportByFreeTextModel = airportByFreeTextModelFromJson(jsonString);

import 'dart:convert';

AirportByFreeTextModel airportByFreeTextModelFromJson(String str) =>
    AirportByFreeTextModel.fromJson(json.decode(str));

String airportByFreeTextModelToJson(AirportByFreeTextModel data) =>
    json.encode(data.toJson());

class AirportByFreeTextModel {
  AirportByFreeTextModel({
    required this.icao,
    required this.iata,
    required this.name,
    required this.shortName,
    required this.municipalityName,
    required this.location,
    required this.countryCode,
  });

  String icao;
  String iata;
  String name;
  String shortName;
  String municipalityName;
  Location location;
  String countryCode;

  factory AirportByFreeTextModel.fromJson(Map<String, dynamic> json) =>
      AirportByFreeTextModel(
        icao: json["icao"],
        iata: json["iata"],
        name: json["name"],
        shortName: json["shortName"] ?? "",
        municipalityName: json["municipalityName"] ?? "",
        location: Location.fromJson(json["location"]),
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
        "name": name,
        "shortName": shortName,
        "municipalityName": municipalityName,
        "location": location.toJson(),
        "countryCode": countryCode,
      };
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
