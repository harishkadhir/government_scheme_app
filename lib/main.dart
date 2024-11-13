import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Ensure this file is generated by flutterfire configure
import 'scheme_list.dart'; // Import SchemeList

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Government Schemes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SchemeList(), // Your scheme list widget here.
    );
  }
}