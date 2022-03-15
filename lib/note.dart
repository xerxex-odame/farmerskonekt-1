import 'package:hive/hive.dart';
part 'note.g.dart';
@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String fullName;
  @HiveField(1)
  String region;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  String gender;
  @HiveField(4)
  String location;
  @HiveField(5)
  String farmLand;
  @HiveField(6)
  String email;
  @HiveField(7)
  String accountType;
 
  Note({ 
    required this.fullName,
    required this.gender,
     required this.location,
    required this.region,
     required this.phoneNumber,
    required this.accountType,
     required this.email,
    required this.farmLand,
  });
}