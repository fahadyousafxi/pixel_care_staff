import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/Educational_Details.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/AuthController.dart';
import 'accademicView.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({Key? key}) : super(key: key);

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  // Widget MyTextField(
  //     {required InputDecoration decoration,
  //     required String hinttext,
  //     onChanged}) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
  //     child: TextFormField(
  //       onChanged: onChanged ?? (value) {},
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return 'Please fill out this field';
  //         }
  //       },
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(18),
  //         hintStyle: GoogleFonts.dmSans(
  //           fontWeight: FontWeight.w500,
  //           fontSize: 15.sp,
  //           color: Color(0xffACA9A9),
  //         ),
  //         fillColor: Colors.grey.shade200,
  //         filled: true,
  //         border: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         hintText: hinttext,
  //       ),
  //     ),
  //   );
  // }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  var degree = 'Diploma';
  var uni = "";
  var year = "";
  var title = 'Diploma';

  @override
  void initState() {
    // TODO: implement initState
    hide();
    super.initState();
  }

  TextEditingController institutecont = new TextEditingController();
  TextEditingController passingyearcont = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      body: WillPopScope(
        onWillPop: () {
          return false as Future<bool>;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
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
                                uni = "";
                                year = "";
                                if (academicnav) {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AccademicView(),
                                  ));
                                } else {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => EducationalPage(
                                      model: model1,
                                    ),
                                  ));
                                }
                              },
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 15.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'Academic Qualification',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text('Degree'),
                      ),
                      // MyTextField(
                      //   onChanged: (value) {
                      //     degree = value;
                      //   },
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter degree',
                      // ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select title';
                            }

                            degree = value;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18),
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
                            hintText: 'Choose title',
                          ),
                          items: [
                            'Diploma',
                            'Bachelor',
                            'Master',
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                          value: title,
                          onChanged: (String? value) {
                            title = value!;
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text(' Institute'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: institutecont,
                          onChanged: ((value) {
                            uni = value;

                            setState(() {});
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18),
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
                            hintText: 'Enter Institute',
                          ),
                        ),
                      ),
                      // MyTextField(
                      //   onChanged: (value) {
                      //     uni = value;
                      //   },
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter Institute',
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text('Passing Year'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: passingyearcont,
                          maxLength: 4,
                          onChanged: ((value) {
                            year = value;
                            setState(() {});
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(18),
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
                            hintText: 'Enter Passing Year',
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 300.h, left: 20.w, right: 20.w, bottom: 20.h),
                    child: GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
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
                          if (degree == "") {
                            degree = title;
                          }
                          var data = await AuthController()
                              .updateAccademicQualification(
                                  degree: degree, uni: uni, year: year);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '$data',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        if (academicnav) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => AccademicView(),
                          ));
                        } else {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => EducationalPage(
                              model: model1,
                            ),
                          ));
                        }
                      },
                      child: Container(
                        height: 60.h,
                        width: 400.w,
                        decoration: BoxDecoration(
                          color: formKey.currentState?.validate() == true
                              ? Colors.pink
                              : degree != "" && uni != "" && year != ""
                                  ? Colors.pink
                                  : Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: formKey.currentState?.validate() == true
                                    ? Colors.white
                                    : degree != "" && uni != "" && year != ""
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
