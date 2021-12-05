import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DownloadState { downloaded, downloading, notDonwloaded, errorDownloading }

class Variables {
  static String? userToken;
  static String? role;
  static SharedPreferences? prefs;

  static ValueNotifier<int> currentScreenIndexNotifier = ValueNotifier<int>(0);

  static double speed = 1.0;

  static File? newUserPhoto;
  static String? newUserName;
  static String? newUserPhone;

  static ValueNotifier<DownloadState> downloadNotifier =
      ValueNotifier(DownloadState.notDonwloaded);

  static ValueNotifier<bool> downloadedBookNotifier = ValueNotifier(true);

  // reference to our single class that manages the database
}
