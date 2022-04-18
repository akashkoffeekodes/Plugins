import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';


class Maps extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  GoogleMapController mapController; //contrller for Google map
  //final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209); //location to show in map


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Multiple Markers in Google Map"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GoogleMap( //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition( //innital position in map
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),

        markers: markers, //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) { //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          getmarkers();
        },
      ),

    );
  }

  Set<Marker> markers = {};


  getmarkers() {
    //markers to place on map

      setState(() {
        markers.add(
            Marker( //add first marker
              markerId: MarkerId(showLocation.toString()),
              position: showLocation, //position of marker
              infoWindow: InfoWindow( //popup info
                title: 'Marker Title First ',
                snippet: 'My Custom Subtitle',
              ),
              icon: BitmapDescriptor.defaultMarker, //Icon for Marker
            ));
      });


      //
      // markers.add(Marker( //add second marker
      //   markerId: MarkerId(showLocation.toString()),
      //   position: LatLng(27.7099116, 85.3132343), //position of marker
      //   infoWindow: InfoWindow( //popup info
      //     title: 'Marker Title Second ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      // ));
      //
      // markers.add(Marker( //add third marker
      //   markerId: MarkerId(showLocation.toString()),
      //   position: LatLng(27.7137735, 85.315626), //position of marker
      //   infoWindow: InfoWindow( //popup info
      //     title: 'Marker Title Third ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      // ));

      markers.addLabelMarker(

          LabelMarker(
        label: "sagar",
        markerId: MarkerId("3"),
        position: LatLng(27.7137735, 85.315626),
        backgroundColor: Colors.green,
      )).then((value) {
        setState(() {});
      },
      );


      markers.addLabelMarker(LabelMarker(
        label: "udit",
        markerId: MarkerId("1"),
        position: LatLng(21.170240, 72.831062),
        backgroundColor: Colors.green,
      )).then((value) {
        setState(() {});
      },
      );


      markers.addLabelMarker(LabelMarker(
        label: "akash",
        markerId: MarkerId("2"),
        position: LatLng(27.7099116, 85.3132343),
        backgroundColor: Colors.green,
      )).then((value) {
        setState(() {});
      },
      );

      //add more markers here
    }
}