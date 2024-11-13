import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddScheme extends StatefulWidget {
  @override
  _AddSchemeState createState() => _AddSchemeState();
}

class _AddSchemeState extends State<AddScheme> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController publishedDateController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController registrationLinkController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();

  void _addScheme() async {
    // Check if all fields are filled
    if (nameController.text.isEmpty ||
        publishedDateController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty ||
        registrationLinkController.text.isEmpty ||
        aboutController.text.isEmpty ||
        requirementsController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields.");
      return;
    }

    // Add scheme to Firestore
    await FirebaseFirestore.instance.collection('schemes').add({
      'name': nameController.text,
      'published_date': publishedDateController.text,
      'start_date': startDateController.text,
      'end_date': endDateController.text,
      'registration_link': registrationLinkController.text,
      'about': aboutController.text,
      'requirements': requirementsController.text,
    });

    Fluttertoast.showToast(msg: "Scheme added successfully!");

    // Clear text fields after adding scheme
    nameController.clear();
    publishedDateController.clear();
    startDateController.clear();
    endDateController.clear();
    registrationLinkController.clear();
    aboutController.clear();
    requirementsController.clear();

    Navigator.pop(context); // Go back after adding scheme
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Scheme',
          style: TextStyle(color: Colors.white), // Title color set to white
        ),
        backgroundColor: Colors.redAccent, // App bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Allows scrolling if keyboard appears
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(nameController, "Name"),
              _buildTextField(publishedDateController, "Published Date"),
              _buildTextField(startDateController, "Start Date"),
              _buildTextField(endDateController, "End Date"),
              _buildTextField(registrationLinkController, "Registration Link"),
              _buildTextField(aboutController, "About"),
              _buildTextField(requirementsController, "Requirements"),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Make button width full
                child: ElevatedButton(
                  onPressed: _addScheme,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Button background color
                    padding: EdgeInsets.symmetric(vertical: 15), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners for button
                    ),
                    elevation: 5, // Added elevation for a shadow effect
                  ),
                  child: Text("Add Scheme",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)), // Button text style with white color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Space between text fields
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners for text field
            borderSide: BorderSide(color: Colors.redAccent), // Border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.redAccent), // Focused border color
          ),
          labelStyle: TextStyle(color: Colors.redAccent), // Label color
        ),
      ),
    );
  }
}