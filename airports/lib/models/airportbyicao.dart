// To parse this JSON data, do
//
//     final airportByIcaoModel = airportByIcaoModelFromJson(jsonString);

import 'dart:convert';

AirportByIcaoModel airportByIcaoModelFromJson(String str) =>
    AirportByIcaoModel.fromJson(json.decode(str));

String airportByIcaoModelToJson(AirportByIcaoModel data) =>
    json.encode(data.toJson());

class AirportByIcaoModel {
  AirportByIcaoModel({
    required this.icao,
    required this.iata,
    this.shortName,
    this.fullName,
    this.municipalityName,
    this.location,
    this.country,
    this.continent,
    this.timeZone,
    this.urls,
    this.runways,
    this.currentTime,
  });

  String icao;
  String iata;
  String? shortName;
  String? fullName;
  String? municipalityName;
  Location? location;
  Continent? country;
  Continent? continent;
  String? timeZone;
  Map<String, dynamic>? urls;
  Runway? runways;
  CurrentTime? currentTime;

  factory AirportByIcaoModel.fromJson(Map<String, dynamic> json) =>
      AirportByIcaoModel(
        icao: json["icao"],
        iata: json["iata"],
        shortName: json["shortName"],
        fullName: json["fullName"],
        municipalityName: json["municipalityName"],
        location: Location.fromJson(json["location"]),
        country: Continent.fromJson(json["country"]),
        continent: Continent.fromJson(json["continent"]),
        timeZone: json["timeZone"],
        urls: json["urls"],
        runways:
            json["runways"] != null ? Runway.fromJson(json["runways"]) : null,
        currentTime: json["currentTime"] != null
            ? CurrentTime.fromJson(json["currentTime"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
        "shortName": shortName,
        "fullName": fullName,
        "municipalityName": municipalityName,
        "location": location?.toJson(),
        "country": country?.toJson(),
        "continent": continent?.toJson(),
        "timeZone": timeZone,
        "urls": urls,
        "runways": runways?.toJson(),
        "currentTime": currentTime?.toJson(),
      };
}

class Continent {
  Continent({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class CurrentTime {
  CurrentTime({
    required this.utcTime,
    required this.localTime,
  });

  DateTime utcTime;
  DateTime localTime;

  factory CurrentTime.fromJson(Map<String, dynamic> json) => CurrentTime(
        utcTime: DateTime.parse(json["utcTime"]),
        localTime: DateTime.parse(json["localTime"]),
      );

  Map<String, dynamic> toJson() => {
        "utcTime": utcTime.toIso8601String(),
        "localTime": localTime.toIso8601String(),
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

class Runway {
  Runway({
    this.name,
    this.trueHdg,
    this.length,
    this.width,
    this.isClosed,
    this.location,
    this.surface,
    this.displacedThreshold,
    this.hasLighting,
  });

  String? name;
  double? trueHdg;
  DisplacedThreshold? length;
  DisplacedThreshold? width;
  bool? isClosed;
  Location? location;
  Surface? surface;
  DisplacedThreshold? displacedThreshold;
  bool? hasLighting;

  factory Runway.fromJson(Map<String, dynamic> json) => Runway(
        name: json["name"],
        trueHdg: json["trueHdg"].toDouble(),
        length: DisplacedThreshold.fromJson(json["length"]),
        width: DisplacedThreshold.fromJson(json["width"]),
        isClosed: json["isClosed"],
        location: Location.fromJson(json["location"]),
        surface: surfaceValues.map[json["surface"]],
        displacedThreshold:
            DisplacedThreshold.fromJson(json["displacedThreshold"]),
        hasLighting: json["hasLighting"],
      );

  Map<String, dynamic>? toJson() => {
        "name": name,
        "trueHdg": trueHdg,
        "length": length?.toJson(),
        "width": width?.toJson(),
        "isClosed": isClosed,
        "location": location?.toJson(),
        "surface": surfaceValues.reverse[surface],
        "displacedThreshold": displacedThreshold?.toJson(),
        "hasLighting": hasLighting,
      };
}

class DisplacedThreshold {
  DisplacedThreshold({
    this.meter,
    this.km,
    this.mile,
    this.nm,
    this.feet,
  });

  double? meter;
  double? km;
  double? mile;
  double? nm;
  int? feet;

  factory DisplacedThreshold.fromJson(Map<String, dynamic> json) =>
      DisplacedThreshold(
        meter: json["meter"].toDouble(),
        km: json["km"].toDouble(),
        mile: json["mile"].toDouble(),
        nm: json["nm"].toDouble(),
        feet: json["feet"],
      );

  Map<String, dynamic>? toJson() => {
        "meter": meter,
        "km": km,
        "mile": mile,
        "nm": nm,
        "feet": feet,
      };
}

enum Surface { ASPHALT }

final surfaceValues = EnumValues({"Asphalt": Surface.ASPHALT});

class Urls {
  Urls({
    this.webSite,
    this.wikipedia,
    this.twitter,
    this.googleMaps,
    this.liveAtc,
    this.flightRadar,
  });

  String? webSite;
  String? wikipedia;
  String? twitter;
  String? googleMaps;
  String? liveAtc;
  String? flightRadar;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        webSite: json["webSite"],
        wikipedia: json["wikipedia"],
        twitter: json["twitter"],
        googleMaps: json["googleMaps"],
        liveAtc: json["liveAtc"],
        flightRadar: json["flightRadar"],
      );

  Map<String, dynamic>? toJson() => {
        "webSite": webSite,
        "wikipedia": wikipedia,
        "twitter": twitter,
        "googleMaps": googleMaps,
        "liveAtc": liveAtc,
        "flightRadar": flightRadar,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
