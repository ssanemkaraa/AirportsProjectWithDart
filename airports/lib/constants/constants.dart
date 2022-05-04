import 'package:flutter/material.dart';

class ProjectConstants {
  static const String maintitle = 'Airports Project';
  static const String logintitle = 'Giriş';

  static const String mainimage =
      'https://cdn.pixabay.com/photo/2020/05/24/23/37/airplane-5216583_960_720.jpg';

  static const String errorimage =
      'https://cdn.pixabay.com/photo/2020/05/24/23/37/airplane-5216583_960_720.jpg';

  static const String usernameLabel = 'Kullanıcı Adı';
  static const String passwordLabel = 'Parola';
}

class ApiConstants {
  static const String apiRootUrl = "https://aerodatabox.p.rapidapi.com";

  static const String endpointAirportByIcaoCode =
      apiRootUrl + "/airports/icao/";

  static const String endpointAirportByFreeText =
      apiRootUrl + "/airports/search/term?q=";

  static const Map<String, dynamic> apiHeader = {
    "X-RapidAPI-Host": "aerodatabox.p.rapidapi.com",
    "X-RapidAPI-Key": "51c6a5f2b0mshd37f683f251bd09p15042ajsn2900e9497e73"
  };
}

class MediaQueryConstants {
  static double height01(context) => MediaQuery.of(context).size.height * 0.01;
  static double height05(context) => MediaQuery.of(context).size.height * 0.05;
  static double height10(context) => MediaQuery.of(context).size.height * 0.10;
  static double height20(context) => MediaQuery.of(context).size.height * 0.20;
  static double height30(context) => MediaQuery.of(context).size.height * 0.30;
  static double height40(context) => MediaQuery.of(context).size.height * 0.40;
  static double height50(context) => MediaQuery.of(context).size.height * 0.50;
  static double height60(context) => MediaQuery.of(context).size.height * 0.60;
  static double height70(context) => MediaQuery.of(context).size.height * 0.70;
  static double height80(context) => MediaQuery.of(context).size.height * 0.80;
  static double height90(context) => MediaQuery.of(context).size.height * 0.90;
  static double height100(context) => MediaQuery.of(context).size.height;

  static double width01(context) => MediaQuery.of(context).size.width * 0.01;
  static double width05(context) => MediaQuery.of(context).size.width * 0.05;
  static double width10(context) => MediaQuery.of(context).size.width * 0.10;
  static double width20(context) => MediaQuery.of(context).size.width * 0.20;
  static double width30(context) => MediaQuery.of(context).size.width * 0.30;
  static double width40(context) => MediaQuery.of(context).size.width * 0.40;
  static double width50(context) => MediaQuery.of(context).size.width * 0.50;
  static double width60(context) => MediaQuery.of(context).size.width * 0.60;
  static double width70(context) => MediaQuery.of(context).size.width * 0.70;
  static double width80(context) => MediaQuery.of(context).size.width * 0.80;
  static double width90(context) => MediaQuery.of(context).size.width * 0.90;
  static double width100(context) => MediaQuery.of(context).size.width;
}

class TextSizeConstants {
  static const double small = 12.0;
  static const double normal = 17.0;
  static const double big = 42.0;
}
