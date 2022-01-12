// import 'package:flutter/material.dart';
// import 'package:technical_assignment_1/screen/dashboard.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarDemo(),
//     );
//   }
// }
//
// class TabBarDemo extends StatelessWidget {
//   const TabBarDemo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: const TabBar(
//               tabs: [
//                 Tab(
//                   text: "DashBoard",
//                 ),
//                 Tab(
//                   text: "Product Screen",
//                 ),
//                 Tab(
//                   text: "Sync Screen",
//                 ),
//               ],
//             ),
//             title: const Text('The Tab View'),
//           ),
//           body: const TabBarView(
//             children: [
//               Dashboard(),
//               // Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:technical_assignment_1/screen/dashboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Home Page")),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: DrawerWidget(),
    );
  }
}


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('HomeScreen'),
            onTap: () {
              onItemPressed(context,0);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              onItemPressed(context,1);
            },
          ),
          ListTile(
            title: const Text('Product Screen'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sync Screen'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


void onItemPressed(BuildContext context,int index){
  switch(index){
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
      break;

    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
      break;
  }
}
