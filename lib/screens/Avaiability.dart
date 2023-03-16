// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:pixel_app/Model/AvailabilityModel.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pixel_app/Controller/AvailabilityController.dart';
//
// class AvailabilityView extends StatefulWidget {
//   const AvailabilityView({Key? key}) : super(key: key);
//
//   @override
//   State<AvailabilityView> createState() => _AvailabilityViewState();
// }
//
// class _AvailabilityViewState extends State<AvailabilityView> {
//   var focused = DateTime.now();
//   var _selectedDay = DateTime.now();
//   var _focusedDay = DateTime.now();
//   var selected = 1;
//   var enable = false;
//   final f = new DateFormat('yyyy-MM-dd');
//   GlobalKey<ScaffoldState> key = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: key,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 30.h, left: 10.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_ios_outlined,
//                       size: 15.sp,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(width: 5.w),
//                   Text(
//                     'Availability',
//                     style:
//                     TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 5.w),
//             StreamBuilder<AvailbilityModel?>(
//                 stream: AvailabilityController()
//                     .GetAvail(
//                     month: _selectedDay.month, year: _selectedDay.year)
//                     .asStream(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     Data data = new Data(
//                         date: _selectedDay.year.toString() +
//                             "-" +
//                             _selectedDay.month.toString() +
//                             "-" +
//                             _selectedDay.day.toString(),
//                         scheduleList: selected.toString(), );
//                     var contain = false;
//                     var focus = 10;
//                     snapshot.data!.data.forEach((element) {
//                       print(element.scheduleList);
//                       if (element.date == data.date) {
//                         contain = true;
//                         focus = int.parse(element.scheduleList.toString());
//                       }
//                     });
//                     return Container(
//                       height: MediaQuery.of(context).size.height * 0.86,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.shade400.withOpacity(0.7),
//                               spreadRadius: 1,
//                               blurRadius: 5)
//                         ],
//                       ),
//                       padding: EdgeInsets.all(10.h),
//                       margin: EdgeInsets.all(10.w),
//                       child: Column(
//                         children: [
//                           TableCalendar(
//                             headerStyle:
//                             HeaderStyle(formatButtonVisible: false),
//                             firstDay: DateTime.utc(2010, 10, 16),
//                             rowHeight: 50.h,
//                             calendarStyle: CalendarStyle(
//                               selectedDecoration: BoxDecoration(
//                                   color: focus == 2
//                                       ? Colors.blue.shade300
//                                       : focus == 1
//                                       ? Colors.pink.shade300
//                                       : Colors.grey),
//                             ),
//                             selectedDayPredicate: (date) {
//                               if (date == _focusedDay) {
//                                 return true;
//                               } else {
//                                 return false;
//                               }
//                             },
//                             onPageChanged: (val) {
//                               setState(() {
//                                 if (DateTime.now().month == val.month) {
//                                   _selectedDay = DateTime(
//                                       val.year, val.month, DateTime.now().day);
//                                   _focusedDay = DateTime(
//                                       val.year, val.month, DateTime.now().day);
//                                 } else {
//                                   _selectedDay =
//                                       DateTime(val.year, val.month, 1);
//                                   _focusedDay =
//                                       DateTime(val.year, val.month, 1);
//                                 }
//                               });
//                             },
//                             calendarBuilders: CalendarBuilders(
//                                 markerBuilder: (context, date, list) {
//                                   var cool = 0;
//                                   Data data = new Data(
//                                       date: date.year.toString() +
//                                           "-${date.month.toString().length == 1 ? "0" + date.month.toString() : date.month.toString()}-${date.day.toString().length == 1 ? "0" + date.day.toString() : date.day.toString()}",
//                                       scheduleList: "2",);
//                                   snapshot.data!.data.forEach((element) {
//                                     // && int.parse(element.date.toString().split("-").first)>=DateTime.now().year&& int.parse(element.date.toString().split("-").elementAt(1))>=DateTime.now().month&& int.parse(element.date.toString().split("-").last)>=DateTime.now().day
//                                     //print(DateFormat("yyyy-MM-dd")
//                                     // .parse(element.date!));
//                                     //  print(DateTime(DateTime.now().year,
//                                     //   DateTime.now().month, DateTime.now().day));
//                                     if (data.date == element.date &&
//                                         (DateFormat("yyyy-MM-dd")
//                                             .parse(element.date!)
//                                             .isAfter(DateTime.now()) ||
//                                             DateFormat("yyyy-MM-dd")
//                                                 .parse(element.date!)
//                                                 .isAtSameMomentAs(DateTime(
//                                                 DateTime.now().year,
//                                                 DateTime.now().month,
//                                                 DateTime.now().day)))) {
//                                       if (element.scheduleList == "1") {
//                                         cool = 1;
//                                       } else {
//                                         cool = 2;
//                                       }
//                                     }
//                                   });
//                                   return cool == 0
//                                       ? Container()
//                                       : cool == 2
//                                       ? Container(
//                                     height: 45.h,
//                                     width: 45.w,
//                                     color: Colors.blue.withOpacity(0.5),
//                                   )
//                                       : Container(
//                                     height: 45.h,
//                                     width: 45.w,
//                                     color: Colors.pink.shade100
//                                         .withOpacity(0.5),
//                                   );
//                                 }),
//                             lastDay: DateTime.utc(2030, 3, 14),
//                             focusedDay: _focusedDay,
//                             currentDay: _selectedDay,
//                             onDaySelected: (selectedDay, focusedDay) {
//                               print('yes');
//                               setState(() {
//                                 _selectedDay = selectedDay;
//                                 _focusedDay =
//                                     focusedDay; // update `_focusedDay` here as well
//                               });
//                             },
//                           ),
//                           Visibility(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Schedule List',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 17.sp),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10.h,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       selected = 1;
//                                     });
//                                   },
//                                   child: Container(
//                                       height: 70.h,
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xfffaeaea),
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: selected == 1
//                                             ? Border.all(color: Colors.pink)
//                                             : Border.all(
//                                             color: Colors.transparent),
//                                       ),
//                                       padding: EdgeInsets.all(10.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.sunny,
//                                                 color: Colors.yellow.shade600,
//                                                 size: 50.h,
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 'Day',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 17.sp,
//                                                     color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           focus == 1
//                                               ? Text(
//                                             'Already Selected',
//                                             style: TextStyle(
//                                                 fontWeight:
//                                                 FontWeight.w400,
//                                                 fontSize: 14.sp,
//                                                 color: Colors.grey),
//                                           )
//                                               : Text(''),
//                                         ],
//                                       )),
//                                 ),
//                                 SizedBox(
//                                   height: 10.h,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       selected = 2;
//                                     });
//                                   },
//                                   child: Container(
//                                       height: 70.h,
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue.shade100,
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: selected == 2
//                                             ? Border.all(
//                                           color: Colors.blue.shade500,
//                                         )
//                                             : Border.all(
//                                             color: Colors.transparent),
//                                       ),
//                                       padding: EdgeInsets.all(10.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Icon(
//                                                 FontAwesomeIcons.moon,
//                                                 color: Colors.blue,
//                                                 size: 50.h,
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 'Night',
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 17.sp,
//                                                     color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           focus == 2
//                                               ? Text(
//                                             'Already Selected',
//                                             style: TextStyle(
//                                                 fontWeight:
//                                                 FontWeight.w400,
//                                                 fontSize: 14.sp,
//                                                 color: Colors.grey),
//                                           )
//                                               : Text(''),
//                                         ],
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Spacer(),
//                           InkWell(
//                             onTap: () async {
//                               setState(() {
//                                 enable = true;
//                               });
//                               var data = await AvailabilityController()
//                                   .SaveAvail(
//                                   time: selected,
//                                   cond: contain ? false : true,
//                                   date: _selectedDay.year.toString() +
//                                       "-" +
//                                       _selectedDay.month.toString() +
//                                       "-" +
//                                       _selectedDay.day.toString());
//                               setState(() {
//                                 enable = false;
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('$data')));
//                               });
//                             },
//                             child: Container(
//                               height: 50.h,
//                               width: 350.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfffaeaea),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Center(
//                                 child: enable
//                                     ? Container(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.grey,
//                                     ))
//                                     : Text(
//                                   contain ? 'Edit' : 'Save',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.grey.shade500),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   } else {
//                     return Container(
//                       height: MediaQuery.of(context).size.height * 0.86,
//                       width: MediaQuery.of(context).size.width,
//                       child: Center(
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           child: CircularProgressIndicator(
//                             color: Color(0xfffaeaea),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

/// my

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Controller/AvailabilityController.dart';
import 'package:pixel_app/Model/AvailabilityModel.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailabilityView extends StatefulWidget {
  const AvailabilityView({Key? key}) : super(key: key);

  @override
  State<AvailabilityView> createState() => _AvailabilityViewState();
}

