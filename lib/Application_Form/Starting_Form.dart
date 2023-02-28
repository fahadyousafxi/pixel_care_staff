import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/Personal_Details.dart';
import 'package:pixel_app/screens/PersonalDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import 'Address.dart';
import 'Model/ApplicationFormModel.dart';

class StartingFormPage extends StatefulWidget {
  const StartingFormPage({Key? key}) : super(key: key);

  @override
  State<StartingFormPage> createState() => _StartingFormPageState();
}

class _StartingFormPageState extends State<StartingFormPage> {
  List title = [
    'Registered Nurse (RGN)',
    'Registered Mental Nurse (RMN)',
    'Senior Carer',
    'Health Care Assistant (HCA)',
    'Kitchen Assistant',
    'Chef',
    'Admin'
  ];
  var titleSelected = 'Registered Nurse (RGN)';
  TextEditingController pin = new TextEditingController();
  List titlegen = ['Mr', 'Miss'];
  var titleSelectedgen = 'Mr';
  var month = 'September';
  var day = '1';
  var year = '2010';
  var dob;

  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("heared") != null) {
      howKnow.text = _prefs.getString("heared").toString();
    }
    if (_prefs.getString("pin") != null) {
      pin.text = _prefs.getString("pin").toString();
    }

    if (_prefs.getString("daydb") != null) {
      day = _prefs.getString("day").toString();
    }

    if (_prefs.getString("monthdb") != null) {
      month = _prefs.getString("month").toString();
    }
    if (_prefs.getString("yeardb") != null) {
      year = _prefs.getString("year").toString();
    }

    if (_prefs.getString("rgn") != null) {
      titleSelected = _prefs.getString("rgn").toString();
    }
    setState(() {});
  }

  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
        },
        onChanged: (val) async {
          await _SetVals();
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: Color(0xffACA9A9),
          ),
          fillColor: Color(0xfff0f0f0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: hinttext,
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController position = new TextEditingController();
  TextEditingController howKnow = new TextEditingController();
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  void initState() {
    // TODO: implement initState
    _SetVals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h, left: 10.w),
                    child: Column(
                      children: [
                        Text(
                          'Application Form',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Proceed With Form To Get Started',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Text('Position Applied For'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: DropdownButtonFormField<String>(
                                value: titleSelected,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select from this field';
                                  }
                                },
                                items: title
                                    .map((e) => DropdownMenuItem<String>(
                                          child: Text(e),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() async {
                                    SharedPreferences _prefs = await SharedPreferences.getInstance();
                                    titleSelected = value!;
                                    _prefs.setString("rgn", value);
                                    setState(() {});
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Color(0xffACA9A9),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.w, top: 15.h),
                              child: Text('How you heard about the vacancy?'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10.h, left: 20.w, right: 20.w),
                              child: TextFormField(
                                controller: howKnow,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill out this field';
                                  }
                                },
                                onChanged: (val) async {
                                  SharedPreferences _prefs =
                                      await SharedPreferences.getInstance();

                                  _prefs.setString("heared", val.toString());

                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(18),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Color(0xffACA9A9),
                                  ),
                                  fillColor: Color(0xfff0f0f0),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  hintText: 'Enter source',
                                ),
                              ),
                            ),

                            // MyTextField(
                            //   controller: howKnow,
                            //   decoration: InputDecoration(),
                            //   hinttext: 'Enter source',
                            // ),
                            Visibility(
                              visible:
                                  titleSelected == 'Registered Nurse (RGN)' ||
                                      titleSelected == 'Registered Mental Nurse (RMN)',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: Text('NMC Pin Number'),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: TextFormField(
                                      controller: pin,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill out this field';
                                        }
                                      },
                                      onChanged: (val) async {
                                        SharedPreferences _prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        _prefs.setString("pin", val.toString());
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(18),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: Color(0xffACA9A9),
                                        ),
                                        fillColor: Color(0xfff0f0f0),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        hintText: 'Enter NMC Pin number',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: Text('Expiry Date'),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 20.w, right: 20.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 90.w,
                                          child:
                                              DropdownButtonFormField<String>(
                                            value: day == "null" ? '1' : day,
                                            items: List.generate(
                                                31,
                                                (index) => DropdownMenuItem(
                                                      child:
                                                          Text('${index + 1}'),
                                                      value: '${index + 1}',
                                                    )),
                                            onChanged: (String? value) async {
                                              day = value!;
                                              SharedPreferences _prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              _prefs.setString("daydb", day);
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                              hintStyle: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Color(0xffACA9A9),
                                              ),
                                              fillColor: Colors.grey.shade200,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          height: 50.h,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            value: month == "null"
                                                ? "January"
                                                : month,
                                            items: [
                                              'January',
                                              'February',
                                              'March',
                                              'April',
                                              'May',
                                              'June',
                                              'July',
                                              'August',
                                              'September',
                                              'October',
                                              'November',
                                              'December'
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      child: Text('${e}'),
                                                      value: e,
                                                    ))
                                                .toList(),
                                            onChanged: (String? value) async {
                                              month = value!;
                                              SharedPreferences _prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              _prefs.setString(
                                                  "monthdb", month);
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 4),
                                              hintStyle: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: Color(0xffACA9A9),
                                              ),
                                              fillColor: Colors.grey.shade200,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          height: 50.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                            value:
                                                // njh
                                                year == "null"   ? "2010" : year,
                                            items: List.generate(
                                                DateTime.now().year + 10,
                                                (index) => DropdownMenuItem(
                                                      child: Text(
                                                          '${DateTime.now().year + 10 - index}'),
                                                      value:
                                                          '${DateTime.now().year + 10 - index}',
                                                    )),
                                            onChanged: (String? value) async {
                                              year = value!;
                                              SharedPreferences _prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              _prefs.setString("yeardb", year);

                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                              hintStyle: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Color(0xffACA9A9),
                                              ),
                                              fillColor: Colors.grey.shade200,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.w),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () async {
                        // if (year != "null" &&
                        //     month != "null" &&
                        //     day != "null") {
                        month = month == "null" ? "September" : month;
                        day = day == "null" ? "1" : day;
                        year = year == "null" ? "2022" : year;
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
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

                          DateTime now = DateTime.now();

                          // if (int.parse(year) == now.year) {
                            // if (now.month >= int.parse(month)) {
                              // if (int.parse(day) >= now.day) {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  SharedPreferences _prefs =
                                      await SharedPreferences.getInstance();
                                  _prefs.setString("monthdb", month);

                                  _prefs.setString("yeardb", year);

                                  _prefs.setString("daydb", day);
                                  NmcDetail nmc = new NmcDetail();
                                  model.postAppliedFor =
                                      title.indexOf(titleSelected).toString();
                                  model.howHeardVacancy = howKnow.text;
                                  nmc.nmcPinNo = pin.text;
                                  nmc.expiryDate =
                                      year + '-' + month + '-' + day;
                                  model.nmcDetail = nmc;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PersonalDetailPage(model: model)),
                                  );
                                }
                                print("Evaluated");
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //       content: Text(
                              //           'Expiry Date Must not be from past....................')));
                              //   print(
                              //       "Expiry Date Must not be from past....................");
                              // }
                            // }
                            // else if(){

                            // }
                            // else {
                            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //       content: Text(
                            //           'Expiry Date Must not be from past....................')));
                            //   print(
                            //       "Expiry Date Must not be from past....................");
                            // }
                          // } else if (int.parse(year) > now.year) {
                          //   if (int.parse(month) >= now.month ||
                          //       int.parse(month) <= now.month) {
                          //     if (int.parse(day) >= now.day ||
                          //         int.parse(day) <= now.day) {
                          //       SharedPreferences _prefs =
                          //           await SharedPreferences.getInstance();
                          //       _prefs.setString("monthdb", month);
                          //
                          //       _prefs.setString("yeardb", year);
                          //
                          //       _prefs.setString("daydb", day);
                          //       NmcDetail nmc = new NmcDetail();
                          //       model.postAppliedFor =
                          //           title.indexOf(titleSelected).toString();
                          //       model.howHeardVacancy = howKnow.text;
                          //       nmc.nmcPinNo = pin.text;
                          //       nmc.expiryDate = year + '-' + month + '-' + day;
                          //       model.nmcDetail = nmc;
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 PersonalDetailPage(model: model)),
                          //       );
                          //
                          //       print("Evaluated");
                          //     } else {
                          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //           content: Text(
                          //               'Expiry Date Must not be from past....................')));
                          //       print(
                          //           "Expiry Date Must not be from past....................");
                          //     }
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //         content: Text(
                          //             'Expiry Date Must not be from past....................')));
                          //     print(
                          //         "Expiry Date Must not be from past....................");
                          //   }
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(
                          //           'Expiry Date Must not be from past....................')));
                          //   print(
                          //       "Expiry Date Must not be from past....................");
                          // }










                          /// old Comment
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text('Pick Date')));
                          // }
                        }
                      },
                      child: Container(
                        height: 60.h,
                        width: 400.w,
                        decoration: BoxDecoration(
                          color: formKey.currentState?.validate() == true
                              ? Colors.pink
                              : Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: formKey.currentState?.validate() == true
                                    ? Colors.white
                                    : Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ),
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
