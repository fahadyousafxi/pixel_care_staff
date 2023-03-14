// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pixel_app/screens/Pdf_Screen.dart';

import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  List title = [
    'Registered Nurse (RGN)',
    'Registered Mental Nurse (RMN)',
    'Senior Carer',
    'Health Care Assistant (HCA)',
    'Kitchen Assistant',
    'Chef'
  ];
  var titleSelected = 'Registered Nurse (RGN)';
  Dio dio = Dio();
  late Response response;
  var search = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.blue.shade50.withOpacity(0.4),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(20.h),
                            padding: EdgeInsets.all(5.h),
                            child: const Icon(
                              Icons.keyboard_arrow_left_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Documents',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 60.w,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: titleSelected,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select from this field';
                      }
                      return null;
                    },
                    items: title
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        titleSelected = value!;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      hintStyle: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: const Color(0xffACA9A9),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        search = val.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(18),
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.black,
                      ),
                      fillColor: const Color(0xfff0f0f0),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: 'Search',
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Text(
                  'Download Profile',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              StreamBuilder<http.Response>(
                  stream: http.get(Uri.parse('$baseUrl/api/user/document/pdf'),
                      headers: {
                        'Accept': 'application/json',
                        'Authorization': 'Bearer $token'
                      }).asStream(),
                  builder: (context, snapshot) {
                    print(snapshot.data?.request?.url);
                    if (snapshot.hasData) {
                      if (snapshot.data!.statusCode == 200) {
                        if (jsonDecode(snapshot.data!.body)['status'] == 200) {
                          print(jsonDecode(snapshot.data!.body));
                          return Column(
                            children: List.generate(
                              jsonDecode(snapshot.data!.body)['data'].length,
                              (index) => jsonDecode(snapshot.data!.body)['data']
                                      .elementAt(index)['name']
                                      .toString()
                                      .toLowerCase()
                                      .contains(search)
                                  ? Container(
                                      height: 50.h,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 8.h),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 1,
                                                blurRadius: 10)
                                          ]),
                                      padding: EdgeInsets.all(10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                    'assets/images/user.png'),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                  '${jsonDecode(snapshot.data!.body)['data'].elementAt(index)['name']}')
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              downloadPDF();
                                            },
                                            child: const Icon(
                                              Icons.save_alt,
                                              color: Colors.blue,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ),
                          );
                        } else {
                          return Container(
                            child: const Text(
                              'You are not authorized login again',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                      } else {
                        return Container(
                          child: const Text(
                            'please check your internet connection',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    } else {
                      return Container(
                        height: 30.h,
                        width: 30.h,
                        child: const CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> downloadPDF() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xfffaeaea),
          ),
        );
      },
    );
    final url = Uri.parse('$baseUrl/api/user/document/pdf');

    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(url, headers: headers);

    if (response != null) {
      final Directory? appDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      String tempPath = appDir!.path;
      final String fileName = '${DateTime.now().microsecondsSinceEpoch}.pdf';
      File file = File('$tempPath/$fileName');
      Navigator.pop(context);
      if (!await file.exists()) {
        await file.create();
      }
      var files = await file.writeAsBytes(response.bodyBytes);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PDFScreen(
            path: files.path,
            url: '$baseUrl/api/user/document/pdf',
          ),
        ),
      );
    }
    return null;
  }
}
