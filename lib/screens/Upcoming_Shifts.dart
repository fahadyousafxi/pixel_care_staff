import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/Upcomming_Shifts_Model.dart';

import '../Controller/UpcomingShiftsController.dart';

class UpcomingShifts extends StatefulWidget {
  const UpcomingShifts({Key? key}) : super(key: key);

  @override
  State<UpcomingShifts> createState() => _UpcomingShiftsState();
}

class _UpcomingShiftsState extends State<UpcomingShifts> {
  Future<UpcommingShiftsModel>? upcoming;

  void initState() {
    GetData1();
    // TODO: implement initState
    super.initState();
  }

  Future<void> GetData() async {
    upcoming = UpcomingShiftsController().GetAll();
  }

  GetData1() async {
    await GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'Upcoming Shifts',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body:
          // Visibility(
          //   visible: index == 0,
          //   child:
          Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<UpcommingShiftsModel>(
                stream: upcoming?.asStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.data!.length == 0) {
                      return Center(
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                              child: const Text("No Data")));
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data?.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 20.h),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 10.h),
                                width: 700.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
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
                                            // Image(image: AssetImage('assets/images/calendar2.png'), height: 44, width: 44,),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${snapshot.data?.data!.elementAt(index).careHome.name}'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              // child: Text(
                                              //   '${snapshot.data?.data?.elementAt(index).title}',
                                              //   maxLines: 3,
                                              //   overflow:
                                              //   TextOverflow
                                              //       .ellipsis,
                                              //   style: TextStyle(
                                              //       color: Colors
                                              //           .black,
                                              //       fontSize:
                                              //       17.sp),
                                              // ),
                                            ),

                                            /// changes
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                'Shift Date: ${snapshot.data?.data!.elementAt(index).date.toString().substring(0, 10)}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.sp),
                                              ),
                                            ),

                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: snapshot.data?.data!
                                                            .elementAt(index)
                                                            .shift
                                                            .toString() ==
                                                        "1"
                                                    ? Text(
                                                        'Shift Type: Day',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 17.sp),
                                                      )
                                                    : Text(
                                                        'Night',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 17.sp),
                                                      )),

                                            /// will change it

                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                'Shift Start: ${snapshot.data?.data!.elementAt(index).timeStart.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.sp),
                                              ),
                                            ),

                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                'Shift End:   ${snapshot.data?.data!.elementAt(index).timeEnd.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        // SizedBox(width: 20.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 25.h),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
      // ),
    );
  }
}
