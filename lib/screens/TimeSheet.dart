import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/TimesheetController.dart';
import '../Model/TimeSubtractor.dart';
import '../Model/TimesheetModel.dart';

class TimeSheetPage extends StatefulWidget {
  const TimeSheetPage({Key? key}) : super(key: key);

  @override
  State<TimeSheetPage> createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  TimeOfDay starttime = TimeOfDay.now();
  TimeOfDay endtime = TimeOfDay.now();
  TimeOfDay brktime = TimeOfDay.now();
  var dateFormat = DateFormat('h:ma');
  var format = DateFormat("HH:mm");

  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  var brk = 0;
  File? file;

  var totalhours = '';
  Widget MyContainer({
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        height: 60.h,
        width: 700.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 5)
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              text2,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Timesheet',
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
                    //           size: 15.sp,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       SizedBox(width: 5.w),
                    //       Text(
                    //         'Timesheet',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    FutureBuilder<TimesheetModel>(
                        future: TimesheetController().GetAvail(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                MyContainer(
//                              iconData: Icons.check_box_outline_blank,
                                  text1: 'Business Unit',
                                  text2: 'Doha Group',
                                ),
                                MyContainer(
//                              iconData: Icons.check_box_outline_blank,
                                  text1: 'Staff Name',
                                  text2:
                                      '${snapshot.data?.data?.staffName == null ? 'Add availibility first' : snapshot.data?.data?.staffName}',
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.w),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    height: 60.h,
                                    width: 700.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.7),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Job Post',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                '${snapshot.data?.data?.jobPost}',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.keyboard_arrow_down_outlined,
                                              //   color: Colors.grey,
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                MyContainer(
//                              iconData: Icons.check_box_outline_blank,
                                  text1: 'Shift Date',
                                  text2:
                                      '${snapshot.data?.data?.date == null ? 'Add availibility first' : snapshot.data?.data?.date}',
                                ),
                                MyContainer(
//                              iconData: Icons.check_box_outline_blank,
                                  text1: 'Shift Select',
                                  text2:
                                      '${snapshot.data?.data?.shiftTime == null ? 'Add availibility first' : snapshot.data?.data?.shiftTime}',
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.w),
                                  child: InkWell(
                                    onTap: () async {
                                      starttime = (await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ))!;
                                      setState(() {
                                        starttime = starttime;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      height: 60.h,
                                      width: 700.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.7),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Start Time',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                            '${starttime.hour} hrs:${starttime.minute} min',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Icon(
                                            Icons.more_time_outlined,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.w),
                                  child: InkWell(
                                    onTap: () async {
                                      endtime = (await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ))!;
                                      setState(() {
                                        endtime = endtime;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      height: 60.h,
                                      width: 700.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.7),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'End Time',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                              '${endtime.hour} hrs:${endtime.minute} min',
                                              style: TextStyle(
                                                color: Colors.blue,
                                              )),
                                          Icon(
                                            Icons.more_time_outlined,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.w),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    height: 60.h,
                                    width: 700.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.7),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Break Time',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          '${brk} min',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              var duration =
                                                  await showDurationPicker(
                                                      context: context,
                                                      initialTime: Duration(
                                                          seconds: 60));
                                              setState(() {
                                                if (duration!.inMinutes <= 60) {
                                                  brk = duration.inMinutes;
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                    'Cannot Exceed Break Time Over 1 Hour',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )));
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.more_time_outlined,
                                              color: Colors.blue,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                MyContainer(
//                              iconData: Icons.check_box_outline_blank,
                                  text1: 'Total Hours',
                                  text2: '${GetTotalHours()}',
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.w),
                                  child: GestureDetector(
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.image,
                                      );
                                      if (result != null) {
                                        setState(() {
                                          file =
                                              File(result.files.single.path!);
                                        });
                                      } else {
                                        // User canceled the picker
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      height: 60.h,
                                      width: 700.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.7),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Icon(Icons.check_box_outline_blank,
                                              //     color: Colors.grey),
                                              // SizedBox(width: 20,),
                                              Text(
                                                'Last Report',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  '',
                                                  style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                if (file != null)
                                                  Image.file(file!,
                                                      fit: BoxFit.cover),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.camera_alt_outlined,
                                                    color: Colors.grey),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h,
                                      left: 20.w,
                                      right: 20.w,
                                      bottom: 20.h),
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (file == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                          'Please input images',
                                          style: TextStyle(color: Colors.white),
                                        )));
                                      } else {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Container(
                                                child: Center(
                                                    child:
                                                        new CircularProgressIndicator(
                                              color: Color(0xfffaeaea),
                                            )));
                                          },
                                        );

                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //         content: Text(
                                        //   'End Time: ${endtime.hour}:${endtime.minute} \n Start Time :${starttime.hour}:${starttime.minute} \n Break : $brk \n  scheduleid: ${snapshot.data?.data?.shiftId}  total: ${GetTotalHours().replaceAll('hrs', '').replaceAll('min', '')} \n unit: asdf  applicationid:${snapshot.data?.data?.jobPostId}  image: $file',
                                        //   style: TextStyle(color: Colors.white),
                                        // )));

                                        var data = await TimesheetController().save(
                                            image: file,
                                            end:
                                                '${endtime.hour}:${endtime.minute}',
                                            applicationid:
                                                snapshot.data?.data?.jobPostId,
                                            brek: '$brk min',
                                            scheduleid:
                                                snapshot.data?.data?.shiftId,
                                            start:
                                                '${starttime.hour}:${starttime.minute}',
                                            total: GetTotalHours()
                                                .replaceAll('hrs', '')
                                                .replaceAll('min', ''),
                                            unit: 'asdf');

                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                          '$data',
                                          style: TextStyle(color: Colors.white),
                                        )));
                                      }
                                    },
                                    child: Container(
                                      height: 60.h,
                                      width: 600.w,
                                      decoration: BoxDecoration(
                                        color: file != null
                                            ? Colors.pink
                                            : Color(0xfffAEAEA),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                            color: file != null
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.86,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Color(0xfffaeaea),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GetTotalHours() {
    var start;
    var end;
    var newtime;
    start = (starttime.hour * 60) + starttime.minute;
    end = (endtime.hour * 60) + endtime.minute;
    // return MyDateUtils.getTimeDifference(start, end);
    if (start == end) {
      return '${double.parse((((end - start)) / 60).toString()).toInt()} hrs:${(((end - start)) % 60)} min';
    }
    if (start < end) {
      // print('Hours:${double.parse((((end - start)) / 60).toString()).toInt()}');
      // print('Min:${((end - start)) % 60}');
      newtime =
          '${double.parse((((end - start)) / 60).toString()).toInt()} hrs:${(((end - start)) % 60)} min';

      if (brk == 0) {
        return newtime;
      } else if (brk == 60) {
        return '${double.parse((((end - start)) / 60).toString()).toInt() - 1} hrs:${(((end - start)) % 60)} min';
      } else if (brk > 0 && brk < 60) {
        if (((end - start) % 60) <= brk) {
          var rem = brk - (((end - start)) % 60);
          print("Remaining$rem");

          var nth = (((end - start)) * 60) - rem;
          var hrs = double.parse((nth / 60).toString()).toInt();
          print("New Time Hours ${hrs}");
          var ntm = nth % 60;
          print("New Time Minutes ${ntm}");

          return '${double.parse((((end - start)) / 60).toString()).toInt() - 1} hrs:${ntm} min';
          // return '${double.parse((((end - start)) / 60).toString()).toInt()} hrs:${(brk - ((end - start)) % 60)} min';
        } else if (((end - start) % 60) > brk) {
          return '${double.parse((((end - start)) / 60).toString()).toInt()} hrs:${(((end - start)) % 60) - brk} min';
        }
      }
      //return MyDateUtils.getTimeDifference(newtime, brk.toString());

      // if (brk <= ((end - start)) % 60) {
      //   return '${double.parse((((end - start)) / 60).toString()).toInt()} hrs:${(((end - start)) % 60) - brk} min';
      // } else {
      //   if ((end - start) / 60 < (brk / 60)) {
      //     newtime = (brk / 60) - ((((end - start) / 60)).toInt()) * 60;
      //     return '$newtime hrs:${((end - start)) % 60} min';
      //   } else {
      //     newtime = (((end - start) / 60)).toInt() - (brk / 60) * 60;
      //     if (newtime < 0) {
      //       newtime = -1 * (newtime);
      //     }

      //     if (((end - start)) % 60 == 0) {
      //       return '$newtime min';
      //     }
      //     return '$newtime hrs:${((end - start)) % 60} min';
      //   }
      // }

      // //return '${double.parse((((end - start) - brk) / 60).toString()).ceil()} hrs:${((end - start) - brk) % 60} min';
    } else {
      newtime =
          '${double.parse(((((start - end))) / 60).toString()).toInt()} hrs:${(((start - end)) % 60)} min';
      if (brk == 0) {
        return newtime;
      } else if (brk == 60) {
        return '${double.parse((((start - end)) / 60).toString()).toInt() - 1} hrs:${(((start - end)) % 60)} min';
      } else if (brk > 0 && brk < 60) {
        if (((start - end) % 60) <= brk) {
          var rem = brk - (((start - end)) % 60);
          print("Remaining$rem");

          var nth = (((start - end)) * 60) - rem;
          var hrs = double.parse((nth / 60).toString()).toInt();
          print("New Time Hours ${hrs}");
          var ntm = nth % 60;
          print("New Time Minutes ${ntm}");

          return '${double.parse((((start - end)) / 60).toString()).toInt() - 1} hrs:${ntm} min';
        } else if (((start - end) % 60) > brk) {
          return '${double.parse((((start - end)) / 60).toString()).toInt()} hrs:${(((start - end)) % 60) - brk} min';
        }
      }

      // return MyDateUtils.getTimeDifference(newtime, brk.toString());

      // if (brk <= ((start - end)) % 60) {
      //   return '${double.parse(((((start - end)) - brk) / 60).toString()).toInt()} hrs:${(((start - end)) % 60)} min';
      // }
      //  else {
      //   if ((start - end) / 60 < (brk / 60)) {
      //     newtime = (brk / 60) - ((((start - end) / 60)).toInt()) * 60;
      //     if (newtime < 0) {
      //       newtime = -1 * (newtime);
      //     }

      //     if (((end - start)) % 60 == 0) {
      //       return '$newtime min';
      //     }
      //     return '$newtime hrs:${((start - end)) % 60} min';
      //   } else {
      //     newtime = ((((start - end) / 60)).toInt()) - (brk / 60) * 60;
      //     if (newtime < 0) {
      //       newtime = -1 * (newtime);
      //     }

      //     if (((end - start)) % 60 == 0) {
      //       return '$newtime min';
      //     }
      //     return '$newtime hrs:${((start - end)) % 60} min';
      //   }
      // }
    }
  }
}

/*
DropdownButton(
                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
/*

 */
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

 */
