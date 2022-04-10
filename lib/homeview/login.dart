import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/farmers/firebase_operation.dart';
import 'package:farmers_konekt/farmers/re_register.dart';
import 'package:farmers_konekt/farmers/sign_upp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final AuthService_auth = AuthService();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool loading = false;

  String Password = '', assword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        //setState(() => userEmail = value);
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
                    TextFormField(
                      controller: passwordController,
                      onChanged: (value) {
                        //setState(() => Email = value);
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
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                              await getFirestoreDoc();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Dash();
                              }));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          }
                        },
                        child: Text(
                          'Signin',
                          style: TextStyle(color: Colors.greenAccent),
                        )),
                    TextButton(
                      onPressed: () {
                        if (emailController.text.isNotEmpty) {
                          // Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Password Reset'),
                                    content: const Text(
                                        'A Password reset link has been sent to your email'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                        } else if (emailController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Enter Email'),
                                    content:
                                        const Text('Please enter  your email'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                          // const SnackBar(
                          //     backgroundColor: Colors.white,
                          //     content: Center(child: Loading())),
                          // );
                          // Navigator.pop(context);

                        }
                        // final FirebaseAuth firebaseAuth =
                        //     FirebaseAuth.instance;
                        // User? currentUser = firebaseAuth.currentUser;
                        // currentUser?.updatePassword("newpassword");
                        FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);

                        ///make dynamic
                      },
                      style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 8, 15, 8),
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReRegister(),
                                      ));
                                },
                                child: Text('Farmer')),
                            // TextButton(
                            //     onPressed: () {
                            //       bool isValid = _formKey.currentState!.validate();
                            //       if (isValid) {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => LogIn(),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //     child: Text('Fbo')),
                            // TextButton(
                            //     onPressed: () {
                            //       bool isValid = _formKey.currentState!.validate();
                            //       if (isValid) {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(builder: (context) => LogIn()),
                            //         );
                            //       }
                            //     },
                            //     child: Text('Equipment owner')),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ))),
    ));
  }
}
