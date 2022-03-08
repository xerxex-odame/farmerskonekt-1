import 'package:farmers_konekt/farmers/das.dart';
import 'package:farmers_konekt/homeview/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class UserComfirmation extends StatefulWidget {
  const UserComfirmation({ Key? key }) : super(key: key);

  @override
  State<UserComfirmation> createState() => _UserComfirmationState();
}

class _UserComfirmationState extends State<UserComfirmation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //tring _code = '';
    bool _onEditing = false;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            VerificationCode(
              textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
              keyboardType: TextInputType.number,
              underlineColor: Colors
                  .amber, // If this is null it will use primaryColor: Colors.red from Theme
              length: 4,
              cursorColor:
                  Colors.blue, // If this is null it will default to the ambient
              // clearAll is NOT required, you can delete it
              // takes any widget, so you can implement your design
              clearAll: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'clear all',
                  style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[700]),
                ),
              ),
              onCompleted: (String value) {
                setState(() {
                 // _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
                if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),
            Row(
              children: [
                Text("Don't have the code"),
                TextButton(onPressed: () {

                }, child: Text('Resend code')),
              ],
            ),
            TextButton(
                onPressed: () {
                  bool isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Dash();
                      }),
                    );
                  }
                },
                child: Text('Activate')),
            TextButton(onPressed: () {
              bool isValid = _formKey.currentState!.validate();
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LogIn();
                            }),
                          );
            }, child: Text('Back to login')),
          ],
        ),
      ),
    ); 
  }
}