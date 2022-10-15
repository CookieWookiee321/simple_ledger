import 'package:isar/isar.dart';

part 'profile_model.g.dart';

@collection
class Profile {
  Id id = Isar.autoIncrement;
  String? name;

  Profile(this.name);

  @override
  String toString() {
    return name!;
  }
}