class _AvailabilityViewState extends State<AvailabilityView> {
  var dateId = 32;

  int selectedDateId = 0;

  var focused = DateTime.now();
  var _selectedDay = DateTime.now();
  var _focusedDay = DateTime.now();
  var selected = 1;
  var enable = false;
  final f = DateFormat('yyyy-MM-dd');
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Availability',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.w),
              StreamBuilder<AvailbilityModel?>(
                  stream: AvailabilityController()
                      .GetAvail(
                          month: _selectedDay.month, year: _selectedDay.year)
                      .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Data data = Data(
                          date:
                              "${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}",
                          scheduleList: selected.toString(),
                          id: DateTime.now().microsecondsSinceEpoch);
                      var contain = false;

                      var focus = 10;

                      // hint
                      for (var element in snapshot.data!.data) {
                        // print(element.scheduleList);
                        if (element.date == data.date) {
                          contain = true;
                          // setState(() {});

                          dateId = int.parse(element.date
                              .toString()
                              .split('')
                              .toList()
                              .elementAt(0)
                              .toString());
                          focus = int.parse(element.scheduleList.toString());
                        }
                      }

                      return Container(
                        height: MediaQuery.of(context).size.height * 0.86,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        padding: EdgeInsets.all(10.h),
                        margin: EdgeInsets.all(10.w),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TableCalendar(
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                headerStyle: const HeaderStyle(
                                    formatButtonVisible: false),
                                firstDay: DateTime.utc(2010, 10, 16),
                                rowHeight: 50.h,
                                calendarStyle: CalendarStyle(
                                  selectedDecoration: BoxDecoration(
                                      color: focus == 2
                                          ? Colors.blue.shade300
                                          : focus == 1
                                              ? Colors.pink.shade300
                                              : Colors.grey),
                                ),
                                selectedDayPredicate: (date) {
                                  if (date == _focusedDay) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                                onPageChanged: (val) {
                                  setState(() {
                                    if (DateTime.now().month == val.month) {
                                      _selectedDay = DateTime(val.year,
                                          val.month, DateTime.now().day);
                                      _focusedDay = DateTime(val.year,
                                          val.month, DateTime.now().day);
                                    } else {
                                      _selectedDay =
                                          DateTime(val.year, val.month, 1);
                                      _focusedDay =
                                          DateTime(val.year, val.month, 1);
                                    }
                                  });
                                },
                                calendarBuilders: CalendarBuilders(
                                    markerBuilder: (context, date, list) {
                                  var cool = 0;

                                  // data

                                  Data data = Data(
                                      date:
                                          "${date.year}-${date.month.toString().length == 1 ? "0${date.month}" : date.month.toString()}-${date.day.toString().length == 1 ? "0${date.day}" : date.day.toString()}",
                                      scheduleList: "2",
                                      id: DateTime.now()
                                          .microsecondsSinceEpoch);
                                  for (var element in snapshot.data!.data) {
                                    // && int.parse(element.date.toString().split("-").first)>=DateTime.now().year&& int.parse(element.date.toString().split("-").elementAt(1))>=DateTime.now().month&& int.parse(element.date.toString().split("-").last)>=DateTime.now().day
                                    //print(DateFormat("yyyy-MM-dd")
                                    // .parse(element.date!));
                                    //  print(DateTime(DateTime.now().year,
                                    //   DateTime.now().month, DateTime.now().day));
                                    if (data.date == element.date &&
                                        (DateFormat("yyyy-MM-dd")
                                                .parse(element.date!)
                                                .isAfter(DateTime.now()) ||
                                            DateFormat("yyyy-MM-dd")
                                                .parse(element.date!)
                                                .isAtSameMomentAs(DateTime(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day)))) {
                                      if (element.scheduleList == "1") {
                                        cool = 1;
                                      } else {
                                        cool = 2;
                                      }
                                    }
                                  }
                                  return cool == 0
                                      ? Container()
                                      : cool == 2
                                          ? Container(
                                              height: 45.h,
                                              width: 45.w,
                                              color:
                                                  Colors.blue.withOpacity(0.5),
                                            )
                                          : Container(
                                              height: 45.h,
                                              width: 45.w,
                                              color: Colors.pink.shade100
                                                  .withOpacity(0.5),
                                            );
                                }),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: _focusedDay,
                                currentDay: _selectedDay,
                                onDaySelected: (selectedDay, focusedDay) {
                                  // yes selectedDay

                                  // print('yes $selectedDay asdfsdf');
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay =
                                        focusedDay; // update `_focusedDay` here as well
                                  });

                                  String selectedDate =
                                      selectedDay.toString().substring(0, 10);

                                  for (var element in snapshot.data!.data) {
                                    setState(() {});
                                    if (element.date.toString() ==
                                        selectedDate) {
                                      // print("dddddddddddddddssssssssss   $selectedDate");

                                      selectedDateId = element.id!;
                                      // print("dddddddddddddddssssssssssdddddddddddddddssssssssss   $selectedDateId");
                                    }

                                    // print("asdfsdfsadfasdfsadfasdf ${element.date}  asdfsdfsadfasdfsadfasdf");
                                    // dateId = int.parse(element.id.toString());
                                    // print("$dateId  asdfasdfasdfdsf asdfsdfsdf");
                                  }
                                },
                              ),
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Schedule List',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = 1;
                                        });
                                      },
                                      child: Container(
                                          height: 70.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xfffaeaea),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: selected == 1
                                                ? Border.all(color: Colors.pink)
                                                : Border.all(
                                                    color: Colors.transparent),
                                          ),
                                          padding: EdgeInsets.all(10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.sunny,
                                                    color:
                                                        Colors.yellow.shade600,
                                                    size: 50.h,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Day',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 17.sp,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              focus == 1
                                                  ? Text(
                                                      'Already Selected',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14.sp,
                                                          color: Colors.grey),
                                                    )
                                                  : const Text(''),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = 2;
                                        });
                                      },
                                      child: Container(
                                          height: 70.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade100,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: selected == 2
                                                ? Border.all(
                                                    color: Colors.blue.shade500,
                                                  )
                                                : Border.all(
                                                    color: Colors.transparent),
                                          ),
                                          padding: EdgeInsets.all(10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.moon,
                                                    color: Colors.blue,
                                                    size: 50.h,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Night',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 17.sp,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              focus == 2
                                                  ? Text(
                                                      'Already Selected',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14.sp,
                                                          color: Colors.grey),
                                                    )
                                                  : const Text(''),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    enable = true;
                                  });
                                  var data = await AvailabilityController()
                                      .SaveAvail(
                                          time: selected,
                                          cond: contain ? false : true,
                                          date:
                                              "${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}");
                                  setState(() {
                                    enable = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('$data'),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: enable
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.grey,
                                            ))
                                        : Text(
                                            contain ? 'Edit' : 'Save',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  // code of deleting
                                  var response = await AvailabilityController()
                                      .DeleteAvail(selectedDateId);
                                  // snapshot.data?.data.elementAt(index).id

                                  setState(() {});
                                  // print("ffffffffffff $selectedDateId  asdfasdfasdfdsf asdfsdfsdf");

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "Successfully Deleted",
                                    style: TextStyle(color: Colors.white),
                                  )));
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),

                                    // child: enable
                                    //     ? Container(
                                    //     height: 20,
                                    //     width: 20,
                                    //     child: CircularProgressIndicator(
                                    //       color: Colors.grey,
                                    //     ))
                                    //     : Text(
                                    //   contain ? 'Edit' : 'Save',
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.w500,
                                    //       color: Colors.white),
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.86,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Color(0xfffaeaea),
                            ),
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

