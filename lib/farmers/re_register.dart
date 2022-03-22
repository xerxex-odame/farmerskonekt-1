import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/farmers/details.dart';
import 'package:farmers_konekt/homeview/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReRegister extends StatefulWidget {
  const ReRegister({Key? key}) : super(key: key);

  @override
  State<ReRegister> createState() => _ReRegisterState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController comfirmPasswordController = new TextEditingController();
TextEditingController dateOfBirthController = new TextEditingController();
TextEditingController genderController = new TextEditingController();
TextEditingController accountTypeController = new TextEditingController();
TextEditingController phoneNumberController = new TextEditingController();

CollectionReference users = FirebaseFirestore.instance.collection('users');

get screenWidth => null;

// @override
// void initState() {
//   initPlatformState();
// }

// void initPlatformState() {}

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
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
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

class _ReRegisterState extends State<ReRegister> {
  // get _handleRadioValueChanged => null;

  // get _radioValue => null;

  @override
  Widget build(BuildContext context) {
    // var radioValue = _radioValue;
    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/tractors.jpg'), fit: BoxFit.cover),
        ),
        //child: Container(
         // width: screenWidth,
         // decoration: BoxDecoration(
           // gradient: LinearGradient(colors: [
              // Colors.green[800]!.withOpacity(0.9),
             // Colors.black.withOpacity(0.5),
              //Color.fromARGB(255, 0, 1, 2).withOpacity(0.9)
            //]),
          //),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
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
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    onChanged: (value) {
                      setState(() => userPhoneNumber = value);
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                     // hintText: 'Enter phone number',
                      labelText: 'Enter your Phone',
                      //border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Phone number';
                      }
                      ;
                      return null;
                    },
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
                        // } else if (value.length > 9) {
                        //   return 'please enter password';
                      }
                      ;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: comfirmPasswordController,
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
                      }
                      ;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(child: Text('Choose your account type')),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Row(children: [
                  //   new RadioListTile<int>(
                  //     value: 0,
                  //     groupValue: radioValue,
                  //     onChanged: _handleRadioValueChanged,
                  //     title: const Text('Individual'),
                  //   ),
                  //   new RadioListTile<int>(
                  //     value: 1,
                  //     groupValue: _radioValue,
                  //     onChanged: _handleRadioValueChanged,
                  //   /  title: const Text('Company'),
                  //   )
                  // ]),
                  Center(
                      child: Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                    addUser();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Details();
                                    }));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                                ;
                              },
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              )))),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Already have account?'),
                    Center(
                        child: Expanded(
                            child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn()));
                          },
                          child: Center(child: Text('Sign In'))),
                    ))),
                  ]),
                ],
              )),
        ),
     // ),
    );
  }
}
