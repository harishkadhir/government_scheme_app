import 'package:flutter/material.dart';
import 'scheme_list.dart'; // Import your scheme list page

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SchemeList()),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Government Schemes App',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}