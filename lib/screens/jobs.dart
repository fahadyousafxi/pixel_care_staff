import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,


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
                              size: 20.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Jobs',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Container(
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
                                    color: index==0?Color(0xfffaeaea):Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Confirmed',
                                      style: TextStyle(
                                          color: Colors.black87,
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
                                    color: index==1?Color(0xfffaeaea):Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Unconfirmed',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
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
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h),
                              height: 90.h,
                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 40.sp,
                                        color: Color(0xff687bb9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Cardinal Heenan House'),
                                      Text(
                                        'Nurse',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                      Text(
                                        'Mar 01',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  // SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.redAccent.shade100,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 25.h),
                                      Text(
                                        '10:00 - 01:00',
                                        style: TextStyle(
                                            color: Color(0xff687bb9),
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h),
                              height: 90.h,
                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 40.sp,
                                        color: Color(0xff687bb9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Cardinal Heenan House'),
                                      Text(
                                        'Nurse',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                      Text(
                                        'Mar 01',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  // SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.redAccent.shade100,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 25.h),
                                      Text(
                                        '10:00 - 01:00',
                                        style: TextStyle(
                                            color: Color(0xff687bb9),
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h),
                              height: 90.h,
                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 40.sp,
                                        color: Color(0xff687bb9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Cardinal Heenan House'),
                                      Text(
                                        'Nurse',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                      Text(
                                        'Mar 01',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  // SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.redAccent.shade100,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 25.h),
                                      Text(
                                        '10:00 - 01:00',
                                        style: TextStyle(
                                            color: Color(0xff687bb9),
                                            fontSize: 17.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: index == 1,
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(

                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w, top: 10.h),                                    child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 20.w),
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 60.h,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue, width: 2),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'APR',
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
                                                      '18',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 12.w),
                                      Container(
                                        height: 80.h,
                                        width: 1.w,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Cardinal Heenan House'),
                                          Text(
                                            'Lorem ipsum dummy text of the industry.',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'Lorem Ipsum has been the standard dummy ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'sads iower piip....',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Color(0xff687bb9),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                '10:00 - 11:00',
                                                style: TextStyle(
                                                  color: Color(0xff687bb9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ),
                                  SizedBox(height:10),
                                  Container(child:Center(child: Text('Apply',style: TextStyle(color:Colors.grey),)),height: 40,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(color: Color(0xfffaeaea),                                borderRadius: BorderRadius.circular(6),
                                  ))

                                ],
                              ),
                            ),
                          ), Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(

                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w, top: 10.h),                                    child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 20.w),
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 60.h,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue, width: 2),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'APR',
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
                                                      '18',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 12.w),
                                      Container(
                                        height: 80.h,
                                        width: 1.w,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Cardinal Heenan House'),
                                          Text(
                                            'Lorem ipsum dummy text of the industry.',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'Lorem Ipsum has been the standard dummy ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'sads iower piip....',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Color(0xff687bb9),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                '10:00 - 11:00',
                                                style: TextStyle(
                                                  color: Color(0xff687bb9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ),
                                  SizedBox(height:10),
                                  Container(child:Center(child: Text('Apply',style: TextStyle(color:Colors.grey),)),height: 40,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(color: Color(0xfffaeaea),                                borderRadius: BorderRadius.circular(6),
                                  ))

                                ],
                              ),
                            ),
                          ), Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Container(

                              width: 700.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w, top: 10.h),                                    child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 20.w),
                                              Container(
                                                height: 10.h,
                                                width: 2.w,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 60.h,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue, width: 2),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'APR',
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
                                                      '18',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 12.w),
                                      Container(
                                        height: 80.h,
                                        width: 1.w,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Cardinal Heenan House'),
                                          Text(
                                            'Lorem ipsum dummy text of the industry.',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'Lorem Ipsum has been the standard dummy ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            'sads iower piip....',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Color(0xff687bb9),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                '10:00 - 11:00',
                                                style: TextStyle(
                                                  color: Color(0xff687bb9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ),
                                  SizedBox(height:10),
                                  Container(child:Center(child: Text('Apply',style: TextStyle(color:Colors.grey),)),height: 40,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(color: Color(0xfffaeaea),                                borderRadius: BorderRadius.circular(6),
                                  ))

                                ],
                              ),
                            ),
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
