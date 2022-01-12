import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:disk_space/disk_space.dart';
import 'package:battery/battery.dart';
import 'package:system_info/system_info.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:latlng/latlng.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:technical_assignment_1/main.dart';
import 'dart:core';

import 'google_maps_screen.dart';
import 'homescreen.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

int battery = 0;
const int MEGABYTE = 1024 * 1024;
var locationmessage;
int total_physical_memory=0;
int free_physical_memory=0;
int total_virtual_memory=0;
int free_virtual_memory=0;



class _DashboardState extends State<Dashboard> {
  late Position currentPosition;
  var geolocator = Geolocator();

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  void lcoateposition() async {

    // LocationPermission permission;
    // permission = await Geolocator.requestPermission();


    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    print("POSITION OYE ${position.latitude} and ${position.longitude}");
    // var lastposition = await Geolocator.getLastKnownPosition();
    //
    // LatLng latLongPosition = LatLng(position.latitude, position.longitude);
    // print("LatLong OYE ${latLongPosition}");
    //
    // CameraPosition cameraPosition =
    //     CameraPosition(target: latLongPosition, zoom: 14);
    //
    // newGoogleMapController
    //     ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    //

  }

  void battery_call() async {
    var battery_percent = await Battery().batteryLevel;
    setState(() {
      battery = battery_percent;
    });

    print("OOOOO BATTERYY OYEEE : ${battery}");
  }

  void getDiskSpaceInfo(){
    setState(() {
      total_physical_memory= (SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE);
      free_physical_memory= (SysInfo.getFreePhysicalMemory() ~/ MEGABYTE);
      total_virtual_memory= (SysInfo.getTotalVirtualMemory() ~/ MEGABYTE);
      free_virtual_memory= (SysInfo.getFreeVirtualMemory() ~/ MEGABYTE);


      print(total_physical_memory);
      print(free_physical_memory);
    });
    print(
        "Total physical memory   : ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB");
    print(
        "Free physical memory    : ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB");
    print(
        "Total virtual memory    : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB");
    print(
        "Free virtual memory     : ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB");
    print(
        "Virtual memory size     : ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB");
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiskSpaceInfo();
    battery_call();
    //getDiskSpaceInfo();
    // lcoateposition();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Navigator.pop(context);
  }

  // static final CameraPosition _kGooglePlex =
  //     CameraPosition(target: LatLng(37.42, -122.085), zoom: 14);
  //
  //




  @override
  Widget build(BuildContext context) {


    Map<String,double> dataforphysical={
      "Total Physical Memory": total_physical_memory.toDouble(),
      "Free Physical Memory": free_physical_memory.toDouble()
    };
    Map<String,double> dataforvirtual={
      "Total Virtual Memory": total_virtual_memory.toDouble(),
      "Free Virtual Memory": free_virtual_memory.toDouble()
    };


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("DashBoard"),),
        drawer: DrawerWidget(),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Battery Level : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CircularPercentIndicator(
                        radius: 90.0,
                        lineWidth: 5.0,
                        percent: 1.0,
                        center: Text(
                          "$battery",
                          style: TextStyle(fontSize: 20),
                        ),
                        progressColor: Colors.green,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: const [
                      Text(
                        'User Information : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Khubaibk30@gmail.com',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: const [
                      Text(
                        'Network Type : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '4g/Wifi',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 400,
                //   width: 400,
                //   child: GoogleMap(
                //     mapType: MapType.normal,
                //     myLocationButtonEnabled: true,
                //     initialCameraPosition: _kGooglePlex,
                //     myLocationEnabled: true,
                //     zoomGesturesEnabled: true,
                //     onMapCreated: (GoogleMapController controller) {
                //       newGoogleMapController = controller;
                //       _controllerGoogleMap.complete();
                //
                //       lcoateposition();
                //     },
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Physical Memory : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PieChart(
                        dataMap: dataforphysical,
                        chartRadius: MediaQuery.of(context).size.width/1.7,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.bottom
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Virtual Memory : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PieChart(
                        dataMap: dataforvirtual,
                        chartRadius: MediaQuery.of(context).size.width/1.7,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.bottom
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                      )

                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleMapScreen()));
                }, child:
                Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    color: Colors.blueAccent,
                    child: Text("GOOGLE MAPS!",style: TextStyle(fontSize: 22,color: Colors.white),)
                )
                  ,),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}



