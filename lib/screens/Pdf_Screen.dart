// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:uc_pdfview/uc_pdfview.dart';
//
// class PDFScreen extends StatefulWidget {
//   final String? path;
//   var url;
//   PDFScreen({Key? key, this.path, this.url}) : super(key: key);
//
//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }
//
// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   final Completer<PDFViewController> _controller =
//   Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';
//   getInit() async {}
//   @override
//   void initState() {
//     getInit();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Colors.grey,
//           ),
//         ),
//         centerTitle: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'My Profile',
//           style: TextStyle(
//               fontSize: 18.sp,
//               color: Colors.black,
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//
//
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   title: const Text("My Profile"),
//       //   // actions: <Widget>[
//       //   //   IconButton(
//       //   //     icon: const Icon(Icons.share),
//       //   //     onPressed: () async {
//       //   //       await FlutterShare.shareFile(
//       //   //         title: 'File Share',
//       //   //         text: 'File Share',
//       //   //         filePath: widget.path!,
//       //   //       );
//       //   //     },
//       //   //   ),
//       //   // ],
//       // ),
//       body: Stack(
//         children: <Widget>[
//           UCPDFView(
//             isLocalFilePath: true,
//             filePath: widget.path,
//             enableSwipe: true,
//             swipeHorizontal: true,
//             autoSpacing: false,
//             pageFling: true,
//             pageSnap: true,
//             defaultPage: currentPage!,
//             fitPolicy: FitPolicy.BOTH,
//             preventLinkNavigation:
//             true, // if set to true the link is handled in flutter
//             onRender: (_pages) {
//               setState(() {
//                 pages = _pages;
//                 isReady = true;
//               });
//             },
//
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$page: ${error.toString()}';
//               });
//               print('$page: ${error.toString()}');
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               _controller.complete(pdfViewController);
//             },
//             onLinkHandler: (String? uri) {
//               print('goto uri: $uri');
//             },
//             onPageChanged: (int? page, int? total) {
//               print('page change: $page/$total');
//               setState(() {
//                 currentPage = page;
//               });
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//               ? const Center(
//             child: CircularProgressIndicator(),
//           )
//               : Container()
//               : Center(
//             child: Text(errorMessage),
//           )
//         ],
//       ),
//       // floatingActionButton: FutureBuilder<PDFViewController>(
//       //   future: _controller.future,
//       //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//       //     if (snapshot.hasData) {
//       //       return FloatingActionButton.extended(
//       //         label: Text("Go to ${pages! ~/ 2}"),
//       //         onPressed: () async {
//       //           await snapshot.data!.setPage(pages! ~/ 2);
//       //         },
//       //       );
//       //     }
//       //
//       //     return Container();
//       //   },
//       // ),
//     );
//   }
// }
