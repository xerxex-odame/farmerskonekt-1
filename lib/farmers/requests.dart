import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/continue.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hive/hive.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
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
    List<Map<String, dynamic>> det = [];

    return Scaffold(
        backgroundColor: Colors.brown,
        // ignore: dead_code
        body: Center(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset("assets/tractors.jpg").image,
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: GlassmorphicContainer(
                width: 350,
                height: 750,
                borderRadius: 20,
                blur: 20,
                alignment: Alignment.bottomCenter,
                border: 2,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: ListView(
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
              ))),
        ));
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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book),
              Text('Request equipment service'),
            ],
          ),
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Enter you location'),
              ),
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
            hintText: 'Enter your Location',
            labelText: 'Enter Location',
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
                        MaterialPageRoute(builder: (context) {
                      return Continue();
                    }));
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

// class Continue extends StatefulWidget {
//   const Continue({Key? key}) : super(key: key);

//   @override
//   State<Continue> createState() => _ContinueState();
// }

// class _ContinueState extends State<Continue> {
//   String _dropDownValue = "region";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Row(
//             children: [
//               Icon(Icons.book),
//               Text(
//                 'Request equipment service',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           Divider(
//             color: Colors.blueGrey,
//           ),
//           Row(
//             children: [
//               Icon(Icons.arrow_back),
//               Text('Farmer info'),
//               Text('Enter or select the service required for')
//             ],
//           ),
//           Divider(
//             color: Colors.blueGrey,
//           ),
//           Row(
//             children: [
//               Icon(Icons.person),
//               Text('Farmer'),
//               Row(
//                 children: [
//                   Icon(Icons.network_cell),
//                   Text("Nextwork operator (Phone number)"),
//                 ],
//               ),
//               Text('Select the mobile nextwork operator phone number'),
//               DropdownButton(
//                   hint: _dropDownValue == ValueKey
//                       ? Text("Dropdown")
//                       : Text(_dropDownValue),
//                   isExpanded: true,
//                   iconSize: 30,
//                   items: [
//                     "TigoAirtel",
//                     "Vodafone",
//                     "MTN",
//                   ].map((val) {
//                     return DropdownMenuItem<String>(
//                       alignment: AlignmentDirectional.center,
//                       value: val,
//                       child: Text(val),
//                     );
//                   }).toList(),
//                   onChanged: (val) {
//                     setState(() {
//                       _dropDownValue = val as String;
//                     });
//                   }),
//             ],
//           ),
//         ],
//       ),
//     );
 // }
//}