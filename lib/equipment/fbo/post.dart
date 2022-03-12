// ignore_for_file: unused_element

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

TextEditingController expireController = new TextEditingController();
TextEditingController dateExpireController = new TextEditingController();
TextEditingController farmLandController = new TextEditingController();
TextEditingController locationController = new TextEditingController();
TextEditingController makeController = new TextEditingController();
TextEditingController modalController = new TextEditingController();
TextEditingController licensePlateNumberController =
    new TextEditingController();
TextEditingController yearController = new TextEditingController();
CollectionReference users = FirebaseFirestore.instance.collection('users');

String _dropDownValue = "";
//String _dropDownValue1 = "";

String  dateExpire = '', expire = '', make = '', modal = '', licensePlateNumber = '', year = '';

Future<void> addUser() async {
  return users
      .add({
        'expire': expireController.text,
        'dateExpire': dateExpireController.text,
        'make': makeController.text,
        'modal': modalController.text,
        // 'accountType': accountTypeController.text,
        'fullName': yearController.text,
        'licensePlateNumber': licensePlateNumberController.text,
        // 'accountType': accountTypeController.text,
       // 'fullName': yearController.text,
        //'licensePlateNumber': licensePlateNumberController.text,
        // 'password': passwordController.text,
        // 'comfirmPassword': comfirmPasswordController.text,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
final ImagePicker _picker = ImagePicker();
File? _postImage;

DateTime? _selected;
String _date = DateTime.now().toUtc().toString();

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          ListTile(
            title: Text('My Document'),
            subtitle:
                Text('Here are the document associated with the equipment'),
          ),
          Center(child: Text('Roardworthness sticker')),
          SizedBox(
            height: 20,
          ),
          Center(child: Text('Expire')),
          TextButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Text(
                'show date time picker (english)',
                style: TextStyle(color: Colors.blue),
              )),
          const Center(child: Text('Prof of Insurance')),
          const SizedBox(
            height: 20,
          ),
          const Center(child: Text('Date Expire')),
          TextButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2010, 3, 5),
                    maxTime: DateTime.now(), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  _date = date.toString();
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Text(
                'Date: ${_date}',
                style: TextStyle(color: Colors.blue),
              )),
          Row(
            children: [],
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
                        return pay();
                      }));
                    },
                    child: Center(child: Text('Next'))),
              )),
              Icon(Icons.arrow_forward)
            ],
          ),
        ]),
      ),
    );
  }
}

class pay extends StatefulWidget {
  const pay({Key? key}) : super(key: key);

  @override
  State<pay> createState() => _payState();
}

// TextEditingController makeController = new TextEditingController();
// TextEditingController modalController = new TextEditingController();
// TextEditingController licensePlateNumberController =
//     new TextEditingController();
// TextEditingController yearController = new TextEditingController();
// CollectionReference users = FirebaseFirestore.instance.collection('users');

// String _dropDownValue = "";
// //String _dropDownValue1 = "";

// String make = '', modal = '', licensePlateNumber = '', year = '';

// Future<void> addUser() async {
//   return users
//       .add({
//         'make': makeController.text,
//         'modal': modalController.text,
//         // 'accountType': accountTypeController.text,
//         'fullName': yearController.text,
//         'licensePlateNumber': licensePlateNumberController.text,
//         // 'password': passwordController.text,
//         // 'comfirmPassword': comfirmPasswordController.text,
//       })
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }

class _payState extends State<pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmers Konekt'),
      ),
      body: ListView(
        children: [
          Text('Equipment Requirement'),
          SizedBox(
            height: 10,
          ),
          Text(
              'To use Farmers Konekt, you need an equipment that is 200 or newer'),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('Enter your equipment information')),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('make')),
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
          SizedBox(
            height: 10,
          ),
          Center(child: Text('model')),
          TextFormField(
            textAlign: TextAlign.center,
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
          SizedBox(
            height: 10,
          ),
          Center(child: Text('year')),
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
          SizedBox(
            height: 10,
          ),
          Center(child: Text('License plate number')),
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Expanded(
                  child: SizedBox(
                width: 10,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return pay();
                      }));
                    },
                    child: Center(child: Text('Post ad'))),
              )),
              Icon(Icons.arrow_forward)
            ],
          ),
        ],
      ),
    );
  }
}
