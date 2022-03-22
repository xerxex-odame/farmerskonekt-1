import 'package:farmers_konekt/farmers/continue.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class DabiData extends StatefulWidget {
  const DabiData({Key? key}) : super(key: key);

  @override
  State<DabiData> createState() => _DabiDataState();
}

class _DabiDataState extends State<DabiData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/tractors.jpg'),
              ),
            ),
          ),
          Container(
            height: 360,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('place your Request'),
                  )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Dash();
                      }));
                    },
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.car_rental),
                                Text(
                                  'Hiring',
                                ),
                              ],
                            ),
                          ),
                          Text('Order and pay your request')
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class Dabbi extends StatefulWidget {
  const Dabbi({Key? key}) : super(key: key);

  @override
  State<Dabbi> createState() => _DabbiState();
}

class _DabbiState extends State<Dabbi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100.0),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.only(
      //             topRight: Radius.circular(30.0),
      //             bottomLeft: Radius.circular(30.0),
      //           ),
      //         ),
      //         child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {},
      //                 child: Card(
      //                   child: Column(children: [
      //                     Text('Place your Requests'),
      //                     Row(
      //                       children: [
      //                         Icon(Icons.track_changes_rounded),
      //                         Text('Order and pay  for equipment'),
      //                       ],
      //                     ),
      //                   ]),
      //                 ),
      //               ),
      //]
    );
  }
}
