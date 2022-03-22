import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/note.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//   AddUser(
//     this.firstName,
//     this.lastName,
//     this.dateOfBirth,
//     this.location,
//     this.region,
//     this.country,
//     this.phoneNumber,
//     this.gender,
//     this.accountType,
//     this.farmLand,
//     this.district,
//     this.landSize,
//   );

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

// _FormValidationWithDropdownState createState() =>
//     _FormValidationWithDropdownState();

// class _FormValidationWithDropdownState {}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController regionController = new TextEditingController();
  //TextEditingController countryController = new TextEditingController();
  TextEditingController farmLandController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  //TextEditingController districtController = new TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool _autovalidate = false;
  late String selectedSalutation;
  late String name;

  String _dropDownValue = "";
//String _dropDownValue1 = "";

  String farmLand = '', region = '', location = '', fullName = '';

  Future<void> addUser() async {
    return users
        .add({
          'region': regionController.text,
          'location': locationController.text,
          // 'accountType': accountTypeController.text,
          'fullName': fullNameController.text,
          'farmLand': farmLandController.text,
          // 'password': passwordController.text,
          // 'comfirmPassword': comfirmPasswordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    Object? selectedSalutation;
    return Scaffold(
        body: Container(
      color: Colors.greenAccent,
      child: Center(
        child: Form(
          key: _formKey,
          //autovalidateMode: _autovalidate,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: fullNameController,
                  onChanged: (value) {
                    //userFullName = value;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter fullName',
                    labelText: 'Enter your fullName',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your fullName';
                    } else if (!value.contains('letters only')) {
                      return 'requied';
                    }
                    ;
                    return null;
                  },
                ),
                TextFormField(
                  controller: fullNameController,
                  onChanged: (value) {
                    //userFullName = value;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter farm location',
                    labelText: 'Enter Farm location',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your farm location';
                    } else if (!value.contains('letters only')) {
                      return 'requied';
                    }
                    ;
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'choose your region',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton(
                    hint: _dropDownValue == ValueKey
                        ? Text("Dropdown")
                        : Text(_dropDownValue),
                    isExpanded: true,
                    iconSize: 30,
                    items: [
                      "Ahafo Region - Goaso",
                      "Ashanti Region - Kumasi",
                      "Business School",
                      "Business School",
                      "Bono East Region - Techiman",
                      "Bono East Region - Techiman",
                      "Eastern Region - Koforidua",
                      "North East Region - Nalerigu",
                      "Oti Region - Dambai",
                      "Northern Region - Tamale",
                      "Savannah Region - Damango",
                      "Northern Region - Tamale",
                      "Upper West Region - Wa",
                      "Volta Region - Ho",
                      "Western North Region- Sefwi Wiawso",
                      "Western Region - Sekondi",
                    ].map((val) {
                      return DropdownMenuItem<String>(
                        alignment: AlignmentDirectional.center,
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (salutation) =>
                        setState(() => selectedSalutation = salutation),
                    //validator: (value) => value == null ? 'field required' : null,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        var note = Note(
                          fullName: fullName,
                          location: location,
                          farmLand: farmLand,
                          region: region,
                          accountType: '',
                          email: '',
                          phoneNumber: '',
                          gender: '',
                          uid: '',
                        );
                        Note user = note;
                        addUser();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dash()));
                      },
                      child: Center(child: Text('Complete'))),
                ),
                // Center(
                //   child: Expanded(
                //     child: ElevatedButton(
                //         onPressed: () async {
                //           if (_formKey.currentState!.validate()) {
                //             try {
                //               UserCredential userCredential = await FirebaseAuth
                //                   .instance
                //                   .createUserWithEmailAndPassword(
                //                       email: "user@example.com",
                //                       password: "SuperSecretPassword!");
                //             } on FirebaseAuthException catch (e) {
                //               if (e.code == 'weak-password') {
                //                 print('The password provided is too weak.');
                //               } else if (e.code == 'email-already-in-use') {
                //                 print(
                //                     'The account already exists for that email.');
                //               }
                //             } catch (e) {
                //               print(e);
                //             }
                //           }
                //           ;
                //           Navigator.push(context,
                //               MaterialPageRoute(builder: (context) {
                //             return Dash();
                //           }));
                //           // if (_formKey.currentState!.validate()) ;
                //           // FirebaseAuth auth = FirebaseAuth.instance;
                //           // User? user;
                //           // UserCredential userCredential =
                //           //     await auth.createUserWithEmailAndPassword(
                //           //   email: userEmail,
                //           //   password: userPassword,
                //           // );

                //           //if(result ==null) {}
                //           //await addUser();
                //         },
                //         child: Text(
                //           'Submit',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             color: Colors.greenAccent,
                //           ),
                //         )),
                //   ),
              ] // ),
              ),
        ),
      ),
    ));
  }
}
