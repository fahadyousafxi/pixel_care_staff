import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../Model/ReferenceModel.dart';
import '../screens/EditReference.dart';
import 'BankDetails.dart';
import 'DBS_Details.dart';
import 'HealthCondition.dart';
import 'Model/ApplicationFormModel.dart';
import 'Reference_Form.dart';

class refrenceform extends StatefulWidget {
  refrenceform({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<refrenceform> createState() => _refrenceformState();
}

class _refrenceformState extends State<refrenceform> {
  List title = ['Yes', 'No'];
  var title1Selected = 'Yes';
  var title2Selected = 'Yes';
  var title3Selected = 'Yes';
  var title4Selected = 'Yes';
  var month = 'September';
  var day = '1';
  var year = '2022';
  var dob;
  var emp = false;
  @override
  void initState() {
    // TODO: implement initState
    hide();
    AuthController().GetRef();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: WillPopScope(
        onWillPop: () {
          bottomNavigationBarState.selectedIndex = 0;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => bottomNavigationBar()),
              (Route route) => false);
          return false as Future<bool>;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h, left: 10.w),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Reference',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Provide information regarding reference',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 30.h,
                    child: Row(
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ReferencePage()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' Add New Reference ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ))),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.59,
                        child: FutureBuilder<ReferenceModel>(
                            future: AuthController().GetRef(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.data!.length != 0) {
                                  Future.delayed(Duration(seconds: 1))
                                      .then((value) => setState(() {
                                            emp = true;
                                          }));
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                            children: List.generate(
                                                snapshot.data!.data!.length,
                                                (index) => Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 10)
                                                          ]),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Name: ',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    Text(
                                                                        '${snapshot.data?.data?.elementAt(index).name}',
                                                                        style:
                                                                            TextStyle()),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) => EditReferencePage(
                                                                                  address: snapshot.data?.data?.elementAt(index).address,
                                                                                  email: snapshot.data?.data?.elementAt(index).email,
                                                                                  jobTitle: snapshot.data?.data?.elementAt(index).jobTitle,
                                                                                  name: snapshot.data?.data?.elementAt(index).name,
                                                                                  organization: snapshot.data?.data?.elementAt(index).organization,
                                                                                  phoneNumber: snapshot.data?.data?.elementAt(index).phoneNumber,
                                                                                  relation: snapshot.data?.data?.elementAt(index).relation,
                                                                                )));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .edit_note,
                                                                        color: Colors
                                                                            .green,
                                                                        size:
                                                                            30,
                                                                      )),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        showDialog<
                                                                            void>(
                                                                          context:
                                                                              context,
                                                                          barrierDismissible:
                                                                              false, // user must tap button!
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return AlertDialog(
                                                                              title: Text('Are you sure?'),
                                                                              content: SingleChildScrollView(
                                                                                child: ListBody(
                                                                                  children: <Widget>[
                                                                                    Text('This action cannot be undone.'),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              actions: <Widget>[
                                                                                TextButton(
                                                                                  child: Text('Cancel', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                ),
                                                                                TextButton(
                                                                                  child: Text(
                                                                                    'Delete',
                                                                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    // Perform the delete action here
                                                                                    var response = await AuthController().DeleteRef(snapshot.data?.data?.elementAt(index).id);
                                                                                    setState(() {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                          content: Text(
                                                                                        "This record and its details will be permanently deleted.",
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      )));
                                                                                    });
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Colors
                                                                            .red,
                                                                      ))
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Job Title: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Text(
                                                                    '${snapshot.data?.data?.elementAt(index).jobTitle}',
                                                                    style:
                                                                        TextStyle()),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Organization: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                        '${snapshot.data?.data?.elementAt(index).organization}',
                                                                        style:
                                                                            TextStyle())),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Address: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                        '${snapshot.data?.data?.elementAt(index).address}',
                                                                        style:
                                                                            TextStyle())),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Phone Number: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                        '${snapshot.data?.data?.elementAt(index).phoneNumber}',
                                                                        style:
                                                                            TextStyle())),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Email: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                        '${snapshot.data?.data?.elementAt(index).email}',
                                                                        style:
                                                                            TextStyle())),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'How this person knows you? ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                        '${snapshot.data?.data?.elementAt(index).relation} ',
                                                                        style:
                                                                            TextStyle())),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text(
                                        'No reference added yet!',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: Container(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.pinkAccent.shade100
                                          .withOpacity(0.5),
                                    ),
                                  )),
                                );
                              }
                            }),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 20.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 60.h,
                                  width: 300.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Previous',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (month == 'January') {
                                    month = '01';
                                  } else if (month == 'February') {
                                    month = '02';
                                  } else if (month == 'March') {
                                    month = '03';
                                  } else if (month == 'April') {
                                    month = '04';
                                  } else if (month == 'May') {
                                    month = '05';
                                  } else if (month == 'June') {
                                    month = '06';
                                  } else if (month == 'July') {
                                    month = '07';
                                  } else if (month == 'August') {
                                    month = '08';
                                  } else if (month == 'September') {
                                    month = '09';
                                  } else if (month == 'October') {
                                    month = '10';
                                  } else if (month == 'November') {
                                    month = '11';
                                  } else if (month == 'December') {
                                    month = '12';
                                  }

                                  if (emp == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HealthPage(
                                          model: widget.model,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 60.h,
                                  width: 300.w,
                                  decoration: BoxDecoration(
                                    color: emp == true
                                        ? Colors.pink
                                        : Color(0xfffaeaea),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      /// changes
                                      'Next',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: emp == true
                                              ? Colors.white
                                              : Colors.grey,),
                                    ),
                                  ),
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
      ),
    );
  }
}
