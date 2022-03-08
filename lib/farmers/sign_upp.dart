//import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/foundation.dart';
//import 'package:farmers_konekt/comfirmation.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController comfirmPasswordController = new TextEditingController();
  TextEditingController dateOfBirthController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController accountTypeController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userPassword = '',
      userComfirmPassword = '',
      userDateOfBirth = '',
      userPhoneNumber = '',
      userGender = '',
      userCompany = '',
      userAccountType = '',
      userEmail = '';

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'dateOfBirth': dateOfBirthController.text,
          'phoneNumber': phoneNumberController.text,
          'accountType': accountTypeController.text,
          'email': emailController.text,
          'gender': genderController.text,
          'password': passwordController.text,
          'comfirmPassword': comfirmPasswordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Form(
              key: _formKey,
              child: ListView(children: <Widget>[
                Center(
                  child: TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      setState(() => userEmail = value);
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter email',
                      labelText: 'Enter your Email/Phone',
                      //border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      } else if (!value.contains('@')) {
                        return 'please enter email';
                      }
                      ;
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() => userComfirmPassword = value);
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'Enter password',
                    labelText: 'Enter your password',
                    //border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    } else if (!value.contains('@')) {
                      return 'please enter password';
                    }
                    ;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() => userComfirmPassword = value);
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'Comfirm password',
                    labelText: 'Comfirm your password',
                    //border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Commfirm your password';
                    } else if (!value.contains('@')) {
                      return 'Required';
                    }
                    ;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                //       final date = await showDatePicker(
                //     context: context,
                //     firstDate: DateTime(1900),
                //     initialDate: currentValue ?? DateTime.now(),
                //     lastDate: DateTime(2100));
                // if (date != null) {
                //   final time = await showTimePicker(
                //     context: context,
                //     initialTime:
                //         TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                // );
                //   return DateTimeField.combine(date, time);
                // } else {
                //   return currentValue;
                // }

                Center(child: Text('Choose your account type')),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ToggleSwitch(
                    fontSize: 16.0,
                    initialLabelIndex: 1,
                    activeBgColor: [Colors.green],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey[900],
                    totalSwitches: 2,
                    labels: [
                      'Individual',
                      'Company',
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
                // Center(
                //     child: Text(
                //   'choose gender',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: "barry.allen@example.com",
                                      password: "SuperSecretPassword!");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          ;
                          // if (_formKey.currentState!.validate()) ;
                          // FirebaseAuth auth = FirebaseAuth.instance;
                          // User? user;
                          // UserCredential userCredential =
                          //     await auth.createUserWithEmailAndPassword(
                          //   email: userEmail,
                          //   password: userPassword,
                          // );

                          //if(result ==null) {}
                          //await addUser();
                        },
                        child: Text(
                          'Signup',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.greenAccent,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account?'),
                    Center(
                      child: Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Center(child: Text('Signin')))),
                    ),
                  ],
                ),
              ]))),
    );
  }
}
