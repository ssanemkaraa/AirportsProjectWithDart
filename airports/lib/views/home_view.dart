import 'package:airports/models/airportbyfreetextmodel.dart';
import 'package:airports/pages/list_page.dart';
import 'package:airports/pages/map_page.dart';
import 'package:airports/services/airportservice.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final TextEditingController searchController = TextEditingController();
  List<AirportByFreeTextModel> airportList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.amber.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String text = searchController.text;
              if (text.length > 2) {
                List<AirportByFreeTextModel> searchResponse =
                    await AirportService.getAirportByFreeText(text: text);
                airportList = searchResponse;
                setState(() {});
              }
            },
            child: Icon(
              Icons.search,
              color: Colors.amber.shade100,
            ),
          )
        ],
      ),
      body: Center(
        child: getSelectedPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Harita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Liste',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getSelectedPage() {
    if (_selectedIndex == 0) {
      return MapPage(gelenAirportList: airportList);
    } else {
      return ListPage(gelenAirportList: airportList);
    }
  }
}
