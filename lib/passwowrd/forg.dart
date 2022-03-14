import 'package:flutter/material.dart';

class Forg extends StatefulWidget {
  const Forg({Key? key}) : super(key: key);

  @override
  State<Forg> createState() => _ForgState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController emailController = new TextEditingController();

String userEmail = '';

class _ForgState extends State<Forg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
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
            Center(
              child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) ;
                      },
                      child: Center(child: Text('Submit')))),
            ),
            Center(
              child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Center(child: Text('Signin')))),
            ),
          ],
        ),
      )),
    );
  }
}
