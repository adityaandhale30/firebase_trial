import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA3_-y455AmYbSphiWZvuqvcFmK5BHeDmw",
        appId: "1:769451998620:android:caecf9565dff35ea8b1c59",
        messagingSenderId: "769451998620",
        projectId: "llb3-5e525"),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            log("dddddddd");
            Map<String, dynamic> data = {"iq": 10, "age": 21};
            await FirebaseFirestore.instance.collection("Gavhane").add(data);
            log("adeddd");
          },
        ),
      ),
    );
  }
}
