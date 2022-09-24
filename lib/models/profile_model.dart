import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Profile {
  Profile({
    required this.id,
    required this.name,
    this.password = ""
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  //TODO: Research password encryption
  @HiveField(2)
  String password;

  @override
  String toString() {
    return name;
  }
}