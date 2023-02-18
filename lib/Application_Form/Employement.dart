import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Constants/Constant.dart';
import 'BankDetails.dart';
import 'Covid_19_Questions.dart';
import 'Employment_Previous.dart';
import 'Model/ApplicationFormModel.dart';
import 'Next_of_Kin.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';

class EmploymentPage extends StatefulWidget {
  EmploymentPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<EmploymentPage> createState() => _EmploymentPageState();
}

class _EmploymentPageState extends State<EmploymentPage> {
  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        onChanged: (val) {
          setState(() {});
        },
        textCapitalization: TextCapitalization.words,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
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

  TextEditingController name = new TextEditingController();
  TextEditingController position = new TextEditingController();
  TextEditingController reason = new TextEditingController();
  TextEditingController salery = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  List title = ['Previous', 'Present', 'Nill'];
  var titleSelected = 'Previous';
  var month1 = 'January';
  var day1 = '1';
  var year1 = '2022';
  var month = 'September';
  var day = '1';
  var year = '2022';
  List<Employment> detailslist = [];
  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("name") != null) {
      name.text = _prefs.getString("name").toString();
    }

    if (_prefs.getString("position") != null) {
      position.text = _prefs.getString("position").toString();
    }
    if (_prefs.getString("Title4") != null) {
      titleSelected = _prefs.getString("Title4").toString();
    }
    if (_prefs.getString("reason") != null) {
      reason.text = _prefs.getString("reason").toString();
    }
    if (_prefs.getString("desc") != null) {
      desc.text = _prefs.getString("desc").toString();
    }
    if (_prefs.getString("daye") != null) {
      day1 = _prefs.getString("daye").toString();
    }

    if (_prefs.getString("monthe") != null) {
      month1 = _prefs.getString("monthe").toString();
    }
    if (_prefs.getString("yeare") != null) {
      year1 = _prefs.getString("yeare").toString();
    }

    setState(() {});
  }

  @override
  void initState() {
    hide();
    titleSelected = widget.model.employment?.last.type ?? "Previous";
    name.text = widget.model.employment?.last.nameOfEmployer ?? "";
    reason.text = widget.model.employment?.last.reasonForLeaving ?? "";
    desc.text = widget.model.employment?.last.dutiesDescription ?? "";
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        formKey.currentState?.validate();
      });
    });
    // TODO: implement initState
    _SetVals();
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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, left: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Employment',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Employment details of current position',
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
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Type'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: DropdownButtonFormField<String>(
                            /// Previous d
                            value: "Previous",
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
                            onChanged: (String? value) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Title4", value.toString());

                              titleSelected = value!;
                              setState(() {});
                              Future.delayed(Duration(seconds: 1))
                                  .then((value) {
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
                        Visibility(
                          visible: titleSelected == 'Nill',
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                          ),
                        ),
                        Visibility(
                          visible: titleSelected != 'Nill',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Date Started'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 20.w, right: 20.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 90.w,
                                      child: DropdownButtonFormField<String>(
                                        value: "1",
                                        items: List.generate(
                                            31,
                                            (index) => DropdownMenuItem(
                                                  child: Text('${index + 1}'),
                                                  value: '${index + 1}',
                                                )),
                                        onChanged: (String? value) async {
                                          day1 = value!;
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "daye", value.toString());
                                          setState(() {});
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
                                    SizedBox(width: 10.w),
                                    Container(
                                      height: 50.h,
                                      width: 140.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: "January",
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
                                          month1 = value!;
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "monthe", value.toString());
                                          setState(() {});
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
                                    SizedBox(width: 10.w),
                                    Container(
                                      height: 50.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: "2022",
                                        items: List.generate(
                                            DateTime.now().year,
                                            (index) => DropdownMenuItem(
                                                  child: Text(
                                                      '${DateTime.now().year - index}'),
                                                  value:
                                                      '${DateTime.now().year - index}',
                                                )),
                                        onChanged: (String? value) async {
                                          year1 = value!;
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "yeare", value.toString());
                                          setState(() {});
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
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Name of Employer'),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: TextFormField(
                                  onChanged: (val) async {
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("name", val.toString());

                                    setState(() {});
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  controller: name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please fill out this field';
                                    }
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
                                    hintText: 'Enter name',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Reason for leaving'),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: TextFormField(
                                  onChanged: (val) async {
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("reason", val.toString());
                                    setState(() {});
                                  },
                                  controller: reason,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please fill out this field';
                                    }
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
                                    hintText: 'Enter reason',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Brief Description of duties'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 20.w, right: 20.w),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 10.w, top: 10.h),
                                  height: 150.h,
                                  width: 700.w,
                                  color: Color(0xfff0f0f0),
                                  child: TextFormField(
                                    onChanged: (val) async {
                                      SharedPreferences _prefs =
                                          await SharedPreferences.getInstance();
                                      _prefs.setString("desc", val.toString());

                                      setState(() {});
                                    },
                                    controller: desc,
                                    maxLines: 100,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please fill out this field';
                                      }
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
                                      hintText: 'Enter description',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.w, right: 20.w, bottom: 10.h),
                                child: Row(
                                  children: [
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

                                          //

                                          if (month1 == 'January') {
                                            month1 = '01';
                                          } else if (month1 == 'February') {
                                            month1 = '02';
                                          } else if (month1 == 'March') {
                                            month1 = '03';
                                          } else if (month1 == 'April') {
                                            month1 = '04';
                                          } else if (month1 == 'May') {
                                            month1 = '05';
                                          } else if (month1 == 'June') {
                                            month1 = '06';
                                          } else if (month1 == 'July') {
                                            month1 = '07';
                                          } else if (month1 == 'August') {
                                            month1 = '08';
                                          } else if (month1 == 'September') {
                                            month1 = '09';
                                          } else if (month1 == 'October') {
                                            month1 = '10';
                                          } else if (month1 == 'November') {
                                            month1 = '11';
                                          } else if (month1 == 'December') {
                                            month1 = '12';
                                          }

                                          /// function
                                          if (formKey.currentState!
                                              .validate()) {
                                            Employment details =
                                                new Employment();
                                            details.type = titleSelected;
                                            details.nameOfEmployer = name.text;
                                            details.positionHeld =
                                                position.text;
                                            details.dateStarted = year1 +
                                                '-' +
                                                month1 +
                                                '-' +
                                                day1;
                                            details.noticePeriod =
                                                year + '-' + month + '-' + day;
                                            details.reasonForLeaving =
                                                reason.text;
                                            details.salaryOnLeavingPost =
                                                salery.text;
                                            details.dutiesDescription =
                                                desc.text;
                                            var aded = false;
                                            print(detailslist.length);
                                            if (detailslist != null ||
                                                detailslist.isNotEmpty) {
                                              detailslist.forEach((element) {
                                                if (element.type == 'Present' &&
                                                        titleSelected ==
                                                            'Present' &&
                                                    element.type == 'Nill' &&
                                                        titleSelected ==
                                                            'Nill') {
                                                  aded = true;
                                                }
                                              });
                                            }
                                            if (aded == true) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          // 'Select Title as Previous')));
                                                          'Saved! Now add more employments')));

                                            } else {
                                              detailslist.add(details);
                                              setState(() {
                                                name.text = '';
                                                position.text = '';
                                                reason.text = '';
                                                salery.text = '';
                                                desc.text = '';
                                              });
                                              print(widget.model.toJson());
                                            }
                                          }
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(SnackBar(
                                          //     content: Text(
                                          //         'Select Title ')));
                                        },
                                        child: Container(
                                          height: 60.h,
                                          width: 300.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Save and Add new employement',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: Row(
                        children: [
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

                                //

                                if (month1 == 'January') {
                                  month1 = '01';
                                } else if (month1 == 'February') {
                                  month1 = '02';
                                } else if (month1 == 'March') {
                                  month1 = '03';
                                } else if (month1 == 'April') {
                                  month1 = '04';
                                } else if (month1 == 'May') {
                                  month1 = '05';
                                } else if (month1 == 'June') {
                                  month1 = '06';
                                } else if (month1 == 'July') {
                                  month1 = '07';
                                } else if (month1 == 'August') {
                                  month1 = '08';
                                } else if (month1 == 'September') {
                                  month1 = '09';
                                } else if (month1 == 'October') {
                                  month1 = '10';
                                } else if (month1 == 'November') {
                                  month1 = '11';
                                } else if (month1 == 'December') {
                                  month1 = '12';
                                }
                                if (titleSelected != "Nill") {
                                  Employment details = new Employment();
                                  details.type = titleSelected;
                                  details.nameOfEmployer = name.text;
                                  details.positionHeld = position.text;
                                  details.dateStarted =
                                      year1 + '-' + month1 + '-' + day1;
                                  details.noticePeriod =
                                      year + '-' + month + '-' + day;
                                  details.reasonForLeaving = reason.text;
                                  details.salaryOnLeavingPost = salery.text;
                                  details.dutiesDescription = desc.text;
                                  if (name.text != '' &&
                                      name.text.isNotEmpty &&
                                      reason.text.isNotEmpty &&
                                      reason.text != null)
                                    detailslist.add(details);
                                  widget.model.employment = detailslist;
                                }
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

                                //

                                if (month1 == 'January') {
                                  month1 = '01';
                                } else if (month1 == 'February') {
                                  month1 = '02';
                                } else if (month1 == 'March') {
                                  month1 = '03';
                                } else if (month1 == 'April') {
                                  month1 = '04';
                                } else if (month1 == 'May') {
                                  month1 = '05';
                                } else if (month1 == 'June') {
                                  month1 = '06';
                                } else if (month1 == 'July') {
                                  month1 = '07';
                                } else if (month1 == 'August') {
                                  month1 = '08';
                                } else if (month1 == 'September') {
                                  month1 = '09';
                                } else if (month1 == 'October') {
                                  month1 = '10';
                                } else if (month1 == 'November') {
                                  month1 = '11';
                                } else if (month1 == 'December') {
                                  month1 = '12';
                                }
                                if (titleSelected != "Nill") {
                                  Employment details = new Employment();
                                  details.type = titleSelected;
                                  details.nameOfEmployer = name.text;
                                  details.positionHeld = position.text;
                                  details.dateStarted =
                                      year1 + '-' + month1 + '-' + day1;
                                  details.noticePeriod =
                                      year + '-' + month + '-' + day;
                                  details.reasonForLeaving = reason.text;
                                  details.salaryOnLeavingPost = salery.text;
                                  details.dutiesDescription = desc.text;
                                  if (name.text != '' &&
                                      name.text.isNotEmpty &&
                                      reason.text.isNotEmpty &&
                                      reason.text != null)
                                    detailslist.add(details);
                                  widget.model.employment = detailslist;
                                }
                                //widget.model.employment=details;
                                print(widget.model.toJson());
                                if (formKey.currentState!.validate() ||
                                    titleSelected == "Nill") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BankDetailPage(model: widget.model),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: formKey.currentState?.validate() ==
                                              true ||
                                          titleSelected == "Nill"
                                      ? Colors.pink
                                      : Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            formKey.currentState?.validate() ==
                                                        true ||
                                                    titleSelected == "Nill"
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
