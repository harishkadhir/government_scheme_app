import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'add_scheme.dart'; // Import AddScheme page

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _controller = TextEditingController();

  void _checkCode() {
    if (_controller.text == "batmanhk") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AddScheme()),
      );
    } else {
      Fluttertoast.showToast(msg: "Invalid code, please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _checkCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: Text("Login",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: "Enter Admin Code",
        labelStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}