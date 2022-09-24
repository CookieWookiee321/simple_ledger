import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_ledger/models/profile_model.dart';

class HomePageController extends ChangeNotifier {
  //List<Profile> allProfiles = List.empty(growable: true);
  //Profile currentProfile =

  void addProfile(Profile profile) {
    final profilesBox = Hive.box('profiles');
    profilesBox.add(profile);
  }

  //List<Profile> getProfilesList() {

  //}
}