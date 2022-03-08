import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class UserTakeMe extends StatefulWidget {
  const UserTakeMe({ Key? key }) : super(key: key);

  @override
  State <UserTakeMe> createState() => _UserTakeMeState();
}

class _UserTakeMeState extends State<UserTakeMe> {
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