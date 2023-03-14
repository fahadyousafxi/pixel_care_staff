// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pixel_app/screens/Pdf_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';

class DownLoadsPage extends StatefulWidget {
  const DownLoadsPage({Key? key}) : super(key: key);

  @override
  State<DownLoadsPage> createState() => _DownLoadsPageState();
}

class _DownLoadsPageState extends State<DownLoadsPage> {
  Future<File?> downloadPDF() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
            child: CircularProgressIndicator(
          color: Color(0xfffaeaea),
        ));
      },
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    final url = Uri.parse('$baseUrl/api/user/document/pdf');
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(url, headers: headers);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      final Directory? appDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      String tempPath = appDir!.path;
      final String fileName = '${DateTime.now().microsecondsSinceEpoch}.pdf';
      File file = File('$tempPath/$fileName');
      if (!await file.exists()) {
        await file.create();
      }
      var downloadedFile = await file.writeAsBytes(response.bodyBytes);
      print(downloadedFile);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          // backgroundColor: Colors.grey,
          content: Text(
            ('Downloaded'),
          ),
        ),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PDFScreen(
            path: file.path,
            url: '$baseUrl/api/user/document/pdf',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PDF NOT FOUND'),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Downloads',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: InkWell(
                    onTap: () async {
                      downloadPDF();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5),
                        // border: ,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('Download My Profile')),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//   margin: EdgeInsets.only(top: 30.h, left: 10.w),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Icon(
//         Icons.arrow_back_ios_outlined,
//         size: 20.sp,
//         color: Colors.grey,
//       ),
//       SizedBox(width: 5.w),
//       Text(
//         'Documents Upload',
//         style: TextStyle(
//           fontSize: 20.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ],
//   ),
// ),

// files.exists() == false
//     ? ScaffoldMessenger.of(context)
//     .showSnackBar(const SnackBar(content: Text('PDF NOT FOUND')))
//     : Navigator.of(context).push(MaterialPageRoute(
//     builder: (_) => PDFScreen(
//       path: files.path,
//       url:
//       'https://pixelcare.stackbuffers.com/api/care-home/available-staff/download?position=${pos.indexOf(posSelected) + 1}&shift=${day == true ? "1" : "2"}&start_date=${start.day}-${start.month}-${start.year}&end_date=${end.day}-${end.month}-${end.year}',
//     )));

//                         ListTile(
//                           leading: Icon(
//                             Icons.file_copy_outlined,
//                             size: 31,
//                             color: Colors.blue,
//                           ),
//                           title: Text(
//                             "Show Document",
//                             style: TextStyle(fontSize: 18.sp),
//                           ),
// //                           String passportStatus = "Pending";
// // String dbsCertificateStatus = "Pending";
// // String rightToWorkStatus = "Pending";
// // String proofaddressStatus = "Pending";
// // String nationalInsuranceStatus = "Pending";
// // String p45p60Status = "Pending";
// // String termLetterStatus = "Pending";
// // String vaccinationProofStatus = "Pending";
// // String nmcLetterStatus = "Pending";
//                           subtitle: Text(
//                             "My File",
//                             style:
//                                 TextStyle(color: Colors.blue, fontSize: 15.sp),
//                           ),
//                         ),

// Map<Permission, PermissionStatus> statuses = await [
//   Permission.storage,
//   //add more permission to request here.
// ].request();
//
// if (statuses[Permission.storage]!.isGranted) {

//   // DownloadController().downloadPDF();
//
//
//   // var dir =
//   //     await DownloadsPathProvider.downloadsDirectory;
//   // if (dir != null) {
//   //   String savename = "myfile.pdf";
//   //   String savePath = dir.path + "/$savename";
//   //   print(savePath);
//   //   //output:  /storage/emulated/0/Download/banner.png
//   //
//   //   try {
//   //     await Dio().download(fileurl.toString(), savePath,
//   //         onReceiveProgress: (received, total) {
//   //       if (total != -1) {
//   //         print((received / total * 100)
//   //                 .toStringAsFixed(0) +
//   //             "%");
//   //         //you can build progressbar feature too
//   //       }
//   //     });
//   //     print("File is saved to download folder.");
//   //   } on DioError catch (e) {
//   //     print(e.message);
//   //   }
//   // }
// } else {
//   print("No permission to read and write.");
// }
//
// // Navigator.pushReplacement(
// //     context,
// //     MaterialPageRoute(
// //         builder: (context) => widgets[index]));
