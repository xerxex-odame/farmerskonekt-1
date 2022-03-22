import 'package:farmers_konekt/note.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class HiveService extends ChangeNotifier {
  List<Note> _notes = [];
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);
  final String noteHiveBox = 'note-box';

  Future<void> addItem(Note note) async {
    Box box = Hive.box(noteHiveBox);
    box.put("fullName", note.fullName);
    box.put("region", note.region);
    box.put("phoneNumber", note.phoneNumber);
    box.put("gender", note.gender);
    box.put("location", note.location);
    box.put("email", note.email);
    box.put("accountType", note.accountType);

    notifyListeners();
  }

  Future storeUserData(Map data) async {
    Box box = await Hive.openBox(noteHiveBox);
    box.put('user_info', data);
  }

  Future clearUserData() async {
    Box box = await Hive.openBox(noteHiveBox);
    box.clear();
  }

  Future<void> addSignUpItem(Note note) async {
    Box box = await Hive.openBox(noteHiveBox);
    await box.clear();
    box.put('uid', note.uid);
    // box.put("region", note.region);
    box.put("phoneNumber", note.phoneNumber);
    box.put("gender", note.gender);
    box.put("location", note.location);
    box.put("email", note.email);
    box.put("accountType", note.accountType);
    box.put("fullName", note.fullName);
    notifyListeners();
  }

  Future<void> addDetailsItem(Note note) async {
    Box box = await Hive.openBox(noteHiveBox);
    await box.clear();

    box.put("region", note.region);
    box.put("fullName", note.fullName);
    notifyListeners();
  }

  //Retrieving data
  Map<String, dynamic> retrieveItems() {
    Box box = Hive.box(noteHiveBox);
    // debugPrint('__box: ' + box.toMap().cast<String, dynamic>().toString());
    return box.toMap().cast<String, dynamic>();
  }

  //updating the value present at a particular index
  Future<void> updateatIndexItem(Note note) async {
    Box box = Hive.box(noteHiveBox);
    box.putAt(0, "Samuel ");
    box.putAt(1, " Sampong");
    box.putAt(2, "");
    box.putAt(3, "skwame");
    box.putAt(4, "Bla ");
    box.putAt(5, "School of  Sciences");
    box.putAt(6, "Chemistry");
    notifyListeners();
  }

  String getItem(String key) {
    Box box = Hive.box(noteHiveBox);
    return box.get(key);
  }

  Future<Map> getUserInfo() async{
    Box box = await Hive.openBox(noteHiveBox);
    // Box box = Hive.box(noteHiveBox);
    print('box:' + box.toMap().toString());
    return box.toMap()['user_info'];
  }

//Deleting data
  Future<void> deleteItem(Note note) async {
    Box box = Hive.box(noteHiveBox);
    box.delete("fullName ");
    box.deleteAt(0);
    box.delete("region");
    box.deleteAt(1);
    box.delete("phoneNumber");
    box.deleteAt(2);
    box.delete("gender");
    box.deleteAt(3);
    box.delete("location");
    box.deleteAt(4);
    box.delete("email");
    box.deleteAt(5);
    box.delete("accountType");
    box.deleteAt(6);
    notifyListeners();
  }
}
