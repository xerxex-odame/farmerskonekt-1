// import 'dart:async';
// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:farmers_konekt/farmers/das.dart';
// import 'package:farmers_konekt/farmers/details.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:farmers_konekt/comfirmation.dart';
//  import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// //import 'package:toggle_switch/toggle_switch.dart';
// //import 'package:flutter_sms/flutter_sms.dart';
// import 'package:flutter/material.dart';

// import '../homeview/login.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;


//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = new TextEditingController();
//   TextEditingController passwordController = new TextEditingController();
//   TextEditingController comfirmPasswordController = new TextEditingController();
//   TextEditingController dateOfBirthController = new TextEditingController();
//   TextEditingController genderController = new TextEditingController();
//   TextEditingController accountTypeController = new TextEditingController();
//   TextEditingController phoneNumberController = new TextEditingController();
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//   TextEditingController messageContoller = new TextEditingController();
//   final otpController = TextEditingController();

//  FirebaseAuth _auth = FirebaseAuth.instance;

//   late String verificationId;

//   bool showLoading = false;

  
//   // String? _message, body;
//   // String _canSendSMSMessage = 'Check is not run.';
//   // List<String> people = [];


//   get screenWidth => null;

//   get _handleRadioValueChanged => null;
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     messageContoller = TextEditingController();
//   }

//   String userPassword = '',
//       userComfirmPassword = '',
//       userDateOfBirth = '',
//       userPhoneNumber = '',
//       userGender = '',
//       userCompany = '',
//       userAccountType = '',
//       userEmail = '';
//   Future<void> addUser() {
//     // Call the user's CollectionReference to add a new user
//     return users
//         .add({
//           'dateOfBirth': dateOfBirthController.text,
//           'phoneNumber': phoneNumberController.text,
//           'accountType': accountTypeController.text,
//           'email': emailController.text,
//           'gender': genderController.text,
//           'password': passwordController.text,
//           'comfirmPassword': comfirmPasswordController.text,
//         })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }

// //   // Future<void> _sendSMS(List<String> recipients) async {
// //   //   try {
// //   //     String _result =
// //   //         await sendSMS(message: messageContoller.text, recipients: recipients);
// //   //     setState(() => _message = _result);
// //   //     print('result: $_result');
// //   //   } catch (error) {
// //   //     setState(() => _message = error.toString());
// //   //     print('error ${error}');
// //   //   }
// //   // }

