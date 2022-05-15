import 'package:airports/customwidgets/detailpage.dart';
import 'package:airports/models/airportbyfreetextmodel.dart';
import 'package:airports/services/airportservice.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  late List<AirportByFreeTextModel> gelenAirportList = [];
  ListPage({Key? key, required this.gelenAirportList}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController searchController = TextEditingController();
  //List<AirportByFreeTextModel> airportList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.gelenAirportList.length,
          itemBuilder: (BuildContext context, int index) {
            var airport = widget.gelenAirportList[index];

            return ListTile(
                leading: Icon(Icons.list),
                trailing: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(kod: airport.icao)));
                    },
                    child: Text(
                      "Detay Sayfası",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("icao: ${airport.icao}"),
                    Text("countryCode: ${airport.countryCode}"),
                    Text("iata: ${airport.iata}"),
                    Text("municipalityName : ${airport.municipalityName}"),
                    Text("name : ${airport.name}"),
                    Text("shortName : ${airport.shortName}"),
                    Text("location.lat : ${airport.location.lat.toString()}"),
                    Text("location.lon : ${airport.location.lon.toString()}"),
                  ],
                ));
          }),
    );
  }
}
