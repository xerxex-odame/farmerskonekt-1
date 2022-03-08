// import 'package:flutter/material.dart';

// // Import the firebase_core and cloud_firestore plugin
// //import 'package:firebase_core/firebase_core.dart';

// class AddUser extends StatelessWidget {
//   final String firstName;
//   final String lastName;
//   final int dateOfBirth;
//   final String region;
//   final String location;
//   final String country;
//   final String district;
//   final String phoneNumber;
//   final String gender;
//   final int farmLand;
//   final String accountType;
//   final String landSize;

//   AddUser(
//     this.firstName,
//     this.lastName,
//     this.dateOfBirth,
//     this.location,
//     this.region,
//     this.country,
//     this.phoneNumber,
//     this.gender,
//     this.accountType,
//     this.farmLand,
//     this.district,
//     this.landSize,
//   );

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'firstName': firstName, // John Doe
//             'lastName': lastName, // Stokes and Sons
//             'dateOfBirth': dateOfBirth, // 42
//             'gender': gender,
//             'district': 'district',
//             'phoneNumber': 'phoneNumber',
//             'region': 'region',
//             'location': 'location',
//             'country': 'country',
//             'landSize': 'landSize',
//             'farmLand': 'farmLand',
//             'accountType': 'accountType',
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }
