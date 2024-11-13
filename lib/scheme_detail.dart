import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchemeDetail extends StatelessWidget {
  final String schemeId;

  SchemeDetail({required this.schemeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text(
          'Scheme Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('schemes').doc(schemeId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching details'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Scheme not found'));
          }

          var scheme = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader('Name:'),
                Text(
                  '${scheme['name']}',
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                _buildSectionHeader('Published Date:'),
                Text(
                  '${scheme['published_date']}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                _buildSectionHeader('Start Date:'),
                Text(
                  '${scheme['start_date']}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                _buildSectionHeader('End Date:'),
                Text(
                  '${scheme['end_date']}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                GestureDetector(
                  onTap: () => _launchURL(scheme['registration_link']),
                  child: Text(
                    'Registration Link',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 18),
                  ),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                _buildSectionHeader('About:'),
                Text(
                  '${scheme['about']}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Divider(thickness: 1.5, color: Colors.red[300]),

                _buildSectionHeader('Requirements:'),
                Text(
                  '${scheme['requirements']}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red[800],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri launchUri = Uri.parse(url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
