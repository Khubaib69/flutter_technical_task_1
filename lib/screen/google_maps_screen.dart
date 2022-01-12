import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    //getDiskSpaceInfo();
    getposition();

  }

  late Position currentPosition;
  double ?lat;
  double ?long;
  void getposition() async {

    // LocationPermission permission;
    // permission = await Geolocator.requestPermission();


    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    lat = position.latitude;
    long= position.longitude;
    print("POSITION OYE ${position.latitude} and ${position.longitude}");


  }



  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
          Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(37.4219983,-122.084),
          )
      );
    });
  }

  static const LatLng _mainLocation = LatLng(37.4219983,-122.084);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps Screen'),),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
            target: _mainLocation,
            // target: LatLng(22.5448131, 88.3403691),
            zoom: 14
        ),
      ),
    );
  }
}



// AIzaSyAKjZh5UczSNeP_-vyPHaFRPoBC_y-h-Aw