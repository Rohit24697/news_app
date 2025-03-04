// import 'package:flutter/material.dart';
// import 'package:news_app/widgets/news_cards.dart';
// import 'package:news_app/widgets/news_catagory.dart';
//
// class NewsPage extends StatefulWidget {
//   const NewsPage({super.key});
//
//   @override
//   State<NewsPage> createState() => _NewsPageState();
// }
//
// class _NewsPageState extends State<NewsPage> {
//   bool isDarkMode = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.deepPurpleAccent),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('News App',
//                         style: TextStyle(color: Colors.white, fontSize: 25)),
//                     SizedBox(height: 5),
//                     Text('Stay informed',
//                         style: TextStyle(color: Colors.white70)),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("Home"),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("Reading History"),
//               onTap: () {},
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.wb_sunny),
//               title: Text('Dark Mode'),
//               trailing: Switch(
//                 value: isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     isDarkMode = value;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "News App",style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white, size: 25.0,),
//             onPressed: () {
//               // Implement search functionality here
//               print("Search clicked!");
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             /// SINGLECHILDSCROLLVIEW FOR NEWS CATEGORIES
//             SizedBox(
//               height: 50, // Adjust height for better visibility
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 8), // Padding at start
//                     NewsCategory(label: 'General', isSelected: true),
//                     NewsCategory(label: 'Business'),
//                     NewsCategory(label: 'Technology'),
//                     NewsCategory(label: 'Sports'),
//                     NewsCategory(label: 'Entertainment'),
//                     NewsCategory(label: 'Health'),
//                     NewsCategory(label: 'Science'),
//                     const SizedBox(width: 8), // Padding at end
//                   ],
//                 ),
//               ),
//             ),
//             // News Articles List
//             // Expanded(
//             //   child: ListView(
//             //     children: const [
//             //       NewsCard(
//             //         imageUrl: "",
//             //         title: "",
//             //         description: "",
//             //         source: "",
//             //         date: "",
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
