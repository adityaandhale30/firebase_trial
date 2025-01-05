import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_trial/display_card.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log("dddddddd");
          Map<String, dynamic> data = {
            "iq":
                "https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg",
            "age": 21
          };
          await FirebaseFirestore.instance.collection("Gavhane").add(data);
          log("adeddd");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DisplayCard(),
          ));
        },
      ),
    );
  }
}
