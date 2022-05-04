import 'package:airports/constants/constants.dart';
import 'package:airports/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Detay sayfası, girişte ilk açılacak ekran")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.cyan,
              // clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                        height: 500,
                        color: Colors.amber,
                        child: Icon(Icons.arrow_drop_down_circle)),
                    title: Container(
                        color: Colors.blue,
                        child: const Text('Havaalanı adı yazılacak')),
                    subtitle: Row(
                      children: [
                        birKolon(),
                        SizedBox(width: 10.0),
                        birKolon(),
                        SizedBox(width: 10.0),
                        birKolon(),
                        SizedBox(width: 10.0),
                        birKolon(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    color: Colors.pink,
                    child: Text(
                      'Tam ortada bir şeyler yazıyor',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('Haritaya Git Butonu'),
                      ),
                    ],
                  ),
                  // Image.network(
                  //     'https://cdn.pixabay.com/photo/2016/11/08/05/01/airplane-1807486_960_720.jpg'),
                ],
              ),
            );
          }),
    );
  }
}

class birKolon extends StatelessWidget {
  const birKolon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        detayBilgiler(),
        Divider(),
        detayBilgiler(),
        Divider(),
        detayBilgiler(),
      ],
    );
  }
}

class detayBilgiler extends StatelessWidget {
  const detayBilgiler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Text(
        'Hava Alanı Açıklaması yazılacak',
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
    );
  }
}


// ListTile(
//                 leading: Icon(Icons.list),
                
//                 trailing: const Text(
//                   "GFG",
//                   style: TextStyle(color: Colors.green, fontSize: 15),
//                 ),
//                 title: Text("List item $index"));