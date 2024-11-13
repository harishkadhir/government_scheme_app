import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'scheme_detail.dart'; // Import SchemeDetail if you have a detail page
import 'admin_login.dart'; // Import AdminLogin

class SchemeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Government Schemes', style: TextStyle(fontSize: 24, color: Colors.white)), // Title color set to white
        backgroundColor: Colors.redAccent, // App bar color
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(color: Colors.redAccent), // Drawer header color
            ),
            ListTile(
              title: Text('Admin Login', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLogin()),
                );
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('schemes').snapshots(),
        builder: (context, snapshot) {
          // Check connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Check if there are no documents
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No schemes available.', style: TextStyle(fontSize: 20)));
          }

          // Retrieve documents
          final schemes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: schemes.length,
            itemBuilder: (context, index) {
              var scheme = schemes[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                elevation: 4,
                color: Colors.white, // Card background color
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    scheme['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red), // Title color changed to red
                  ),
                  subtitle: Text(
                    'Published on: ${scheme['published_date']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  tileColor:
                  index % 2 == 0 ? Colors.red.shade50 : Colors.red.shade100, // Alternate background colors for list items
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchemeDetail(schemeId: scheme.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}