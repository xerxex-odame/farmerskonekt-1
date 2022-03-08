import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  String _dropDownValue = "region";
  Future<void> addUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          // 'dateOfBirth': dateOfBirthController.text,
          // 'phoneNumber': phoneNumberController.text,
          // 'accountType': accountTypeController.text,
          // 'email': emailController.text,
          // 'gender': genderController.text,
          // 'password': passwordController.text,
          // 'comfirmPassword': comfirmPasswordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
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
                  Icon(Icons.cut_sharp),
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
                  Text('Service info'),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Text('Service Type'),
              DropdownButton(
                  hint: _dropDownValue == ValueKey
                      ? Text("Dropdown")
                      : Text(_dropDownValue),
                  isExpanded: true,
                  iconSize: 30,
                  items: [
                    "School of Biological Sciences",
                    "School of Agriculture",
                    "Business School",
                    "Business School",
                  ].map((val) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.center,
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropDownValue = val as String;
                    });
                  }),
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
                  // setState(() =>  = value);
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
                  Spacer(),
                  Expanded(
                      child: SizedBox(
                    width: 10,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Payment();
                          }));
                        },
                        child: Center(child: Text('Next'))),
                  )),
                  Icon(Icons.arrow_forward)
                ],
              ),
              Divider(
                color: Colors.blueGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                text: 'Region',
              ),
              Tab(
                text: 'Location',
              )
            ]),
          ),
          body: TabBarView(children: [
            Region(),
            Location(),
          ])),
    );
  }
}

class Region extends StatefulWidget {
  const Region({Key? key}) : super(key: key);

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Icon(Icons.abc_rounded)));
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book),
            Text('Request equipment service'),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              Text('Enter you location'),
            ],
          ),
        ),
        TextFormField(
          //controller: ,
          onChanged: (value) {
            // setState(() =>  = value);
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
            Spacer(),
            Expanded(
                child: SizedBox(
          
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                       Continue()
                    
                    ));
                  },
                  child: const Center(child: Text('Next'))),
            )),
            const Icon(Icons.arrow_forward)
          ],
        ),
        const Divider(
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}

class Continue extends StatefulWidget {
  const Continue({Key? key}) : super(key: key);

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  String _dropDownValue = "region";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.book),
              Text(
                'Request equipment service',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Row(
            children: [
              Icon(Icons.arrow_back),
              Text('Farmer info'),
              Text('Enter or select the service required for')
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Row(
            children: [
              Icon(Icons.person),
              Text('Farmer'),
              Row(
                children: [
                  Icon(Icons.network_cell),
                  Text("Nextwork operator (Phone number)"),
                ],
              ),
              Text('Select the mobile nextwork operator phone number'),
              DropdownButton(
                  hint: _dropDownValue == ValueKey
                      ? Text("Dropdown")
                      : Text(_dropDownValue),
                  isExpanded: true,
                  iconSize: 30,
                  items: [
                    "TigoAirtel",
                    "Vodafone",
                    "MTN",
                  ].map((val) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.center,
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropDownValue = val as String;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
