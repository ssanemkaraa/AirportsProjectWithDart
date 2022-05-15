import 'package:airports/models/airportbyicao.dart';
import 'package:airports/services/airportservice.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final String kod;
  const DetailPage({required this.kod, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late AirportByIcaoModel? icaoModel;

  @override
  void initState() {
    icaoModel = null;
    getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detay Sayfası")),
        body: (icaoModel != null
            ? _createBody(icaoModel!)
            : const Text("apiden yanıt bekleniyor")));
  }

  Widget _createBody(AirportByIcaoModel icaoModel) {
    return Column(
      children: [
        Text(icaoModel.iata),
        Text(icaoModel.shortName ?? ""),
        Text(icaoModel.fullName ?? ""),
        Text(icaoModel.municipalityName ?? ""),
        ...icaoModel.urls!.entries
            .map((site) => InkWell(
                child: Text(site.key), onTap: () => launchUrl(site.value)))
            .toList()
      ],
    );
  }

  Widget getUrlWidget(Map<String, dynamic>? urlJson) {
    return Column(
        children: urlJson!.entries
            .map((site) => InkWell(
                child: Text(site.key), onTap: () => launchUrl(site.value)))
            .toList());
  }

  void getDetail() async {
    icaoModel = await AirportService.getAirportByIcaoCode(code: widget.kod);

    setState(() {});
  }
}
