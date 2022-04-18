import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylinee extends StatefulWidget {
  const Polylinee({Key key, PolylineId polylineId, MaterialAccentColor color, List<LatLng> points, int width}) : super(key: key);

  @override
  _PolylineeState createState() => _PolylineeState();
}

class _PolylineeState extends State<Polylinee> {

  String selectedtype;
  Position position;
  Widget _child;
  GoogleMapController _controller;
  GoogleMapController mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyDMFjsFu-RTGRYCHsGV10Cl2UzP22FRkGU";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = LatLng(21.1607672, 72.8175179);
  LatLng endLocation = LatLng(21.1609081, 72.8255265);

  Set<Marker> _createMarker() {
    markers.add(Marker(
      markerId: MarkerId("MainHomePage"),
      position: LatLng(21.1607672, 72.8175179),
      //position:LatLng(position.latitude,position.longitude),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: "Current Place",
      ),
    ));
    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

  }

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = res;

      LatLng startLocation = LatLng(position.latitude, position.longitude);
      print("starting point$startLocation.toString()");
      _child = mapWidget();
    });
  }

  Widget mapWidget() {
    return GoogleMap(
      myLocationButtonEnabled: true,
      zoomGesturesEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16.0,
      ),
      mapType: MapType.normal,
      markers: _createMarker(),
      polylines: Set<Polyline>.of(polylines.values),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    getDirections(); //fetch direction polylines from Google API
    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        resizeToAvoidBottomInset: false,

        body: Container(
          child:GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 16.0, //initial zoom level
            ),
            markers: markers, //markers to show on map
            polylines: Set<Polyline>.of(polylines.values), //polylines
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
          //_child



        ));
  }
}