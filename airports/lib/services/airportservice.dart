import 'dart:convert';
import 'package:airports/constants/constants.dart';
import 'package:airports/models/airportbyicao.dart';
import 'package:airports/models/airportbyfreetextmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AirportService {
  static Future<List<AirportByFreeTextModel>> getAirportByFreeText(
      {required String text}) async {
    List<AirportByFreeTextModel> airportlist = [];

    var dio = Dio();
    String url = ApiConstants.endpointAirportByFreeText + text;

    final response =
        await dio.get(url, options: Options(headers: ApiConstants.apiHeader));
    if (response.statusCode == 200) {
      Map result = response.data;
      List items = result["items"];
      for (var item in items) {
        airportlist.add(AirportByFreeTextModel.fromJson(item));
      }
    }

    return airportlist;
  }

  static Future<airportByIcaoModel> getAirportByIcaoCode(
      {required String code}) async {
    var dio = Dio();
    String url = ApiConstants.endpointAirportByIcaoCode + code;
    final response =
        await dio.get(url, options: Options(headers: ApiConstants.apiHeader));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      airportByIcaoModel model = airportByIcaoModel.fromJson(result);
      return model;
    } else {
      throw Exception("Response 200 dönmedi");
    }
  }
}