/// old code
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:pixel_app/Model/AvailabilityModel.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pixel_app/Controller/AvailabilityController.dart';
//
// import '../Constants/Calendarclass.dart';
//
// class AvailabilityView extends StatefulWidget {
//   const AvailabilityView({Key? key}) : super(key: key);
//
//   @override
//   State<AvailabilityView> createState() => _AvailabilityViewState();
// }
//
// class _AvailabilityViewState extends State<AvailabilityView> {
//   var focused = DateTime.now();
//   var _selectedDay = DateTime.now();
//   // var _focusedDay = DateTime.now();
//   var selected = 1;
//   int x = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     x = 0;
//     super.initState();
//   }
//
//   var enable = false;
//   var start = DateTime.now();
//   var end = DateTime.now();
//   final f = new DateFormat('yyyy-MM-dd');
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOn; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   // DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   GlobalKey<ScaffoldState> key = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: key,
//       appBar: AppBar(
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
//         backgroundColor: Colors.grey.shade100,
//         elevation: 0,
//         title: Text(
//           'Availability',
//           style: TextStyle(
//               fontSize: 18.sp,
//               color: Colors.black,
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SafeArea(
//
//         child: SingleChildScrollView(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Container(
//                 //   margin: EdgeInsets.only(top: 30.h, left: 10.w),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.start,
//                 //     children: [
//                 //       InkWell(
//                 //         onTap: () {
//                 //           Navigator.pop(context);
//                 //         },
//                 //         child: Icon(
//                 //           Icons.arrow_back_ios_outlined,
//                 //           size: 15.sp,
//                 //           color: Colors.grey,
//                 //         ),
//                 //       ),
//                 //       SizedBox(width: 5.w),
//                 //       Text(
//                 //         'Availability',
//                 //         style:
//                 //             TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(width: 5.w),
//
//                 StreamBuilder<AvailbilityModel?>(
//                     stream: AvailabilityController()
//                         .GetAvail(
//                             month: _selectedDay.month, year: _selectedDay.year)
//                         .asStream(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         Data data = new Data(
//                             date: _selectedDay.year.toString() +
//                                 "-" +
//                                 _selectedDay.month.toString() +
//                                 "-" +
//                                 _selectedDay.day.toString(),
//                             scheduleList: selected.toString());
//                         var contain = false;
//
//                         var focus = 10;
//
//                         snapshot.data!.data.forEach((element) {
//                           print(element.scheduleList);
//
//                           DateTime date = DateTime.parse(element.date!.toString());
//                           String outputString =
//                               DateFormat('yyyy-M-dd').format(date);
//                           if (x == 0) {
//                             _rangeStart = date;
//                           }
//                           x++;
//                           _rangeEnd = date;
//                           if (outputString == data.date!.trim().toString()) {
//                             contain = true;
//
//                             focus = int.parse(element.scheduleList.toString());
//                           }
//                         });
//                         return Container(
//                           height: MediaQuery.of(context).size.height * 0.86,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade400.withOpacity(0.7),
//                                   spreadRadius: 1,
//                                   blurRadius: 5)
//                             ],
//                           ),
//                           padding: EdgeInsets.all(10.h),
//                           margin: EdgeInsets.all(10.w),
//                           child: Column(
//                             children: [
//                               /// TableCalendar
//                               // TableCalendar(
//                               //   firstDay: kFirstDay,
//                               //   lastDay: kLastDay,
//                               //   focusedDay: _focusedDay,
//                               //   weekNumbersVisible: false,
//                               //   startingDayOfWeek: StartingDayOfWeek.monday,
//                               //   headerStyle:
//                               //       const HeaderStyle(formatButtonVisible: false),
//                               //   calendarStyle: CalendarStyle(
//                               //     rangeHighlightColor: selected == 2
//                               //         ? Colors.blue.shade100
//                               //         : selected == 1
//                               //             ? Color(0xfffaeaea)
//                               //             : Colors.blue.shade100,
//                               //     selectedDecoration: BoxDecoration(
//                               //         color: focus == 2
//                               //             ? Colors.blue.shade100
//                               //             : focus == 1
//                               //                 ? Color(0xfffaeaea)
//                               //                 : Colors.blue.shade100),
//                               //   ),
//                               //   selectedDayPredicate: (day) =>
//                               //       isSameDay(_selectedDay, day),
//                               //   rangeStartDay: _rangeStart,
//                               //   rangeEndDay: _rangeEnd,
//                               //   calendarFormat: _calendarFormat,
//                               //   rangeSelectionMode: _rangeSelectionMode,
//                               //   onDaySelected: (selectedDay, focusedDay) {
//                               //     if (!isSameDay(_selectedDay, selectedDay)) {
//                               //       setState(() {
//                               //         _selectedDay = selectedDay;
//                               //         _focusedDay = focusedDay;
//                               //         _rangeStart =
//                               //             null; // Important to clean those
//                               //         _rangeEnd = null;
//                               //         _rangeSelectionMode =
//                               //             RangeSelectionMode.toggledOff;
//                               //       });
//                               //     }
//                               //   },
//                               //   onRangeSelected: (start, end, focusedDay) {
//                               //     setState(() {
//                               //       _focusedDay = focusedDay;
//                               //       _rangeStart = start;
//                               //       _rangeEnd = end;
//                               //       _rangeSelectionMode =
//                               //           RangeSelectionMode.toggledOn;
//                               //     });
//                               //   },
//                               //   onFormatChanged: (format) {
//                               //     if (_calendarFormat != format) {
//                               //       setState(() {
//                               //         _calendarFormat = format;
//                               //       });
//                               //     }
//                               //   },
//                               //   onPageChanged: (focusedDay) {
//                               //     _focusedDay = focusedDay;
//                               //   },
//                               // ),
//                               TableCalendar(
//                                 startingDayOfWeek: StartingDayOfWeek.monday,
//                                 rangeStartDay: start,
//                                 rangeEndDay: end,
//                                 firstDay: DateTime.utc(2010, 10, 16),
//                                 rowHeight: 50.h,
//                                 calendarStyle: CalendarStyle(
//                                   selectedDecoration: BoxDecoration(
//                                       color: focused == 2
//                                           ? Colors.blue.shade300
//                                           : focused == 1
//                                               ? Colors.pink.shade300
//                                               : Colors.grey),
//                                 ),
//                                 selectedDayPredicate: (date) {
//                                   if (date == _focusedDay) {
//                                     return true;
//                                   } else {
//                                     return false;
//                                   }
//                                 },
//                                 lastDay: DateTime.utc(2030, 3, 14),
//                                 focusedDay: _focusedDay,
//                                 currentDay: _selectedDay,
//                                 weekNumbersVisible: false,
//                                 headerStyle:
//                                     const HeaderStyle(formatButtonVisible: false),
//                                 rangeSelectionMode: RangeSelectionMode.toggledOn,
//                                 onRangeSelected: (first, second, third) {
//                                   setState(() {
//                                     start = first!;
//                                     end = third;
//                                     print(first);
//                                     print(third);
//                                   });
//                                 },
//                                 onDaySelected: (selectedDay, focusedDay) {
//                                   print('yes');
//                                   setState(() {
//                                     _selectedDay = selectedDay;
//                                     _focusedDay =
//                                         focusedDay; // update `_focusedDay` here as well
//                                   });
//                                 },
//                                 // rangeStartDay: start,
//                                 // rangeEndDay: end,
//                                 // headerStyle:
//                                 //     HeaderStyle(formatButtonVisible: false),
//                                 // firstDay: DateTime.utc(2010, 10, 16),
//                                 // rowHeight: 50.h,
//                                 // calendarStyle: CalendarStyle(
//                                 //   selectedDecoration: BoxDecoration(
//                                 //       color: focus == 2
//                                 //           ? Colors.blue.shade300
//                                 //           : focus == 1
//                                 //               ? Colors.pink.shade300
//                                 //               : Colors.grey),
//                                 // ),
//                                 //...... selectedDayPredicate: (date) {
//                                 //   if (date == _focusedDay) {
//                                 //     return true;
//                                 //   } else {
//                                 //     return false;
//                                 //   }
//                                 // },
//
//                                 // onPageChanged: (val) {
//                                 //   setState(() {
//                                 //     if (DateTime.now().month == val.month) {
//                                 //       _selectedDay = DateTime(
//                                 //           val.year, val.month, DateTime.now().day);
//                                 //       _focusedDay = DateTime(
//                                 //           val.year, val.month, DateTime.now().day);
//                                 //     } else {
//                                 //       _selectedDay =
//                                 //           DateTime(val.year, val.month, 1);
//                                 //       _focusedDay =
//                                 //           DateTime(val.year, val.month, 1);
//                                 //     }
//                                 //   });
//                                 // },
//                                 // calendarBuilders: CalendarBuilders(
//                                 //     markerBuilder: (context, date, list) {
//                                 //   var cool = 0;
//                                 //   Data data = new Data(
//                                 //       date: date.year.toString() +
//                                 //           "-${date.month.toString().length == 1 ? "0" + date.month.toString() : date.month.toString()}-${date.day.toString().length == 1 ? "0" + date.day.toString() : date.day.toString()}",
//                                 //       scheduleList: "2");
//                                 //   snapshot.data!.data.forEach((element) {
//                                 //     // && int.parse(element.date.toString().split("-").first)>=DateTime.now().year&& int.parse(element.date.toString().split("-").elementAt(1))>=DateTime.now().month&& int.parse(element.date.toString().split("-").last)>=DateTime.now().day
//                                 //     //print(DateFormat("yyyy-MM-dd")
//                                 //     // .parse(element.date!));
//                                 //     //  print(DateTime(DateTime.now().year,
//                                 //     //   DateTime.now().month, DateTime.now().day));
//                                 //     if (data.date == element.date &&
//                                 //         (DateFormat("yyyy-MM-dd")
//                                 //                 .parse(element.date!)
//                                 //                 .isAfter(DateTime.now()) ||
//                                 //             DateFormat("yyyy-MM-dd")
//                                 //                 .parse(element.date!)
//                                 //                 .isAtSameMomentAs(DateTime(
//                                 //                     DateTime.now().year,
//                                 //                     DateTime.now().month,
//                                 //                     DateTime.now().day)))) {
//                                 //       if (element.scheduleList == "1") {
//                                 //         cool = 1;
//                                 //       } else {
//                                 //         cool = 2;
//                                 //       }
//                                 //     }
//                                 //   });
//                                 //   return cool == 0
//                                 //       ? Container()
//                                 //       : cool == 2
//                                 //           ? Container(
//                                 //               height: 45.h,
//                                 //               width: 45.w,
//                                 //               color: Colors.blue.withOpacity(0.5),
//                                 //             )
//                                 //           : Container(
//                                 //               height: 45.h,
//                                 //               width: 45.w,
//                                 //               color: Colors.pink.shade100
//                                 //                   .withOpacity(0.5),
//                                 //             );
//                                 // }),
//
//                                 // lastDay: DateTime.utc(2030, 3, 14),
//                                 // focusedDay: _focusedDay,
//                                 // currentDay: _selectedDay,
//                                 // onRangeSelected: (first, second, third) {
//                                 //   setState(() {
//                                 //     start = first!;
//                                 //     end = third;
//                                 //     print(first);
//                                 //     print(third);
//                                 //   });
//                                 // },
//                                 // onDaySelected: (selectedDay, focusedDay) {
//                                 //   print('yes');
//                                 //   setState(() {
//                                 //     _selectedDay = selectedDay;
//                                 //     _focusedDay =
//                                 //         focusedDay; // update `_focusedDay` here as well
//                                 //   });
//                                 // },
//                               ),
//
//                               Visibility(
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Select Shift',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 17.sp),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           selected = 1;
//                                         });
//                                       },
//                                       child: Container(
//                                           height: 70.h,
//                                           width: MediaQuery.of(context).size.width,
//                                           decoration: BoxDecoration(
//                                             color: Color(0xfffaeaea),
//                                             borderRadius: BorderRadius.circular(10),
//                                             border: selected == 1
//                                                 ? Border.all(color: Colors.pink)
//                                                 : Border.all(
//                                                     color: Colors.transparent),
//                                           ),
//                                           padding: EdgeInsets.all(10.h),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.sunny,
//                                                     color: Colors.yellow.shade600,
//                                                     size: 50.h,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     'Day',
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.w600,
//                                                         fontSize: 17.sp,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ],
//                                               ),
//                                               focus == 1
//                                                   ? Text(
//                                                       'Already Selected',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontSize: 14.sp,
//                                                           color: Colors.grey),
//                                                     )
//                                                   : Text(''),
//                                             ],
//                                           )),
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           selected = 2;
//                                         });
//                                       },
//                                       child: Container(
//                                           height: 70.h,
//                                           width: MediaQuery.of(context).size.width,
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue.shade100,
//                                             borderRadius: BorderRadius.circular(10),
//                                             border: selected == 2
//                                                 ? Border.all(
//                                                     color: Colors.blue.shade500,
//                                                   )
//                                                 : Border.all(
//                                                     color: Colors.transparent),
//                                           ),
//                                           padding: EdgeInsets.all(10.h),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     FontAwesomeIcons.moon,
//                                                     color: Colors.blue,
//                                                     size: 50.h,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     'Night',
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.w600,
//                                                         fontSize: 17.sp,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ],
//                                               ),
//                                               focus == 2
//                                                   ? Text(
//                                                       'Already Selected',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontSize: 14.sp,
//                                                           color: Colors.grey),
//                                                     )
//                                                   : Text(''),
//                                             ],
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 40,),
//                               // Spacer(),
//                               InkWell(
//                                 onTap: () async {
//                                   setState(() {
//                                     enable = true;
//                                   });
//                                   var data = await AvailabilityController()
//                                       .SaveAvail(
//                                           time: selected,
//                                           cond: contain ? false : true,
//                                           date: _selectedDay.year.toString() +
//                                               "-" +
//                                               _selectedDay.month.toString() +
//                                               "-" +
//                                               _selectedDay.day.toString());
//                                   setState(() {
//                                     enable = false;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(content: Text('$data')));
//                                   });
//                                 },
//                                 child: Container(
//                                   height: 50.h,
//                                   width: 350.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.pink,
//                                     // _rangeStart != null && _rangeEnd != null
//                                     //     ? Colors.pink
//                                     //     : Color(0xfffaeaea),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   child: Center(
//                                     child: enable
//                                         ? Container(
//                                             height: 20,
//                                             width: 20,
//                                             child: CircularProgressIndicator(
//                                               color: Colors.grey,
//                                             ))
//                                         : Text(
//                                       // changes in edit save
//                                             contain ? 'Save' : 'Save',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white
//                                                 // _rangeStart != null &&
//                                                 //         _rangeEnd != null
//                                                 //     ? Colors.white
//                                                 //     : Colors.black
//                                                 ),
//                                           ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       } else {
//                         return Container(
//                           height: MediaQuery.of(context).size.height * 0.86,
//                           width: MediaQuery.of(context).size.width,
//                           child: Center(
//                             child: Container(
//                               height: 30,
//                               width: 30,
//                               child: CircularProgressIndicator(
//                                 color: Color(0xfffaeaea),
//                               ),
//                             ),
//                           ),
//                         );
//                       }
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
