import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../hive_service.dart';

Future<User?> getCurrentUser() async {
  return FirebaseAuth.instance.currentUser;
}

Future<bool> updateUserProfile({required Map<String, dynamic> data}) async {
  bool isSuccessful = false;
  try {
    User? user = await getCurrentUser();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update(data);
    isSuccessful = true;
  } catch (e) {
    isSuccessful = false;
  }
  return isSuccessful;
}

Future<void> getFirestoreDoc({String? docid}) async {
  User? user = await getCurrentUser();
  CollectionReference collection =
      FirebaseFirestore.instance.collection('users');
  print('user id: ${FirebaseAuth.instance.currentUser!.uid}');
  var docSnapshot = await collection.doc(user!.uid).get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
    HiveService hiveService = HiveService();
    print('data: ${data.toString()}');
    await hiveService.storeUserData(data!);
  }
}
