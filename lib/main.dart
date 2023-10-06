import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'splash_screen.dart';
import 'about_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyALFQHFo_SwfXWx5HnGaZAuIVDVUCbVQTI",
        appId: "1:28521925582:android:552c4723a7bdc0e56df99f",
        messagingSenderId: "28521925582",
        projectId: "uts-061023",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase CRUD App',
      routes: {
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
