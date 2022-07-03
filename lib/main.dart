import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twit/ui/loginwithemail.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAtYx7mQTmo3wfXZ5qN9ETd7NasXwwyMmo",
        appId: "1:266577175299:web:94c074db4b70f5793a3f36",
        messagingSenderId: "266577175299",
        projectId: "circles-762a7",
        authDomain: "circles-762a7.firebaseapp.com",
        storageBucket: "circles-762a7.appspot.com",
      ));
  } else {
    await Firebase.initializeApp();
    
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginWithEmail(),
    );
  }
}
