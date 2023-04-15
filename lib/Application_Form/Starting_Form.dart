// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/Personal_Details.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> months = [
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
  ];
  var titleSelected = 'Registered Nurse (RGN)';
  TextEditingController pin = TextEditingController();
  List titlegen = ['Mr', 'Miss'];
  var titleSelectedgen = 'Mr';
  var month = 'January';
  var day = '1';
  var year = '2023';
  var dob;

  Future<void> _SetVals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("heared") != null) {
      howKnow.text = prefs.getString("heared").toString();
    }
    if (prefs.getString("pin") != null) {
      pin.text = prefs.getString("pin").toString();
    }

    if (prefs.getString("dayed") != null) {
      day = prefs.getString("dayed").toString();
    }

    if (prefs.getString("monthed") != null) {
      month = prefs.getString("monthed").toString();
      print(month);
      print(prefs.getString("monthed").toString());
    }
    if (prefs.getString("yeared") != null) {
      year = prefs.getString("yeared").toString();
    }

    if (prefs.getString("rgn") != null) {
      titleSelected = prefs.getString("rgn").toString();
    }
    if (prefs.getString("company") != null) {
      company.text = prefs.getString("company").toString();
    }
    if (prefs.getString("incNo") != null) {
      incNo.text = prefs.getString("incNo").toString();
    }
    if (prefs.getString("weekly") != null) {
      weekly.text = prefs.getString("weekly").toString();
    }
    setState(() {});
  }

  void currentDate() {
    DateTime.now().month;
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
          return null;
        },
        onChanged: (val) async {
          await _SetVals();
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: const Color(0xffACA9A9),
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
          hintText: hinttext,
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController position = TextEditingController();
  TextEditingController howKnow = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController incNo = TextEditingController();
  TextEditingController weekly = TextEditingController();
  ApplicationFormModel model = ApplicationFormModel();

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
                        const Text(
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
                              child: const Text('Position Applied For'),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                                  setState(() async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    titleSelected = value!;
                                    prefs.setString("rgn", value);
                                    setState(() {});
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

                            Visibility(
                              visible:
                                  titleSelected == 'Registered Nurse (RGN)' ||
                                      titleSelected ==
                                          'Registered Mental Nurse (RMN)',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    child: const Text('Company Name'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 20.w, right: 20.w),
                                    child: TextFormField(
                                      controller: company,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill out this field';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        prefs.setString(
                                            "company", val.toString());

                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(18),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: const Color(0xffACA9A9),
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
                                        hintText: 'Enter company name',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible:
                                  titleSelected == 'Registered Nurse (RGN)' ||
                                      titleSelected ==
                                          'Registered Mental Nurse (RMN)',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    child: const Text('Company INC. No'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 20.w, right: 20.w),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: incNo,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill out this field';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        prefs.setString(
                                            "incNo", val.toString());

                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(18),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: const Color(0xffACA9A9),
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
                                        hintText: 'Enter company INC. No',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    child: const Text(
                                        'Weekly number of hours allowed'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 20.w, right: 20.w),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: weekly,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill out this field';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        prefs.setString(
                                            "weekly", val.toString());

                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(18),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: const Color(0xffACA9A9),
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
                                        hintText:
                                            'Enter weekly number of hours allowed',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 20.w, top: 15.h),
                              child: const Text(
                                  'How you heard about the vacancy?'),
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
                                  return null;
                                },
                                onChanged: (val) async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  prefs.setString("heared", val.toString());

                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: const Color(0xffACA9A9),
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
                                      titleSelected ==
                                          'Registered Mental Nurse (RMN)',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: const Text('NMC Pin Number'),
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
                                        return null;
                                      },
                                      onChanged: (val) async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();

                                        prefs.setString("pin", val.toString());
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(18),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: const Color(0xffACA9A9),
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
                                        hintText: 'Enter NMC Pin number',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: const Text('Expiry Date'),
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
                                                      value: '${index + 1}',
                                                      child:
                                                          Text('${index + 1}'),
                                                    )),
                                            onChanged: (String? value) async {
                                              day = value!;
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString("dayed", day);
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
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
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
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
                                            value: month == null ||
                                                    !months.contains(month)
                                                ? "January"
                                                : month,
                                            // == null
                                            // ? "January"
                                            // : month,
                                            items: months
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (String? value) async {
                                              month = value!;
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString("monthed", month);
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 4),
                                              hintStyle: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
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
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
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
                                                year == "null" ? "2023" : year,
                                            items: List.generate(
                                                DateTime.now().year + 10,
                                                (index) => DropdownMenuItem(
                                                      value:
                                                          '${DateTime.now().year + 10 - index}',
                                                      child: Text(
                                                          '${DateTime.now().year + 10 - index}'),
                                                    )),
                                            onChanged: (String? value) async {
                                              year = value!;
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString("yeared", year);

                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
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
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
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
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("monthdb", month);

                            prefs.setString("yeardb", year);

                            prefs.setString("daydb", day);
                            NmcDetail nmc = NmcDetail();
                            model.postAppliedFor =
                                title.indexOf(titleSelected).toString();
                            model.howHeardVacancy = howKnow.text;
                            model.companyName = company.text;
                            model.incorporationNumber = incNo.text;
                            model.weeklyHoursAllowed = weekly.text;
                            nmc.nmcPinNo = pin.text;
                            nmc.expiryDate = '$year-$month-$day';
                            model.nmcDetail = nmc;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalDetailPage(
                                  model: model,
                                ),
                              ),
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
                              : const Color(0xfffaeaea),
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
