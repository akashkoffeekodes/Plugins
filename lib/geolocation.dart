import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geolocation extends StatefulWidget {
  @override
  _GeolocationState createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {

  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    _getCurrentLocation();
    _getAddressFromLatLng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_currentAddress != null) Text(
                    _currentAddress
                ),
                FlatButton(
                  child: Text("Get location"),
                  onPressed: () {
                    _getCurrentLocation();
                    _getAddressFromLatLng();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.street} ${place.locality}, ${place.postalCode}, ${place.country},";
      });
    } catch (e) {
      print(e);
    }
  }
}