//   int _radioValue = 0;
//   // CheckoutMethod _method = CheckoutMethod.selectable;
//   // bool _inProgress = false;
//  void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });


      
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         body: Container(
//             width: screenWidth,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/tractors.jpg'), fit: BoxFit.cover),
//             ),
//             child: Container(
//               width: screenWidth,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Colors.green[800]!.withOpacity(0.7),
//                   Colors.black.withOpacity(0.5),
//                   Color.fromARGB(255, 0, 1, 2).withOpacity(0.9)
//                 ]),
//               ),
//               child: Center(
//                 child: Form(
//                     key: _formKey,
//                     child: ListView(children: <Widget>[
//                       Center(
//                         child: TextFormField(
//                           controller: emailController,
//                           onChanged: (value) {
//                             setState(() => userEmail = value);
//                           },
//                           decoration: const InputDecoration(
//                             icon: const Icon(Icons.person),
//                             hintText: 'Enter email',
//                             labelText: 'Enter your Email/Phone',
//                             //border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Enter your email';
//                             } else if (!value.contains('@')) {
//                               return 'please enter email';
//                             }
//                             ;
//                             return null;
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       TextFormField(
//                         controller: phoneNumberController,
//                         onChanged: (value) {
//                           setState(() => userPhoneNumber = value);
//                         },
//                         decoration: const InputDecoration(
//                           icon: const Icon(Icons.person),
//                           hintText: 'Enter phone number',
//                           labelText: 'Enter your Phone',
//                           //border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter your Phone number';
//                           }
//                           ;
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         controller: passwordController,
//                         onChanged: (value) {
//                           setState(() => userComfirmPassword = value);
//                         },
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           icon: const Icon(Icons.lock),
//                           hintText: 'Enter password',
//                           labelText: 'Enter your password',
//                           //border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter your password';
//                             // } else if (value.length > 9) {
//                             //   return 'please enter password';
//                           }
//                           ;
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       TextFormField(
//                         controller: passwordController,
//                         onChanged: (value) {
//                           setState(() => userComfirmPassword = value);
//                         },
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           icon: const Icon(Icons.lock),
//                           hintText: 'Comfirm password',
//                           labelText: 'Comfirm your password',
//                           //border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Commfirm your password';
//                           }
//                           ;
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       // IntlPhoneField(
//                       //   decoration: InputDecoration(
//                       //     labelText: 'Phone Number',
//                       //     border: OutlineInputBorder(
//                       //       borderSide: BorderSide(),
//                       //     ),
//                       //   ),
//                       //   onChanged: (phone) {
//                       //     print(phone.completeNumber);
//                       //   },
//                       //   onCountryChanged: (country) {
//                       //     print('Country changed to: ' + country.name);
//                       //   },
//                       // ),
//                       //       final date = await showDatePicker(
//                       //     context: context,
//                       //     firstDate: DateTime(1900),
//                       //     initialDate: currentValue ?? DateTime.now(),
//                       //     lastDate: DateTime(2100));
//                       // if (date != null) {
//                       //   final time = await showTimePicker(
//                       //     context: context,
//                       //     initialTime:
//                       //         TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//                       // );
//                       //   return DateTimeField.combine(date, time);
//                       // } else {
//                       //   return currentValue;
//                       // }

//                       Center(child: Text('Choose your account type')),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                      Row(
//                        children: [
//                          new RadioListTile<int>(value: 0, groupValue: _radioValue,
//                               onChanged: _handleRadioValueChanged,
//                               title: const Text('Individual'),
//                             ),
//                             new RadioListTile<int>(
//                               value: 1,
//                               groupValue: _radioValue,
//                               onChanged: _handleRadioValueChanged,
//                               title: const Text('Company'),)
//                        ]
//                      ), 
// //                       // Center(
// //                       //   child: ToggleSwitch(
// //                       //     fontSize: 16.0,
// //                       //     initialLabelIndex: 1,
// //                       //     activeBgColor: [Colors.green],
// //                       //     activeFgColor: Colors.white,
// //                       //     inactiveBgColor: Colors.grey,
// //                       //     inactiveFgColor: Colors.green,
// //                       //     totalSwitches: 2,
// //                       //     labels: [
// //                       //       'Individual',
// //                       //       'Company',
// //                       //     ],
// //                       //     onToggle: (index) {
// //                       //       print('switched to: $index');
// //                       //     },
// //                       //   ),
// //                       // ),
// //                       // Center(
// //                       //     child: Text(
// //                       //   'choose gender',
// //                       //   style: TextStyle(fontWeight: FontWeight.bold),
// //                       // ),
// //                       // ),
// //                       SizedBox(
// //                         height: 20.0,
// //                       ),
// //                       Center(
// //                         child: Expanded(
// //                           child: ElevatedButton(
// //                               onPressed: () async {
// //                                 addUser();
// //                                 if (_formKey.currentState!.validate()) {
// //                                   //await _sendSMS(['0542608681']);
// //                                   try {
// //                                     UserCredential userCredential =
// //                                         await FirebaseAuth.instance
// //                                             .createUserWithEmailAndPassword(
// //                                                 email: "user@example.com",
// //                                                 password:
// //                                                     "SuperSecretPassword!");
// //                                   } on FirebaseAuthException catch (e) {
// //                                     if (e.code == 'weak-password') {
// //                                       print(
// //                                           'The password provided is too weak.');
// //                                     } else if (e.code ==
// //                                         'email-already-in-use') {
// //                                       print(
// //                                           'The account already exists for that email.');
// //                                     }
// //                                   } catch (e) {
// //                                     print(e);
// //                                   }
// //                                 }
// //                                 ;
// //                                 onPressed:
// //                                 () {
// //                                   Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                           builder: (context) => Dash()));
// //                                 };

// //                                 // if (_formKey.currentState!.validate()) ;
// //                                 // FirebaseAuth auth = FirebaseAuth.instance;
// //                                 // User? user;Navigator.push(context,

// //                                 // UserCredential userCredential =
// //                                 //     await auth.createUserWithEmailAndPassword(
// //                                 //   email: userEmail,
// //                                 //   password: userPassword,
// //                                 // );

// //                                 //if(result ==null) {}
// //                                 //await addUser();
//                               },
//                               child: Text(
//                                 'Signup',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.greenAccent,
//                                 ),
//                               )),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Already have account?'),
//                           Center(
//                             child: Expanded(
//                                 child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => LogIn()));
//                                     },
//                                     child: Center(child: Text('Signin')))),
//                           ),
//                         ],
//                       ),
//                     ])),
//                ),
//            )));
//    }}