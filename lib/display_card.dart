// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class DisplayCard extends StatelessWidget {
//   const DisplayCard({super.key});

//   List<String,dynamic> GetFireBaseData() {

//     List<String,dynamic> fbData = [];

//     return fbData

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<String>>(
//         future: await GetFireBaseData(),
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

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DisplayCard extends StatelessWidget {
  List<Map<String, dynamic>> imageUrls = [];

  DisplayCard({super.key});

  Future<List<Map<String, dynamic>>> fetchImages() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));

    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("Gavhane").get();
    imageUrls.clear();

    for (int i = 0; i < responce.docs.length; i++) {
      log(responce.docs[i]["iq"]);

      imageUrls
          .add({"iq": responce.docs[i]["iq"], 
         // "age": responce.docs[i]["uid"]
          });
    }

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer with Network Images'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show shimmer effect
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.all(4.0),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading images'),
            );
          } else {
            // Show grid with images
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      snapshot.data![index]["iq"],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchImages();
      }),
    );
  }
}
