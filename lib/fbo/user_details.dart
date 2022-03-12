import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class userDetails extends StatefulWidget {
  const userDetails({ Key? key }) : super(key: key);

  @override
  State<userDetails> createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController regionController = new TextEditingController();
  TextEditingController fboController = new TextEditingController();
  TextEditingController farmLandController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  //TextEditingController districtController = new TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
          // 'gender': genderController.text,
          // 'password': passwordController.text,
          // 'comfirmPassword': comfirmPasswordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

String _dropDownValue1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            TextFormField(
                  controller: locationController,
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
                      return 'Enter your farm location';
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
                    hintText: 'what name of your FABO',
                    labelText: 'Enter Farm location',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your farm Organization';
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
                      onChanged: (val) {
                        setState(() {
                          _dropDownValue = val as String;
                        });
                      }),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dash()));
                }, child: Text('Submit')),
          ],
        ),
        ),
      ),
    );
  }
}