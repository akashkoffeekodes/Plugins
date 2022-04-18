import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Realtime_location extends StatefulWidget {
  Realtime_location({Key key}) : super(key: key);

  @override
  _Realtime_locationState createState() => _Realtime_locationState();
}

class _Realtime_locationState extends State<Realtime_location> {
  GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  static const LatLng startLocation = const LatLng(21.1607672, 72.8175179);

  String newData;


  //GoogleMapController _controller;
//  Position position;



  // LatLng startLocation = LatLng(21.1607672, 72.8175179);

  _background() {
    BackgroundLocation.startLocationService();
    BackgroundLocation.getLocationUpdates((location) async {
      await FirebaseFirestore.instance.collection('Location').doc('akash').get().then((docavalue){

        newData = "${location.latitude},${location.longitude},${DateTime.now()}";

        if(docavalue.exists) {
          FirebaseFirestore.instance.collection('Location').doc('akash').set(
              {
                'date' : DateTime.now(),
                'latitude' : location.latitude,
                'longitude' : location.longitude,
                'pastData' : newData +"&"+ docavalue.data()['pastData']
              }
          );
        }
        else {
          FirebaseFirestore.instance.collection('Location').doc('akash').set(
              {
                'date' : DateTime.now(),
                'latitude' : location.latitude,
                'longitude' : location.longitude,
                'pastData' : newData
              }

          );
        }

      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              target: startLocation, //initial position
              zoom: 16.0, //initial zoom level
            ),
            markers: getmarkers(),
            mapType: MapType.normal,
            //map type
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _background();
                  },
                  child: Text('Start Location Service')),
              ElevatedButton(
                  onPressed: () {
                    BackgroundLocation.stopLocationService();
                  },
                  child: Text('Stop Location Service')),
            ],
          ),
        ],
      ),
    );
  }



  @override
  void dispose() {
    BackgroundLocation.stopLocationService();
    super.dispose();
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
