import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lancelot/routes/routes_name.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Set<Marker> marker = {};

  @override
  void initState() {
    super.initState();
    marker.add(
      Marker(
        markerId: MarkerId(
          _kGooglePlex.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Guard's Location"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: marker,
          ),
          Positioned(
            top: 540,
            bottom: 0,
            left: 0,
            right: 0,
            child: MaterialButton(
              color: Colors.black,
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                Navigator.pushNamed(context, feedBack);
              },
              child: Text(
                "Complete Call",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
