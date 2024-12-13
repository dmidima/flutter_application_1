// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MarkdownViewer(
//         initialUrl:
//             'https://dmidima.github.io/flutter_application_1/README.md', // Ensure this file exists
//       ),
//     );
//   }
// }

// class MarkdownViewer extends StatelessWidget {
//   final String initialUrl;

//   const MarkdownViewer({super.key, required this.initialUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('документация'),
//       ),
//       body: Fetcher(url: initialUrl),
//     );
//   }
// }

// class Fetcher extends StatelessWidget {
//   final String url;

//   const Fetcher({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     Uri link = Uri.tryParse(url) ?? Uri();

//     return FutureBuilder<http.Response>(
//       future: http.get(link),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error loading: ${snapshot.error}'),
//           );
//         } else if (snapshot.hasData && snapshot.data?.statusCode == 200) {
//           String markdown = snapshot.data?.body ?? "";
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MarkdownBody(
//                 data: markdown,
//                 onTapLink: (text, href, title) {
//                   if (href != null) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => MarkdownViewer(
//                           initialUrl: Uri.parse(url).resolve(href).toString(),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 imageBuilder: (uri, title, alt) {
//                   final resolvedUrl =
//                       Uri.parse(url).resolve(uri.toString()).toString();
//                   return Image.network(resolvedUrl);
//                 },
//               ),
//             ),
//           );
//         } else {
//           return Center(
//             child: Text(
//               'Error: response code ${snapshot.data?.statusCode}',
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
