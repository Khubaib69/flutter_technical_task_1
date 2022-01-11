import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:disk_space/disk_space.dart';
import 'package:battery/battery.dart';
import 'package:system_info/system_info.dart';
import 'package:geolocator/geolocator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

int battery = 0;
const int MEGABYTE = 1024 * 1024;
var locationmessage;

class _DashboardState extends State<Dashboard> {
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastposition = await Geolocator.getLastKnownPosition();

    print(lastposition);

    setState(() {
      locationmessage =
          "Latitude : ${position.latitude} And Longitude ${position.longitude}";
    });
  }

  void battery_call() async {
    battery = await Battery().batteryLevel;

    print("OOOOO BATTERYY OYEEE : ${battery}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    battery_call();
    getDiskSpaceInfo();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  children: [
                    const Text(
                      'Battery Level : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 50,
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
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Row(
                  children: const [
                    Text(
                      'User Information : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      'Khubaibk30@gmail.com',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Row(
                  children: const [
                    Text(
                      'Network Type : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '4g/Wifi',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Row(
                  children: const [
                    Text(
                      'Location: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'THIS IS LOC',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

//print(SysInfo.getTotalPhysicalMemory());
// print(SysInfo.getFreePhysicalMemory());
// print(SysInfo.getTotalVirtualMemory());
// print(SysInfo.getFreeVirtualMemory());
// print(SysInfo.getVirtualMemorySize());

void getDiskSpaceInfo() async {
  // print(SysInfo.getTotalPhysicalMemory());
  // print(SysInfo.getFreePhysicalMemory());
  // print(SysInfo.getTotalVirtualMemory());
  // print(SysInfo.getFreeVirtualMemory());
  // print(SysInfo.getVirtualMemorySize());

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

  // double diskSpace = 0;

  // diskSpace = await DiskSpace.getFreeDiskSpace as double;
  // print(" OOOOOO DISK OYE ${diskSpace}");
  // print(await DiskSpace.getTotalDiskSpace);
}
