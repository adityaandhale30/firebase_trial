// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_trial/homepage_screen.dart';
// import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_trial/view/animation_trial.dart';
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
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaleTransitionDemo(),
    );
  }
}
































// class HomePage extends StatelessWidget {
//   final List<String> imageUrls = [
//    "https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75","https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75","https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75","https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75",
//    "https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75",
//    "https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75","https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75","https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75",
   
//   ];

//   Future<List<String>> fetchImages() async {
//     // Simulate a network delay
//     await Future.delayed(Duration(seconds: 2));
//     return imageUrls;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shimmer with Network Images'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: fetchImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show shimmer effect
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8.0,
//                     mainAxisSpacing: 8.0,
//                     childAspectRatio: 3 / 4,
//                   ),
//                   itemCount: 6,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       margin: const EdgeInsets.all(4.0),
//                     );
//                   },
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error loading images'),
//             );
//           } else {
//             // Show grid with images
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.network(
//                       snapshot.data![index],
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         } else {
//                           return Shimmer.fromColors(
//                             baseColor: Colors.grey[300]!,
//                             highlightColor: Colors.grey[100]!,
//                             child: Container(
//                               color: Colors.white,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
//}
