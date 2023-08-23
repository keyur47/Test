import 'package:dht/dht.dart';
import 'package:dht/helper/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await AppPreference.initMySharedPreferences();

  runApp(Dht());
}
