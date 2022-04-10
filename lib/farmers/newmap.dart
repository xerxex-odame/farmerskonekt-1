import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/requests.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  TextEditingController acresController = new TextEditingController();
  TextEditingController serviceTypeController = new TextEditingController();
  TextEditingController comfirmPasswordController = new TextEditingController();
  TextEditingController dateOfBirthController = new TextEditingController();
  String _dropDownValue = "Service type";
  var amount = 0;
  final Stream<QuerySnapshot> _types =
      FirebaseFirestore.instance.collection('service_types').snapshots();

  String acres = '',
      serviceType = '',
      userDateOfBirth = '',
      userPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>> users =
        FirebaseFirestore.instance.collection('users').snapshots();
    List<Map<String, dynamic>> det = [];

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.book),
                        Text('Request equipment service'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hiring'),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.cut_sharp)),
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios_new_sharp),
                        ),
                        Text('Service Type'),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text('Service Type'),
                    StreamBuilder<QuerySnapshot>(
                      stream: _types,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('snapshot err: ${snapshot.data}');
                          return Text(
                              "Something went wrong: ${snapshot.error}");
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print('snapshot lod: ${snapshot.data}');
                          return Text("Loading");
                        }

                        return DropdownButton(
                            hint: _dropDownValue == ValueKey
                                ? Text("Dropdown")
                                : Text(_dropDownValue),
                            isExpanded: true,
                            iconSize: 30,
                            items: List.generate(snapshot.data!.docs.length,
                                (index) {
                              String name = snapshot.data!.docs[index]['name'];
                              int _price = snapshot.data!.docs[index]['price'];
                              det.add({'name': name, 'price': _price});
                              // print('det: $det');
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Text(
                                  name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }),
                            onChanged: (val) {
                              setState(() {
                                _dropDownValue = val as String;
                              });
                            });
                        return Text("loading");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      // child: Text(
                      //   'choose your region',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                    ),
                    Text("Acre(s)"),
                    TextFormField(
                      //controller: ,
                      onChanged: (value) {
                        det.forEach((element) {
                          if (element['name'] == _dropDownValue) {
                            setState(() {
                              int val = int.parse(value);
                              int price = element['price'];
                              amount = val * price;
                            });
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        //icon: const Icon(Icons.person),
                        hintText: '',
                        //labelText: 'Enter your Email/Phone',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        } else if (!value.contains('number')) {
                          return '';
                        }
                        ;
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('GHC $amount'),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Payment();
                              }));
                            },
                            child: Center(child: Text('Next'))),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                  ],
                );
              });
        }),
        label: Text('Place your request'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
