//import 'package:flutter/material.dart';

// class ChangePass extends StatefulWidget {
//   const ChangePass({Key? key}) : super(key: key);

//   @override
//   State<ChangePass> createState() => _ChangePassState();
// }

// class _ChangePassState extends State<ChangePass> {
//   TextEditingController oldPasswordController = new TextEditingController();
//   TextEditingController newPasswordController = new TextEditingController();
//   TextEditingController comfirmNewpasswordController =
//       new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Form(
//             child: Column(
//           children: [
//             TextFormField(
//               controller: oldPasswordController,
//               obscureText: true,
//               onChanged: (value) {
//                 String userOldPassword;
//                 setState(() => userOldPassword = value);
//               },
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.person),
//                 hintText: 'Enter old',
//                 labelText: 'Enter your old password',
//                 //border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Enter your old password';
//                 } else if (!value.contains('.length > 9')) {
//                   return 'please enter old password';
//                 }
//                 ;
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: newPasswordController,
//               obscureText: true,
//               onChanged: (value) {
//                 String newPassword;

//                 setState(() => newPassword = value);
//               },
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.person),
//                 hintText: 'Enter New',
//                 labelText: 'Enter your new password',
//                 //border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Enter your new password';
//                 } else if (!value.contains('.length > 9')) {
//                   return 'please enter new password';
//                 }
//                 ;
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: newPasswordController,
//               obscureText: true,
//               onChanged: (value) {
//                 String usernewPassword;
//                 setState(() => usernewPassword = value);
//               },
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.person),
//                 hintText: 'Enter comfirm New',
//                 labelText: 'Enter your comfirm new password',
//                 //border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Enter your comfirm new password';
//                 } else if (!value.contains('.length > 9')) {
//                   return 'please enter comfirm new password';
//                 }
//                 ;
//                 return null;
//               },
//             ),
//             ElevatedButton(
//                 onPressed: () {}, child: Center(child: Text('Submit'))),
//           ],
//         )),
//       ),
//     );
//   }
// }
