import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import '../Constants/Constant.dart';
import '../screens/NMC_details.dart';
import 'DBS_Details.dart';
import 'Model/ApplicationFormModel.dart';
import 'NmcDetailsForm.dart';
import 'Personal_Details.dart';

class NextOfKinPage extends StatefulWidget {
  NextOfKinPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();
  @override
  State<NextOfKinPage> createState() => _NextOfKinPageState();
}

class _NextOfKinPageState extends State<NextOfKinPage> {
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

  TextEditingController surname = new TextEditingController();
  TextEditingController forename = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController relation = new TextEditingController();
  TextEditingController code = new TextEditingController();
  TextEditingController hometel = new TextEditingController();
  TextEditingController daytel = new TextEditingController();
  TextEditingController email = new TextEditingController();
  List title = ['Mr.', 'Ms.', 'Other'];
  var titleSelected = 'Mr';
  var month = 'September';
  var day = '1';
  var year = '2022';
  var dob;
  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString("Surname1") != null) {
      surname.text = _prefs.getString("Surname1").toString();
    }
    if (_prefs.getString("Forename1") != null) {
      forename.text = _prefs.getString("Forename1").toString();
    }

    if (_prefs.getString("address1") != null) {
      address.text = _prefs.getString("address1").toString();
    }

    if (_prefs.getString("postcode1") != null) {
      code.text = _prefs.getString("postcode1").toString();
    }

    if (_prefs.getString("mobilephone1") != null) {
      hometel.text = _prefs.getString("mobilephone1").toString();
    }
    if (_prefs.getString("email1") != null) {
      email.text = _prefs.getString("email1").toString();
    }

    if (_prefs.getString("Title1") != null) {
      titleSelected = _prefs.getString("Title1").toString();
    }

    if (_prefs.getString("day1") != null) {
      day = _prefs.getString("day1").toString();
    }

    if (_prefs.getString("month1") != null) {
      month = _prefs.getString("month1").toString();
    }
    if (_prefs.getString("year1") != null) {
      year = _prefs.getString("year1").toString();
    }

    if (_prefs.getString("relation") != null) {
      relation.text = _prefs.getString("relation").toString();
    }
    setState(() {});
  }

  @override
  void initState() {
    hide();
    titleSelected = widget.model.nextOfKin?.title ?? "Mr";
    surname.text = widget.model.nextOfKin?.surname ?? "";
    forename.text = widget.model.nextOfKin?.forename ?? "";
    address.text = widget.model.nextOfKin?.address ?? "";
    code.text = widget.model.nextOfKin?.postalCode ?? "";
    hometel.text = widget.model.nextOfKin?.homeTel ?? "";
    daytel.text = widget.model.nextOfKin?.dayTimeContact ?? "";
    email.text = widget.model.nextOfKin?.email ?? "";
    relation.text = widget.model.nextOfKin?.relationToYou ?? "";
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        formKey.currentState?.validate();
      });
    });
    _SetVals();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Form(
        key: formKey,
        child: WillPopScope(
          onWillPop: () {
            bottomNavigationBarState.selectedIndex = 0;
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => bottomNavigationBar()),
                (Route route) => false);
            return true as Future<bool>;
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, left: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Next of kin',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp,
                            ),
                          ),
                          // SizedBox(height: 10.h),
                          // Text(
                          //   'Person closest relative information',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.w500,
                          //     color: Colors.grey,
                          //   ),
                          // ),
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
                          child: Text('Title'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: DropdownButtonFormField<String>(
                            value: "Mr.",
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
                              titleSelected = value!;
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Title1", value);
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
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Surname'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Surname1", val);

                              setState(() {});
                            },
                            controller: surname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            textCapitalization: TextCapitalization.words,
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
                              hintText: 'Enter surname',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Forename'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Forename1", val);
                              setState(() {});
                            },
                            controller: forename,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            textCapitalization: TextCapitalization.words,
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
                              hintText: 'Enter forename',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Date of Birth'),
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
                                    day = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("day1", value);
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
                                    month = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("month1", value);
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
                                    year = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("year1", value);
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: Text('Post Code'),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: TextFormField(
                                      onChanged: (val) async {
                                        SharedPreferences _prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        _prefs.setString("postcode1", val);
                                        setState(() {});
                                      },
                                      controller: code,
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
                                        hintText: 'Enter post code',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Address'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("address1", val);
                              setState(() {});
                            },
                            controller: address,
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
                              hintText: 'Enter address',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 15.h),
                                          child: Text('Mobile Phone'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString("mobilephone1", val);
                                          setState(() {});
                                        },
                                        controller: hometel,
                                        keyboardType: TextInputType.number,
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
                                          hintText: 'Enter Mobile Phone',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Container(
                              //         margin: EdgeInsets.only(top: 15.h),
                              //         child: Text('Day Time Contact'),
                              //       ),
                              //       SizedBox(height: 10.h),
                              //       Padding(
                              //         padding: EdgeInsets.only(right: 5.w),
                              //         child: TextFormField(
                              //           onChanged: (val) {
                              //             setState(() {});
                              //           },
                              //           keyboardType: TextInputType.number,
                              //           controller: daytel,
                              //           validator: (value) {
                              //             if (value!.isEmpty) {
                              //               return 'Please fill out this field';
                              //             }
                              //           },
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.all(18),
                              //             hintStyle: GoogleFonts.dmSans(
                              //               fontWeight: FontWeight.w500,
                              //               fontSize: 15.sp,
                              //               color: Color(0xffACA9A9),
                              //             ),
                              //             fillColor: Color(0xfff0f0f0),
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             hintText: 'Enter day time contact',
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Email address'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("email1", val);
                              setState(() {});
                            },
                            controller: email,
                            validator: (value) {
                              final bool isValid =
                                  EmailValidator.validate(value.toString());

                              if (!isValid) {
                                return 'Invalid Email';
                              }

                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
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
                              hintText: 'Enter email address',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Relationship to you'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("relation", val);
                              setState(() {});
                            },
                            controller: relation,
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
                              hintText: 'Enter relationship to you',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
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
                                NextOfKin kin = new NextOfKin();
                                kin.title = titleSelected;
                                kin.surname = surname.text;
                                kin.forename = forename.text;
                                kin.postalCode = code.text;
                                kin.address = address.text;
                                kin.homeTel = hometel.text;
                                kin.dayTimeContact = daytel.text;
                                kin.email = email.text;
                                kin.relationToYou = relation.text;
                                kin.dob = year + '-' + month + '-' + day;
                                widget.model.nextOfKin = kin;
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
                                if (formKey.currentState!.validate()) {
                                  NextOfKin kin = new NextOfKin();
                                  kin.title = titleSelected;
                                  kin.surname = surname.text;
                                  kin.forename = forename.text;
                                  kin.postalCode = code.text;
                                  kin.address = address.text;
                                  kin.homeTel = hometel.text;
                                  kin.dayTimeContact = daytel.text;
                                  kin.email = email.text;
                                  kin.relationToYou = relation.text;
                                  kin.dob = year + '-' + month + '-' + day;
                                  widget.model.nextOfKin = kin;
                                  print(widget.model.toJson());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DBSPage(model: widget.model)),
                                  );
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color:
                                      formKey.currentState?.validate() == true
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
                                                    true
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
