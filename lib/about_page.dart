import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart' as lorem;
import 'package:firebase_auth/firebase_auth.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loremText = lorem.loremIpsum(
        paragraphs: 10, words: 500); // Generate more text for scrolling

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
              ),
              child: Text(
                'Welcome User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Homepage'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView for scrollability
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                loremText,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
