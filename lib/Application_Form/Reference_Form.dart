

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import '../Controller/AuthController.dart';
import 'package:get/get.dart';

import '../screens/refrenceView.dart';

class ReferencePage extends StatefulWidget {
  const ReferencePage({Key? key}) : super(key: key);

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {
  Widget MyTextField(
      {required InputDecoration decoration,
        required String hinttext,
        onChanged}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        onChanged: onChanged ?? (value) {},
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
  var email = ''.obs;
  var name = ''.obs;
  var address = ''.obs;
  var jobTitle = ''.obs;
  var organization = ''.obs;
  var phoneNumber = ''.obs;
  var relation = ''.obs;
  var validated = false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => RefrenceView(),
                          ));

                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 15.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Add Reference',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 40.h, left: 10.w),
                //   child: Column(
                //     children: [
                //       SvgPicture.asset(
                //         'assets/images/splashlogo.svg',
                //         height: 100.h,
                //         width: 100.w,
                //         fit: BoxFit.cover,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(left: 20.w),
                    //   child: Text(
                    //     'Add Reference',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w900,
                    //       fontSize: 28.sp,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Name'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          name.value = value;
                        },
                        textCapitalization: TextCapitalization.words,
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
                          hintText: "Enter name",
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     name = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter name',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Job Title'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          jobTitle.value = value;
                        },
                        textCapitalization: TextCapitalization.words,
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
                          hintText: 'Enter job title',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     jobTitle = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter job title',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Organization'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          organization.value = value;
                        },
                        textCapitalization: TextCapitalization.words,
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
                          hintText: 'Enter organization',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     organization = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter organization',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Address'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          address.value = value;
                        },
                        textCapitalization: TextCapitalization.words,
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
                    // MyTextField(
                    //   onChanged: (value) {
                    //     address = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter address',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Phone Number'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          phoneNumber.value = value;
                        },
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
                          hintText: 'Enter phone number',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     phoneNumber = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter phone number',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Email'),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          email.value = value;
                        },
                        validator: (value) {
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
                          hintText: 'Enter email',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     email = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter email',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('How this person knows you?'),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        onChanged: (value) {
                          relation.value = value;
                        },
                        textCapitalization: TextCapitalization.words,
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
                          hintText: 'Enter relation',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value) {
                    //     relation = value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: 'Enter relation',
                    // ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
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

                            var data = await AuthController().UpdateReference(
                                relation: relation.value,
                                phoneNumber: phoneNumber.value,
                                organization: organization.value,
                                jobTitle: jobTitle.value,
                                address: address.value,
                                name: name.value,
                                email: email.value);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  '$data',
                                  style: TextStyle(color: Colors.white),
                                )));
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => RefrenceView()));
                          }
                        },
                        child: Obx(() => Container(
                          height: 60.h,
                          width: 600.w,
                          decoration: BoxDecoration(
                            color: name.value != '' &&
                                address.value != '' &&
                                jobTitle.value != '' &&
                                organization.value != '' &&
                                phoneNumber.value != '' &&
                                relation.value != ''
                                ? Colors.pink
                                : Color(0xfffaeaea),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Obx(() => Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: name.value != '' &&
                                      address.value != '' &&
                                      jobTitle.value != '' &&
                                      organization.value != '' &&
                                      phoneNumber.value != '' &&
                                      relation.value != ''
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pixel_app/Application_Form/refrence.dart';
// import 'package:pixel_app/Model/ReferenceModel.dart';
// import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
// import '../Controller/AuthController.dart';
// import 'package:get/get.dart';
//
// import '../screens/refrenceView.dart';
// import 'Model/ApplicationFormModel.dart';
//
// class ReferencePage extends StatefulWidget {
//   const ReferencePage({Key? key}) : super(key: key);
//
//   @override
//   State<ReferencePage> createState() => _ReferencePageState();
// }
//
// class _ReferencePageState extends State<ReferencePage> {
//   Widget MyTextField(
//       {required InputDecoration decoration,
//       required String hinttext,
//       onChanged}) {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//       child: TextFormField(
//         onChanged: onChanged ?? (value) {},
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please fill out this field';
//           }
//         },
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(18),
//           hintStyle: GoogleFonts.dmSans(
//             fontWeight: FontWeight.w500,
//             fontSize: 15.sp,
//             color: Color(0xffACA9A9),
//           ),
//           fillColor: Color(0xfff0f0f0),
//           filled: true,
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(
//               Radius.circular(8),
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(
//               Radius.circular(8),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.all(
//               Radius.circular(8),
//             ),
//           ),
//           hintText: hinttext,
//         ),
//       ),
//     );
//   }
//
//   GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
//   GlobalKey<FormState> formKey = new GlobalKey();
//   var email = ''.obs;
//   var name = ''.obs;
//   var address = ''.obs;
//   var jobTitle = ''.obs;
//   var organization = ''.obs;
//   var phoneNumber = ''.obs;
//   var relation = ''.obs;
//   var validated = false.obs;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.grey.shade50,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 30.h, left: 10.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                             Navigator.of(context)
//                                 .pushReplacement(MaterialPageRoute(
//                               builder: (context) => RefrenceView(),
//                             ));
//
//                         },
//                         child: Icon(
//                           Icons.arrow_back_ios_outlined,
//                           size: 15.sp,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(width: 5.w),
//                       Text(
//                         'Add Reference',
//                         style: TextStyle(
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Container(
//                 //   padding: EdgeInsets.only(top: 40.h, left: 10.w),
//                 //   child: Column(
//                 //     children: [
//                 //       SvgPicture.asset(
//                 //         'assets/images/splashlogo.svg',
//                 //         height: 100.h,
//                 //         width: 100.w,
//                 //         fit: BoxFit.cover,
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 SizedBox(height: 20.h),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     // Container(
//                     //   margin: EdgeInsets.only(left: 20.w),
//                     //   child: Text(
//                     //     'Add Reference',
//                     //     style: TextStyle(
//                     //       fontWeight: FontWeight.w900,
//                     //       fontSize: 28.sp,
//                     //     ),
//                     //   ),
//                     // ),
//                     SizedBox(height: 20.h),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Name'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           name.value = value;
//                         },
//                         textCapitalization: TextCapitalization.words,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: "Enter name",
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     name = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter name',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Job Title'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           jobTitle.value = value;
//                         },
//                         textCapitalization: TextCapitalization.words,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter job title',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     jobTitle = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter job title',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Organization'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           organization.value = value;
//                         },
//                         textCapitalization: TextCapitalization.words,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter organization',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     organization = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter organization',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Address'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           address.value = value;
//                         },
//                         textCapitalization: TextCapitalization.words,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter address',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     address = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter address',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Phone Number'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           phoneNumber.value = value;
//                         },
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter phone number',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     phoneNumber = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter phone number',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('Email'),
//                     ),
//
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           email.value = value;
//                         },
//                         validator: (value) {
//                           final bool isValid =
//                               EmailValidator.validate(value.toString());
//
//                           if (!isValid) {
//                             return 'Invalid Email';
//                           }
//
//                           if (value!.isEmpty) {
//                             return 'Please fillout this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter email',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     email = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter email',
//                     // ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                       child: Text('How this person knows you?'),
//                     ),
//
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           relation.value = value;
//                         },
//                         textCapitalization: TextCapitalization.words,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(18),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.sp,
//                             color: Color(0xffACA9A9),
//                           ),
//                           fillColor: Color(0xfff0f0f0),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter relation',
//                         ),
//                       ),
//                     ),
//                     // MyTextField(
//                     //   onChanged: (value) {
//                     //     relation = value;
//                     //   },
//                     //   decoration: InputDecoration(),
//                     //   hinttext: 'Enter relation',
//                     // ),
//                     SizedBox(height: 30.h),
//                     Padding(
//                       padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                       child: GestureDetector(
//                         onTap: () async {
//                           if (formKey.currentState!.validate()) {
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (BuildContext context) {
//                                 return Container(
//                                     child: Center(
//                                         child: new CircularProgressIndicator(
//                                   color: Color(0xfffaeaea),
//                                 )));
//                               },
//                             );
//
//                             var data = await AuthController().UpdateReference(
//                                 relation: relation.value,
//                                 phoneNumber: phoneNumber.value,
//                                 organization: organization.value,
//                                 jobTitle: jobTitle.value,
//                                 address: address.value,
//                                 name: name.value,
//                                 email: email.value);
//                             // my changes
//                             ApplicationFormModel model = new ApplicationFormModel();
//
//
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                 content: Text(
//                               'sdfsdfasdff',
//                               style: TextStyle(color: Colors.white),
//                             )));
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) => refrenceform(model: model,)));
//                                     // builder: (context) => RefrenceView()));
//
//                           }
//                         },
//                         child: Obx(() => Container(
//                               height: 60.h,
//                               width: 600.w,
//                               decoration: BoxDecoration(
//                                 color: name.value != '' &&
//                                         address.value != '' &&
//                                         jobTitle.value != '' &&
//                                         organization.value != '' &&
//                                         phoneNumber.value != '' &&
//                                         relation.value != ''
//                                     ? Colors.pink
//                                     : Color(0xfffaeaea),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Center(
//                                 child: Obx(() => Text(
//                                       'Submit',
//                                       style: TextStyle(
//                                           fontSize: 15.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: name.value != '' &&
//                                                   address.value != '' &&
//                                                   jobTitle.value != '' &&
//                                                   organization.value != '' &&
//                                                   phoneNumber.value != '' &&
//                                                   relation.value != ''
//                                               ? Colors.white
//                                               : Colors.black),
//                                     )),
//                               ),
//                             )),
//                       ),
//                     ),
//                     SizedBox(height: 50.h),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
