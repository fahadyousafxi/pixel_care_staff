import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pixel_app/Controller/Download_Controller.dart';

class PayOutsScreen extends StatefulWidget {
  const PayOutsScreen({Key? key}) : super(key: key);

  @override
  State<PayOutsScreen> createState() => _PayOutsScreenState();
}

class _PayOutsScreenState extends State<PayOutsScreen> {
  String fileurl = "https://www.africau.edu/images/default/sample.pdf";
  // final fileurl =  DownloadController();
  // String fileurl = ref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Pay-Outs',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
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
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () async {
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.storage,
                          //add more permission to request here.
                        ].request();

                        if (statuses[Permission.storage]!.isGranted) {
                          var dir =
                          await DownloadsPathProvider.downloadsDirectory;
                          if (dir != null) {
                            String savename = "myfile.pdf";
                            String savePath = dir.path + "/$savename";
                            print(savePath);
                            //output:  /storage/emulated/0/Download/banner.png

                            try {
                              await Dio().download(fileurl.toString(), savePath,
                                  onReceiveProgress: (received, total) {
                                    if (total != -1) {
                                      print((received / total * 100)
                                          .toStringAsFixed(0) +
                                          "%");
                                      //you can build progressbar feature too
                                    }
                                  });
                              print("File is saved to download folder.");
                            } on DioError catch (e) {
                              print(e.message);
                            }
                          }
                        } else {
                          print("No permission to read and write.");
                        }

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => widgets[index]));
                      },
                      child: Container(
                          margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(5),
                              // border: ,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  spreadRadius: 1,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('Download My Pay-Outs')),
                          )
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
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );

    ;
  }
}
