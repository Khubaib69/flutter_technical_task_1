import 'package:flutter/material.dart';
import 'package:technical_assignment_1/screen/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "DashBoard",
                ),
                Tab(
                  text: "Product Screen",
                ),
                Tab(
                  text: "Sync Screen",
                ),
              ],
            ),
            title: const Text('The Tab View'),
          ),
          body: const TabBarView(
            children: [
              Dashboard(),
              // Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           new CircularPercentIndicator(
//             radius: 60.0,
//             lineWidth: 5.0,
//             percent: 1.0,
//             center: new Text("100%"),
//             progressColor: Colors.green,
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const appTitle = 'Drawer Demo';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: const Center(
//         child: Text('My Page!'),
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
