import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController acresController = new TextEditingController();
  TextEditingController serviceTypeController = new TextEditingController();
  // TextEditingController comfirmPasswordController = new TextEditingController();
  // TextEditingController dateOfBirthController = new TextEditingController();
  String _dropDownValue = "region";
  final Stream<QuerySnapshot>? _types =
      FirebaseFirestore.instance.collection('service_types').snapshots();

  String acres = '',
      serviceType = '',
      userDateOfBirth = '',
      userPhoneNumber = '';
  // Future<void> addUser() {

  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'acres': acresController.text,
  //         'serviceType': serviceTypeController.text,
  //         // 'accountType': accountTypeController.text,
  //         // 'email': emailController.text,
  //         // 'gender': genderController.text,
  //         // 'password': passwordController.text,
  //         // 'comfirmPassword': comfirmPasswordController.text,
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>> users =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.book),
                    Text('Request equipment service'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hiring'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.cut_sharp)),
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
              StreamBuilder<QuerySnapshot>(
                stream: _types,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    debugPrint(data.toString());
                    return DropdownButton(
                        hint: _dropDownValue == ValueKey
                            ? Text("Dropdown")
                            : Text(_dropDownValue),
                        isExpanded: true,
                        iconSize: 30,
                        items: snapshot.data.map((val) {
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
                        });
                  }

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
                        MaterialPageRoute(builder: (context) => Continue()));
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
