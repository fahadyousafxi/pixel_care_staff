import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/Controller/ApplicationFormController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../widgets/bottomNavigationBar/BottomNavigation.dart';
import 'Model/ApplicationFormModel.dart';

class Declaration extends StatefulWidget {
  Declaration({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  bool isChecked1 = true;
  bool isChecked2 = false;
  var emp = false;
  var month =
      '${DateTime.now().month == 1 ? 'January' : DateTime.now().month == 1 ? 'February' : DateTime.now().month == 1 ? 'March' : DateTime.now().month == 1 ? 'April' : DateTime.now().month == 1 ? 'May' : DateTime.now().month == 1 ? 'June' : DateTime.now().month == 1 ? 'July' : DateTime.now().month == 1 ? 'August' : DateTime.now().month == 1 ? 'September' : DateTime.now().month == 1 ? 'October' : DateTime.now().month == 1 ? 'November' : 'December'}';
  var day = '${DateTime.now().day}';
  var year = '${DateTime.now().year}';
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  var scroll = false;
  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController sign = new TextEditingController();
  TextEditingController date = new TextEditingController();
  @override
  void initState() {
    date.text =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    // TODO: implement initState
    super.initState();
  }

  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("sign") != null) {
      sign.text = _prefs.getString("sign").toString();
    }
    // if (_prefs.getString("date") != null) {
    //   date.text = _prefs.getString("date");
    // }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: scroll
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 30.h),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Declaration',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Statement signed by applicant',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                    width: 700.w,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text:
                              'Candidates selected for interview will normally be notified within four weeks of the closing date.\n\nPlease read and complete the following declaration and sign in the required space below.Please note: if this declaration is not completed and signed,your application will not be considered.\n\nI agree that',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Pixel Care Ltd ',
                                style: TextStyle(color: Colors.red.shade500)),
                            TextSpan(
                              text:
                                  'can create and maintain computer and paper records of my personal data and that this will be processed and stored in accordance with the Data Protection Act 1998.\n\n',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            ),
                            TextSpan(
                              text:
                                  'I confirm that all the information given by me on the form(s) are correct and accurate and I understand that if any of the  information I have provided is later found to be false or misleading,any offer of employement may result in withdraw  of employement with',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            ),
                            TextSpan(
                                text: ' Pixel Care Ltd. ',
                                style: TextStyle(color: Colors.red.shade500)),
                          ]),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Signature'),
                          Text('Lock to sign\n'),
                          Container(
                            child: SfSignaturePad(
                              key: _signaturePadKey,
                              backgroundColor: Colors.grey[200],
                            ),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      'Press to ${scroll ? 'Unlock' : 'Lock'} scroll '),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          scroll = !scroll;
                                          emp = true;
                                        });
                                      },
                                      icon: !scroll
                                          ? Icon(Icons.lock_open)
                                          : Icon(Icons.lock_outline))
                                ],
                              ),
                              emp == false
                                  ? Text("")
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _signaturePadKey.currentState!
                                              .clear();
                                        });
                                      },
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Submission Date '),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 90.w,
                                    child: DropdownButtonFormField<String>(
                                      value: day,
                                      items: List.generate(
                                          31,
                                          (index) => DropdownMenuItem(
                                                child: Text('${index + 1}'),
                                                value: '${index + 1}',
                                              )),
                                      onChanged: (String? value) {
                                        day = value!;
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
                                      value: month,
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
                                      onChanged: (String? value) {
                                        month = value!;
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
                                      value: year,
                                      items: List.generate(
                                          DateTime.now().year,
                                          (index) => DropdownMenuItem(
                                                child: Text(
                                                    '${DateTime.now().year - index}'),
                                                value:
                                                    '${DateTime.now().year - index}',
                                              )),
                                      onChanged: (String? value) {
                                        year = value!;
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final data1 = await _signaturePadKey.currentState!
                                  .toImage(pixelRatio: 3.0);
                              ByteData? byteData = await data1.toByteData(
                                  format: ui.ImageByteFormat.png);
                              Uint8List? pngBytes =
                                  byteData?.buffer.asUint8List();
                              String bs64 = base64Encode(pngBytes!);
                              String img64 = "data:sign/png;base64," + bs64;
                              print(img64);
                              Decleration dec = new Decleration();
                              dec.signature = img64;
                              dec.date = day + '-' + month + '-' + year;
                              widget.model.decleration = dec;
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Container(
                                      child: Center(
                                          child: new CircularProgressIndicator(
                                    color: Color(0xfffaeaea),
                                  )));
                                },
                              );
                              var data = await ApplicationFormController()
                                  .Apply(widget.model);
                              Navigator.pop(context);
                              if (data.toString().contains('Ops something')) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  'Request Failed Retry!',
                                  style: TextStyle(color: Colors.white),
                                )));
                              } else {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setString("appForm",
                                    widget.model.toJson().toString());
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        height: 400.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 50,
                                            ),
                                            // Image.asset(
                                            //   'assets/images/conglogo.png',
                                            //   height: 200.h,
                                            //   width: 200.w,
                                            // ),
                                            Text('Congratulations',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.andadaPro(
                                                    fontSize: 30.sp,
                                                    color: Colors.pink,
                                                    fontWeight: FontWeight.bold)
                                                // TextStyle(
                                                //     fontSize: 30.sp,
                                                //     color: Colors.pink,
                                                //     fontWeight: FontWeight.bold),
                                                ),
                                            Text(
                                              'Your application has been saved successfully',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Center(
                                              child: Text(
                                                'You will be notified regarding the status  of your application within 48 hours',
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                bottomNavigationBarState
                                                    .selectedIndex = 0;
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                bottomNavigationBar()),
                                                        (Route route) => false);
                                                // Navigator.of(context)
                                                //     .pushReplacement(
                                                //         MaterialPageRoute(
                                                //             builder: (context) =>
                                                //                 bottomNavigationBar()));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.pink.shade500,
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.home_outlined,
                                                  color: Colors.white,
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                            // bottomNavigationBarState.selectedIndex=0;
                            //
                            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>bottomNavigationBar()),(route) => false,);
                          },
                          child: Container(
                            height: 60.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color:
                                  emp == true ? Colors.pink : Color(0xfffaeaea),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: emp == true
                                        ? Colors.white
                                        : Colors.grey.shade500),
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
    );
  }
}
