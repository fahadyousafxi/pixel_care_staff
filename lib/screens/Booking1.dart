import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/BookingController.dart';
import '../Model/BookingModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Booking1Page extends StatefulWidget {
  Booking1Page({Key? key, this.ind}) : super(key: key);
  int? ind = 0;
  @override
  State<Booking1Page> createState() => _Booking1PageState();
}

class _Booking1PageState extends State<Booking1Page> {
  int index = 0;
  Future<BookingModel>? confirm;
  Future<BookingModel>? unconfirm;
  @override
  void initState() {
    index = widget.ind ?? 0;
    GetBookings();
    // TODO: implement initState
    super.initState();
  }

  GetBookings() async {
    confirm = BookingController().GetConfirmed();
    unconfirm = BookingController().GetUnConfirmed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
          'Bookings',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 844.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(top: 30.h, left: 10.w),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: Icon(
                    //           Icons.arrow_back_ios_outlined,
                    //           size: 20.sp,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       SizedBox(width: 5.w),
                    //       Text(
                    //         'Bookings',
                    //         style: TextStyle(
                    //           fontSize: 20.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: SizedBox(
                        height: 60.h,
                        width: 700.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Confirmed',
                                      style: TextStyle(
                                          color: index == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 1
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Unconfirmed',
                                      style: TextStyle(
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width,
                            child: StreamBuilder<BookingModel>(
                                stream: confirm?.asStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: const Text(
                                                  "No Confirmed Booking")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data?.data?.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10.w,
                                                    right: 10.w,
                                                    top: 10.h),
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.grey.shade100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade400,
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                    )
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Image(image: AssetImage('assets/images/calendar2.png'), height: 44, width: 44,),

                                                          ],
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                '${snapshot.data?.data?.elementAt(index).careHome!.name}'),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              child: Text(
                                                                '${snapshot.data?.data?.elementAt(index).title}',
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.sp),
                                                              ),
                                                            ),

                                                            /// changes
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              child: Text(
                                                                'Shift Details: ${snapshot.data?.data?.elementAt(index).timeStart.toString().substring(0,4)} - ${snapshot.data?.data?.elementAt(index).timeEnd.toString().substring(0,4)}',
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0xff687bb9),
                                                                    fontSize: 17.sp),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${snapshot.data?.data?.elementAt(index).date}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      17.sp),
                                                            ),
                                                            /// will change it

                                                            // Text(
                                                            //   '${snapshot.data?.data?.elementAt(index).date.toString().substring(0,11)} - ${snapshot.data?.data?.elementAt(index).jobEndDate.toString().substring(0,11)}',
                                                            //   style:
                                                            //   TextStyle(
                                                            //     color: Color(
                                                            //         0xff687bb9),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        // SizedBox(width: 20.w),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              height: 25.h,
                                                              width: 25.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .redAccent
                                                                    .shade100,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '-asdfsfasdfsf',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20.sp,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 25.h),
                                                          ],
                                                        ),
                                                        SizedBox(width: 10.w),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        // Text(
                                                        //   '${snapshot.data?.data?.elementAt(index).timeStart}-${snapshot.data?.data?.elementAt(index).timeEnd}',
                                                        //   style: TextStyle(
                                                        //       color: Color(
                                                        //           0xff687bb9),
                                                        //       fontSize: 17.sp),
                                                        // ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return const Center(
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          )),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: index == 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width,
                            child: StreamBuilder<BookingModel>(
                                stream: unconfirm?.asStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: const Text(
                                                  "No Unconfirmed Booking")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10.w,
                                                    right: 10.w,
                                                    top: 10.h),
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.grey.shade100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade400,
                                                      spreadRadius: 1,
                                                      blurRadius: 10,
                                                    )
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // Column(
                                                        //   children: [
                                                        //     Row(
                                                        //       children: [
                                                        //         Container(
                                                        //           height: 10.h,
                                                        //           width: 2.w,
                                                        //           color: Colors
                                                        //               .blue,
                                                        //         ),
                                                        //         SizedBox(
                                                        //             width:
                                                        //                 20.w),
                                                        //         Container(
                                                        //           height: 10.h,
                                                        //           width: 2.w,
                                                        //           color: Colors
                                                        //               .blue,
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //     Column(
                                                        //       children: [
                                                        //         Container(
                                                        //           height: 60.h,
                                                        //           width: 50.w,
                                                        //           decoration:
                                                        //               BoxDecoration(
                                                        //             borderRadius:
                                                        //                 BorderRadius.circular(
                                                        //                     10),
                                                        //             border: Border.all(
                                                        //                 color: Colors
                                                        //                     .blue,
                                                        //                 width:
                                                        //                     2),
                                                        //           ),
                                                        //           child: Column(
                                                        //             children: [
                                                        //               Text(
                                                        //                 '${snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "01" ? "JAN" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "02" ? "FEB" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "03" ? "MAR" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "04" ? "APR" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "05" ? "MAY" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "06" ? "JUN" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "07" ? "JUL" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "08" ? "AUG" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "09" ? "SEP" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "010" ? "OCT" : snapshot.data!.data?.elementAt(index).date?.split('-').elementAt(1) == "011" ? "NOV" : "DEC"}',
                                                        //                 style:
                                                        //                     TextStyle(
                                                        //                   color:
                                                        //                       Colors.grey,
                                                        //                   fontSize:
                                                        //                       12.sp,
                                                        //                 ),
                                                        //               ),
                                                        //               const Divider(
                                                        //                 thickness:
                                                        //                     1,
                                                        //                 color: Colors
                                                        //                     .grey,
                                                        //               ),
                                                        //               Text(
                                                        //                 '${snapshot.data!.data?.elementAt(index).date?.split('-').last}',
                                                        //                 style:
                                                        //                     const TextStyle(
                                                        //                   color:
                                                        //                       Colors.red,
                                                        //                 ),
                                                        //               ),
                                                        //             ],
                                                        //           ),
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        Image(image: AssetImage('assets/images/calendar2.png'), height: 44, width: 44,),
                                                        SizedBox(width: 12.w),
                                                        Container(
                                                          height: 80.h,
                                                          width: 1.w,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(width: 12.w),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                '${snapshot.data?.data?.elementAt(index).careHome!.name}'),
                                                            SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                child: Text(
                                                                  '${snapshot.data?.data?.elementAt(index).title}',
                                                                  maxLines: 1,
                                                                )),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                                child: Text(
                                                                  'Shift Details: ${snapshot.data?.data?.elementAt(index).timeStart.toString().substring(0,4)} - ${snapshot.data?.data?.elementAt(index).timeEnd.toString().substring(0,4)}',
                                                                  style: TextStyle(
                                                                      color: const Color(
                                                                          0xff687bb9),
                                                                      fontSize: 17.sp),
                                                                ),),
                                                              // child: Text(
                                                              //   '${snapshot.data?.data?.elementAt(index).description}',
                                                              //   maxLines: 3,
                                                              //   overflow:
                                                              //       TextOverflow
                                                              //           .ellipsis,
                                                              //   style:
                                                              //       TextStyle(
                                                              //     color: Colors
                                                              //         .grey,
                                                              //     fontSize:
                                                              //         12.sp,
                                                              //   ),
                                                              // ),
                                                            //   child: Text(
                                                            //       '${snapshot.data?.data?.elementAt(index).}'),,
                                                            // ),
                                                            SizedBox(
                                                                height: 5.h),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .access_time,
                                                                  color: const Color(
                                                                      0xff687bb9),
                                                                  size: 20.sp,
                                                                ),
                                                                SizedBox(
                                                                    width: 5.w),
                                                                Text(
                                                                  '${snapshot.data?.data?.elementAt(index).timeStart}-${snapshot.data?.data?.elementAt(index).timeEnd}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xff687bb9),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              SharedPreferences
                                                                  pref =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              var token = await pref
                                                                  .getString(
                                                                      'token');
                                                              var headers = {
                                                                'Authorization':
                                                                    'Bearer $token'
                                                              };
                                                              var request =
                                                                  http.Request(
                                                                      'PUT',
                                                                      Uri.parse(
                                                                          'https://pixelcare.stackbuffers.com/api/care-home-jobs/update/reject?care_home_job_id=${snapshot.data?.data?.elementAt(index).id}'));

                                                              request.headers
                                                                  .addAll(
                                                                      headers);

                                                              http.StreamedResponse
                                                                  response =
                                                                  await request
                                                                      .send();
                                                              var data =
                                                                  await response
                                                                      .stream
                                                                      .bytesToString();
                                                              setState(() {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(SnackBar(
                                                                        content:
                                                                            Text('${jsonDecode(data)['message']}')));
                                                                snapshot
                                                                    .data?.data
                                                                    ?.removeAt(
                                                                        index);
                                                              });
                                                              if (response
                                                                      .statusCode ==
                                                                  200) {
                                                              } else {
                                                                print(response
                                                                    .reasonPhrase);
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.h,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10.h,
                                                                      bottom:
                                                                          10.h),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.r)),
                                                              child: const Center(
                                                                  child: Text(
                                                                'Reject',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              SharedPreferences
                                                                  pref =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              var token = await pref
                                                                  .getString(
                                                                      'token');
                                                              var headers = {
                                                                'Authorization':
                                                                    'Bearer $token'
                                                              };
                                                              var request =
                                                                  http.Request(
                                                                      'PUT',
                                                                      Uri.parse(
                                                                          'https://pixelcare.stackbuffers.com/api/care-home-jobs/update/accept?care_home_job_id=${snapshot.data?.data?.elementAt(index).id}'));

                                                              request.headers
                                                                  .addAll(
                                                                      headers);

                                                              http.StreamedResponse
                                                                  response =
                                                                  await request
                                                                      .send();
                                                              var data =
                                                                  await response
                                                                      .stream
                                                                      .bytesToString();
                                                              setState(() {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(SnackBar(
                                                                        content:
                                                                            Text('${jsonDecode(data)['message']}')));
                                                                snapshot
                                                                    .data?.data
                                                                    ?.removeAt(
                                                                        index);
                                                              });
                                                              if (response
                                                                      .statusCode ==
                                                                  200) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(MaterialPageRoute(
                                                                        builder:
                                                                            (_) =>
                                                                                Booking1Page()));
                                                              } else {
                                                                print(response
                                                                    .reasonPhrase);
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.h,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10.h,
                                                                      left:
                                                                          10.h,
                                                                      bottom:
                                                                          10.h),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.r)),
                                                              child: const Center(
                                                                  child: Text(
                                                                'Accept',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return const Center(
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          )),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
