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

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DisplayCard extends StatelessWidget {
  List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/250',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/350',
    'https://via.placeholder.com/400',
  ];

  DisplayCard({super.key});

  Future<List<String>> fetchImages() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer with Network Images'),
      ),
      body: FutureBuilder<List<String>>(
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
                      snapshot.data![index],
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
    );
  }
}

