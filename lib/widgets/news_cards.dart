// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
//
// class NewsCard extends StatelessWidget {
//   final String imageUrl, title, description, source, date;
//   const NewsCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//     required this.source,
//     required this.date,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Article Image
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//             ),
//             child: CachedNetworkImage(
//               imageUrl: imageUrl,
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               placeholder: (context, url) => const Center(
//                 child: CircularProgressIndicator(),
//               ),
//               errorWidget: (context, url, error) => const Center(
//                 child: Icon(Icons.error, size: 50, color: Colors.red),
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 Text(
//                   title,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 5),
//                 // Source & Date
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(source, style: const TextStyle(color: Colors.blue, fontSize: 12)),
//                     Text(date, style: const TextStyle(fontSize: 12)),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 // Description
//                 Text(description, style: const TextStyle(fontSize: 14), maxLines: 3, overflow: TextOverflow.ellipsis),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }