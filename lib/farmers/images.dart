import 'dart:ui';

import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Dash();
                }));
              },
              child: Text(
                'Home',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/hole.jpg', height: 200, width: 400),
                  Text('Hole')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/rice_planter.jpg',
                      height: 200, width: 400),
                  Text('Rice planter')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset(
                    'Assets/mobile_irrigation.jpg',
                    height: 200,
                    width: 400,
                  ),
                  Text('Mobile irrigation')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/planter.jpg', height: 200, width: 400),
                  Text('Planter')
                ],
              ),
              color: Colors.greenAccent),
          Card(
            elevation: 10,
            child: Column(
              children: [
                Image.asset('Assets/spraying_drone.jpg',
                    height: 200, width: 400),
                Text('Spraying drone')
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/tractor_plourer.png',
                      height: 200, width: 400),
                  Text('Tractor')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/manual_rice_planter.jpg',
                      height: 200, width: 400),
                  Text('Manual rice planter')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset('Assets/harvester.jpg', height: 200, width: 400),
                  Text('Harvester')
                ],
              ),
              color: Colors.greenAccent),
          Padding(
              padding: EdgeInsets.only(
            bottom: 30,
          )),
          Card(
            color: Colors.greenAccent,
            elevation: 10,
            child: Column(
              children: [
                Image.asset('Assets/IMG-20220324-WA0054.jpg',
                    height: 200, width: 400),
                Text('Combine harvester')
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_paused_rounded),
          label: 'Notification',
        ),
      ]),
    );
  }
}
