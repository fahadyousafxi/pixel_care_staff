import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = new TextEditingController();
  GlobalKey<FormState> formkey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Enter Your Account Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.w),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: email,
                        validator: (String? value) {
                          final bool isValid =
                              EmailValidator.validate(value.toString());

                          if (!isValid) {
                            return 'Invalid Email';
                          }

                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        decoration: InputDecoration(
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
                          hintText: 'Enter email',
                        ),
                      ),
                    ),
                    SizedBox(height: 22.w),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: InkWell(
                        onTap: () async {
                          AuthController controller = new AuthController();
                          if (formkey.currentState!.validate()) {
                            uemail = email.text;
                            controller.ForgotPassword(email.text, context);

                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (BuildContext context) {
                            //     return Container(
                            //         child: Center(
                            //             child: new CircularProgressIndicator(
                            //       color: Color(0xfffaeaea),
                            //     )));
                            //   },
                            // );
                          }
                          //
                        },
                        child: Container(
                          height: 60.h,
                          width: 600.w,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Send',
                              style: TextStyle(fontSize: 18.sp, color: Colors.white),
                            ),
                          ),
                        ),
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

  Color myColor(bool? validate){
    Color? myGreen = Colors.green;
    Color fill = Colors.red;
    // Color fill = Color(0xfffaeaea);
    setState(() {
      validate! ? myGreen : myGreen = Colors.black;
      // formkey.currentState!.validate() ? myGreen : myGreen = Colors.black;
    });

    return myGreen!;
  }
}
