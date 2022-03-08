import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class UserTakeMeTo extends StatefulWidget {
  const UserTakeMeTo({ Key? key }) : super(key: key);

  @override
  State <UserTakeMeTo> createState() => _UserTakeMeToState();
}

class _UserTakeMeToState extends State<UserTakeMeTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.greenAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Activation Complete'),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.mark_as_unread),
                Text(
                  'Congratulation your acccouny has been activaed succesful',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Dash()),
                      );
                    },
                    child: Text('okay')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}