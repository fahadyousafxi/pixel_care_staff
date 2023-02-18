import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import 'BankDetails.dart';
import 'Model/ApplicationFormModel.dart';
import 'Next_of_Kin.dart';

class AddressPage extends StatefulWidget {
 AddressPage({required this.model});
 ApplicationFormModel model=new ApplicationFormModel();
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  Widget MyTextField(
      {required InputDecoration decoration, required String hinttext,controller,keyboardType}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        keyboardType: keyboardType??TextInputType.text,
        controller: controller,
        validator: (value){
          if(value!.isEmpty){
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

  GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey();

  GlobalKey<FormState> formKey=new GlobalKey();

  TextEditingController house=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController code=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,


      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40.h, left: 10.w),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Address of last five years if changed',
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
                          color: Colors.blue.shade200,
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
                      ),        Spacer(),
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),


                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),

                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),

                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),

                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),                      Spacer(),

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
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('House Number'),
                    ),
                    MyTextField(
                      controller: house,
                      decoration: InputDecoration(),
                      hinttext: 'Enter house number',
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Postal Code'),
                    ),
                    MyTextField(
                      controller: code,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(),
                      hinttext: 'Enter postal code',
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Address'),
                    ),
                    MyTextField(
                      controller: address,
                      decoration: InputDecoration(),
                      hinttext: 'Enter address',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.3),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text('Previous',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.grey.shade500),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if(formKey.currentState!.validate()){
                                Address addressmodel=new Address();
                                addressmodel.houseNumber=house.text;
                                addressmodel.postalCode=code.text;
                                addressmodel.address=address.text;
                                widget.model.address=addressmodel;
                                print(widget.model.toJson());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NextOfKinPage(model:widget.model)),
                                );}
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.grey.shade500),),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
