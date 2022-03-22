import 'package:flutter/material.dart';
//import 'package:dash_chat/dash_chat.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  //String _commentChil = 'filedata';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          
        ]),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       CommentBox(
      //         userImage:
      //             "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
      //         // child: commentChild(filedata),
      //         labelText: 'Write a comment...',
      //         withBorder: false,
      //         errorText: 'Comment cannot be blank',
      //         sendButtonMethod: () {
      //           // if (formKey.currentState.validate()) {
      //           //   print(commentController.text);
      //           //   setState(() {
      //           //     var value = {
      //           //       'name': 'New User',
      //           //       'pic':
      //           //           'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
      //           //       'message': commentController.text
      //           //     };
      //           //     filedata.insert(0, value);
      //           //   });
      //           //   commentController.clear();
      //           //   FocusScope.of(context).unfocus();
      //           // } else {
      //           //   print("Not validated");
      //           // }
      //         },
      //         formKey: formKey,
      //         commentController: commentController,
      //         backgroundColor: Colors.black,
      //         textColor: Colors.white,
      //         sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
      //       ),
      //     ],
      //   ),
     /// ),
    );
  }
}
