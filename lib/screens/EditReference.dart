import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/AuthController.dart';

class EditReferencePage extends StatefulWidget {
  EditReferencePage(
      {Key? key,
      this.relation,
      this.email,
      this.phoneNumber,
      this.address,
      this.organization,
      this.jobTitle,
      this.name,
      this.id})
      : super(key: key);
  var email;
  var name;
  var address;
  var jobTitle;
  var organization;
  var phoneNumber;
  var relation;
  var id;
  @override
  State<EditReferencePage> createState() => EditReferencePageState(
      id: id,
      email: email,
      name: name,
      address: address,
      jobTitle: jobTitle,
      organization: organization,
      phoneNumber: phoneNumber,
      relation: relation);
}

class EditReferencePageState extends State<EditReferencePage> {
  EditReferencePageState(
      {this.name,
      this.jobTitle,
      this.organization,
      this.address,
      this.phoneNumber,
      this.email,
      this.relation,
      this.id});
  var id;

  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      onChanged}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        onChanged: onChanged ?? (value) {},
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
  var email;
  var name;
  var address;
  var jobTitle;
  var organization;
  var phoneNumber;
  var relation;
  TextEditingController namecont = TextEditingController();
  TextEditingController jobcont = TextEditingController();
  TextEditingController orgcont = TextEditingController();
  TextEditingController addresscont = TextEditingController();
  TextEditingController phonecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController knowscont = TextEditingController();

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
                  padding: EdgeInsets.only(top: 40.h, left: 10.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/splashlogo.svg',
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Text(
                        'Edit Reference',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Name'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: namecont,
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        textCapitalization: TextCapitalization.words,
                        validator: (String? value) {
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
                          hintText: '$name',
                        ),
                      ),
                    ),

                    // MyTextField(
                    //   onChanged: (value){
                    //     name=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$name',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Job Title'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: jobcont,
                        onChanged: (value) {
                          jobTitle = value;
                          setState(() {});
                        },
                        textCapitalization: TextCapitalization.words,
                        validator: (String? value) {
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
                          hintText: '$jobTitle',
                        ),
                      ),
                    ),

                    // MyTextField(
                    //   onChanged: (value){
                    //     jobTitle=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$jobTitle',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Organization'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: orgcont,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        onChanged: (value) {
                          organization = value;
                          setState(() {});
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
                          hintText: '$organization',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value){
                    //     organization=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$organization',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Address'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: addresscont,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        onChanged: (value) {
                          address = value;
                          setState(() {});
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
                          hintText: '$address',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value){
                    //     address=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$address',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Phone Number'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: phonecont,
                        onChanged: (value) {
                          phoneNumber = value;
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        keyboardType: TextInputType.phone,
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
                          hintText: '$phoneNumber',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value){
                    //     phoneNumber=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$phoneNumber',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Email'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: emailcont,
                        onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
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
                          hintText: '$email',
                        ),
                      ),
                    ),
                    // MyTextField(
                    //   onChanged: (value){
                    //     email=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$email',
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('How this person knows you?'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: knowscont,
                        onChanged: (value) {
                          relation = value;
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
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
                          hintText: '$relation',
                        ),
                      ),
                    ),

                    // MyTextField(
                    //   onChanged: (value){
                    //     relation=value;
                    //   },
                    //   decoration: InputDecoration(),
                    //   hinttext: '$relation',
                    // ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Container(
                                        child: Center(
                                            child:
                                                new CircularProgressIndicator(
                                      color: Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await AuthController().EditReference(
                                    id: id,
                                    relation: relation,
                                    phoneNumber: phoneNumber,
                                    organization: organization,
                                    jobTitle: jobTitle,
                                    address: address,
                                    name: name,
                                    email: email);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  '$data',
                                  style: TextStyle(color: Colors.white),
                                )));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                color: namecont.text != "" &&
                                        jobcont.text != "" &&
                                        orgcont.text != "" &&
                                        addresscont.text != "" &&
                                        phonecont.text != "" &&
                                        emailcont.text != "" &&
                                        knowscont.text != ""
                                    ? Colors.pink
                                    : Color(0xfffaeaea),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('Submit',
                                    style: TextStyle(
                                        color: namecont.text != "" &&
                                                jobcont.text != "" &&
                                                orgcont.text != "" &&
                                                addresscont.text != "" &&
                                                phonecont.text != "" &&
                                                emailcont.text != "" &&
                                                knowscont.text != ""
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                        ],
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
