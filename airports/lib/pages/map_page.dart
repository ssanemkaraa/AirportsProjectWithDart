import 'dart:async';

import 'package:airports/models/airportbyfreetextmodel.dart';
import 'package:airports/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:airports/utils/MapUtils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final List<AirportByFreeTextModel> gelenAirportList;
  const MapPage({required this.gelenAirportList, Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> airportMarkers = {};

  static const CameraPosition _initPosition = CameraPosition(
    target: LatLng(39.8574497, 32.7744198),
    zoom: 13,
  );

  @override
  void initState() {
    airportMarkers.clear();
    setMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.amber.shade300,
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     child: TextField(
      //       controller: searchController,
      //       decoration: const InputDecoration(
      //         border: InputBorder.none,
      //         errorBorder: InputBorder.none,
      //         enabledBorder: InputBorder.none,
      //         focusedBorder: InputBorder.none,
      //         contentPadding: EdgeInsets.all(15),
      //         hintText: 'sch yazarak haritada işaretleme sağlanabilir',
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     TextButton(
      //       onPressed: () async {
      //         String text = searchController.text;
      //         if (text.length > 2) {
      //           List<AirportByFreeTextModel> airportList =
      //               await AirportService.getAirportByFreeText(text: text);

      //           List<LatLng> coordinates = [];

      //           airportMarkers.clear();
      //           for (var airport in airportList) {
      //             coordinates
      //                 .add(LatLng(airport.location.lat, airport.location.lon));

      //             airportMarkers.add(Marker(
      //               markerId: MarkerId(airport.icao),
      //               position:
      //                   LatLng(airport.location.lat, airport.location.lon),
      //               infoWindow: InfoWindow(
      //                   title: airport.shortName,
      //                   snippet: airport.name,
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) =>
      //                                 DetailPage(kod: airport.icao)));
      //                   }),
      //               icon: BitmapDescriptor.defaultMarker,
      //             ));
      //           }

      //           final GoogleMapController controller = await _controller.future;
      //           controller.animateCamera(CameraUpdate.newLatLngBounds(
      //               MapUtils.boundsFromLatLngList(coordinates), 150));

      //           setState(() {});
      //         }
      //       },
      //       child: Icon(
      //         Icons.search,
      //         color: Colors.amber.shade100,
      //       ),
      //     )
      //   ],
      // ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: airportMarkers,
      ),
    );
  }

  void setMarkers() async {
    List<LatLng> coordinates = [];

    for (var airport in widget.gelenAirportList) {
      coordinates.add(LatLng(airport.location.lat, airport.location.lon));

      airportMarkers.add(Marker(
        markerId: MarkerId(airport.icao),
        position: LatLng(airport.location.lat, airport.location.lon),
        infoWindow: InfoWindow(
            title: airport.shortName,
            snippet: airport.name,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(kod: airport.icao)));
            }),
        icon: BitmapDescriptor.defaultMarker,
      ));
    }

    if (coordinates.isNotEmpty) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(
          MapUtils.boundsFromLatLngList(coordinates), 150));
    }

    setState(() {});
  }
}
