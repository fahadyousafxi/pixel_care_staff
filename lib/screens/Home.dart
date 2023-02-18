import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/screens/Booking1.dart';
import 'package:pixel_app/screens/TimeSheet.dart';
import 'package:pixel_app/screens/Vacancy.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../DocumentsUpload/document_upload.dart';
import 'Avaiability.dart';
import 'Booking2.dart';
import 'ReferFriend.dart';
import 'Sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  GlobalKey<ScaffoldState> key = new GlobalKey();
  var color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      endDrawer: SidebarPage(),
      backgroundColor: Colors.blue.shade50.withOpacity(0.4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 844.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/images/splashlogo.svg',
                        height: 60.h,
                        width: 60.w,
                      ),
                      InkWell(
                        onTap: () {
                          key.currentState!.openEndDrawer();
                        },
                        child: Container(
                          child: Icon(
                            Icons.menu,
                            color: Colors.blue,
                            size: 38.sp,
                          ),

                          //  Image.asset(
                          //   'assets/images/newSidebaricon.png',
                          //   height: 60.h,
                          //   width: 60.w,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Image(
                            image:
                                AssetImage('assets/images/upcoming shifts.png'),
                            height: 50.h,
                            width: 50.w,
                          ),
                        ),
                        Text(
                          'Upcoming Shifts',
                          style: TextStyle(
                              color: Color(0xff3B53A4),
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h, left: 20.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TODAY',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Text(
                                        '08-00',
                                        style: TextStyle(
                                          color: Color(0xff3b53a4),
                                        ),
                                      ),
                                      Text(
                                        '------------------------------------------------------',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        '20-00',
                                        style: TextStyle(
                                          color: Color(0xff3b53a4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'TOMMORROW',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Text(
                                        '08-00',
                                        style: TextStyle(
                                          color: Color(0xff3b53a4),
                                        ),
                                      ),
                                      Text(
                                        '------------------------------------------------------',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      ),
                                      Text(
                                        '20-00',
                                        style: TextStyle(
                                          color: Color(0xff3b53a4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Text(
                          'Show All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Booking1Page(ind: 1)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 10)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Image(
                              image: AssetImage('assets/images/unconfirm.jpg'),
                              height: 60.h,
                              width: 60.w,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Unconfirmed Bookings',
                            style: TextStyle(
                                color: Color(0xff3b53a4),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Please Confirm Your bookings',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Text(
                            'Show All',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 20.h),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Stay Informed',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VacancyPage()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 70.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.orange.shade300
                                                    .withOpacity(0.5),
                                                spreadRadius: -2,
                                                offset: Offset(10, 10),
                                                blurRadius: 20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        child: Center(
                                            child: SvgPicture.asset(
                                          'assets/images/vacancies icon.svg',
                                          height: 35.h,
                                          width: 35.w,
                                        ))),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Vacancies',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned(
                              //   top: 0,
                              //   right: 5,
                              //   child: Container(
                              //     height: 30.h,
                              //     width: 30.w,
                              //     decoration: BoxDecoration(
                              //       color: Colors.red,
                              //       shape: BoxShape.circle,
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         '3',
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Booking1Page()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 70.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blue
                                                    .withOpacity(0.5),
                                                spreadRadius: -2,
                                                offset: Offset(10, 10),
                                                blurRadius: 20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                          'assets/images/newbkicon.jpg',
                                          height: 35.h,
                                          width: 35.w,
                                        ))),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Bookings',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned(
                              //   top: 0,
                              //   right: 5,
                              //   child: Container(
                              //     height: 30.h,
                              //     width: 30.w,
                              //     decoration: BoxDecoration(
                              //       color: Colors.red,
                              //       shape: BoxShape.circle,
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         '4',
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AvailabilityView()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue.shade300
                                                .withOpacity(0.5),
                                            spreadRadius: -2,
                                            offset: Offset(10, 10),
                                            blurRadius: 20)
                                      ],
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/availability icon.svg',
                                      height: 35.h,
                                      width: 35.w,
                                    ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Availability',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TimeSheetPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.teal.shade300
                                                .withOpacity(0.5),
                                            spreadRadius: -2,
                                            offset: Offset(10, 10),
                                            blurRadius: 20)
                                      ],
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/timesheet.svg',
                                      height: 35.h,
                                      width: 35.w,
                                    ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Timesheet',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReferFriendPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.pink.shade300
                                                .withOpacity(0.5),
                                            spreadRadius: -2,
                                            offset: Offset(10, 10),
                                            blurRadius: 20)
                                      ],
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'assets/images/ref.png',
                                      height: 35.h,
                                      width: 35.w,
                                    ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Refer a Friend',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          highlightColor: color,
                          splashColor: color,
                          hoverColor: color,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DocumentsUpload()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue
                                                .withOpacity(0.5),
                                            spreadRadius: -2,
                                            offset: Offset(10, 10),
                                            blurRadius: 20)
                                      ],
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/documents icon.svg',
                                      height: 35.h,
                                      width: 35.w,
                                    ))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Documents',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
