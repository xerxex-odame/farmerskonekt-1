
// import 'dart:html';

// import 'package:flutter/material.dart';
// //import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// //import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';

// class Daash extends StatefulWidget {
//   const Daash({Key? key}) : super(key: key);

//   @override
//   State<Daash> createState() => _DaashState();
// }

// Material myItems(IconData icon, String heading, int color) {
//   return Material(
//     color: Colors.blueAccent,
//     elevation: 14,
//     shadowColor: Colors.blueAccent,
//     borderRadius: BorderRadius.circular(25),
//     child: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// class _DaashState extends State<Daash> {
//   get staggeredTiles => null;

//   @override
//   Widget build(BuildContext context) {
//     var staggeredTiles2 = staggeredTiles;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: ListView(
//         children: [
//           StaggeredGridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12.0,
//             mainAxisSpacing: 12.0,
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             children: <Widget>[
//               myItems(Icons.person, 'Total view', 0),
//               myItems(Icons.person, 'Total view', 0),
//               myItems(Icons.person, 'Total view', 0),
//               myItems(Icons.person, 'Total view', 0),
//             ],
//             staggeredTiles: [
//               staggeredTiles2.extent(2, 130.0),
//               staggeredTiles2.extent(2, 110.0),
//               staggeredTiles2.extent(2, 100.0),
//               staggeredTiles2.extent(2, 120.0),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
