import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/AuthController.dart';

class PasswordDetailPage extends StatefulWidget {
  const PasswordDetailPage({Key? key}) : super(key: key);

  @override
  State<PasswordDetailPage> createState() => _PasswordDetailPageState();
}

class _PasswordDetailPageState extends State<PasswordDetailPage> {
  TextEditingController oldPassword = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  Widget MyTextField(
      {required InputDecoration decoration, required String hinttext}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextField(
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
          hintText: hinttext,
        ),
      ),
    );
  }

  GlobalKey<FormState> formKey = new GlobalKey();
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);
  ValueNotifier<bool> _toggle1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> _toggle2 = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Password Details',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(top: 30.h, left: 10.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           Navigator.pop(context);
                      //         },
                      //         child: Icon(
                      //           Icons.arrow_back_ios_outlined,
                      //           size: 15.sp,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       SizedBox(width: 5.w),
                      //       Text(
                      //         'Password Details',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w600, fontSize: 17.sp),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text('Old Password',
                            style: TextStyle(fontSize: 15.sp)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: ValueListenableBuilder(
                            valueListenable: _toggle,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: oldPassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please fillout this field';
                                  }
                                },
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      _toggle.value = !_toggle.value;
                                    },
                                    child: Icon(_toggle.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility),
                                  ),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Color(0xffACA9A9),
                                  ),
                                  fillColor: Color(0xffEEEEEE),
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
                                  hintText: 'Enter old Password',
                                ),
                                obscureText: _toggle.value,
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text(
                          'New Password',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: ValueListenableBuilder(
                            valueListenable: _toggle1,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: newPassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please fillout this field';
                                  }
                                },
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      _toggle1.value = !_toggle1.value;
                                    },
                                    child: Icon(_toggle1.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility),
                                  ),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Color(0xffACA9A9),
                                  ),
                                  fillColor: Color(0xffEEEEEE),
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
                                  hintText: 'Enter New Password',
                                ),
                                obscureText: _toggle1.value,
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text('Confirm Password',
                            style: TextStyle(fontSize: 15.sp)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: ValueListenableBuilder(
                            valueListenable: _toggle2,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: confirmPassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please fillout this field';
                                  } else if (value != newPassword.text) {
                                    return "Password doen't match";
                                  }
                                },
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      _toggle2.value = !_toggle2.value;
                                    },
                                    child: Icon(_toggle2.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility),
                                  ),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Color(0xffACA9A9),
                                  ),
                                  fillColor: Color(0xffEEEEEE),
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
                                  hintText: 'Confirm Password',
                                ),
                                obscureText: _toggle2.value,
                              );
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
                    child: GestureDetector(
                      onTap: () async {
                        AuthController controller = new AuthController();
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
                          var data = await controller.UpdatePassword(
                              context: context,
                              newPassword: newPassword.text,
                              oldPassword: oldPassword.text,
                              scaffoldKey: scaffoldKey);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('${data}')));
                          if (data == 'Password updated Successfuly') {
                            newPassword.dispose();
                            oldPassword.dispose();
                            confirmPassword.dispose();
                            Navigator.of(context).pop();
                          } else {
                            newPassword.dispose();
                            oldPassword.dispose();
                            confirmPassword.dispose();
                            Navigator.of(context).pop();
                          }
                        }

                        //
                      },
                      child: Container(
                        height: 60.h,
                        width: 600.w,
                        decoration: BoxDecoration(
                          color: newPassword.text != "" &&
                                  oldPassword.text != "" &&
                                  confirmPassword.text != ""
                              ? Colors.pink
                              : const Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                color: newPassword.text != "" &&
                                        oldPassword.text != "" &&
                                        confirmPassword.text != ""
                                    ? Colors.white
                                    : Colors.black),
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
