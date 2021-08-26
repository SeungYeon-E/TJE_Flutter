import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  서울상상나라	    37.54945787  / 127.0862609
  둘리뮤지엄        37.65243153 / 127.0276397
  서대문형무소역사관	37.57244171 /	126.9595412
  */
  List map = [
      ["혜화문", 37.5878892, 127.0037098],
      ["홍인지문", 37.5711907, 127.009506],
      ["창의문", 37.5926027, 126.9664771],
      ["숙정문", 37.5956584, 126.9810576]
  ];

  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fluttermap(),
    );
  }

  Widget fluttermap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(center: latlng.LatLng(map[0][1], map[0][2]), zoom: 12.0),
      layers: [
        TileLayerOptions(
          urlTemplate: "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(markers: [
          mark(0),
          mark(1),
          mark(2),
          mark(3),
        ])
      ],
    );
  }

  Marker mark(int i) {
    return Marker(
      width: 80.0,
              height: 80.0,
              point: latlng.LatLng(map[i][1], map[i][2]),
              builder: (ctx) => Container(
                    child: Column(
                      children: [
                        Text(map[i][0]),
                        Icon(
                          Icons.pin_drop_rounded,
                          size: 30.0,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
    );
  }
}//<<
