import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import 'BankDetails.dart';
import 'DBS_Details.dart';
import 'Model/ApplicationFormModel.dart';

class CovidPage extends StatefulWidget {
 CovidPage({required this.model});
 ApplicationFormModel model=new ApplicationFormModel();

 @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  List title=['Yes','No'];
  var title1Selected='Yes';
  var title2Selected='Yes';
  var title3Selected='Yes';
  var title4Selected='Yes';
  var month='September';
  var day='1';
  var year='2022';
  var dob;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,


      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40.h, left: 10.w),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'COVID 19',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Some information regarding COVID 19',
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
                      ),        Spacer(),
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
                      ),               Spacer(),
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
                      ),                 Spacer(),

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
                      ),                 Spacer(),
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
                      ),               Spacer(),
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
                      ),                   Spacer(),
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
                      ),                    Spacer(),

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
                      ),                     Spacer(),
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
                      ),                       Spacer(),

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
                      child: Text('Date of last negative COVID-19 test'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                            width: 90.w,
                            child:
                            DropdownButtonFormField<String>(
                              value: day,
                              items: List.generate(31, (index) => DropdownMenuItem(child: Text('${index+1}'),value: '${index+1}',)), onChanged:(String ?value){
                              day=value!;
                            }, decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                            ),),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 50.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:DropdownButtonFormField<String>(
                              value:month,
                              items: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].map((e) =>DropdownMenuItem(child: Text('${e}'),value:e,)).toList(), onChanged:(String ?value){
                              month=value!;
                            }, decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                            ),),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:DropdownButtonFormField<String>(
                              value: year,
                              items: List.generate(DateTime.now().year, (index) => DropdownMenuItem(child: Text('${DateTime.now().year-index}'),value: '${DateTime.now().year-index}',)), onChanged:(String ?value){
                              year=value!;
                            }, decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Have you ever had tuberculosis(TB) vaccine'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.w, right: 20.w),
                      child:
                      DropdownButtonFormField<String>(
                        value: title1Selected,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please select from this field';
                          }
                        },                                    items: title.map((e) => DropdownMenuItem<String>(child: Text(e),value:e,)).toList(), onChanged:(String ?value){
                        title1Selected=value!;
                      }, decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                      ),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Have you worked in a care home before?'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.w, right: 20.w),
                      child:
                      DropdownButtonFormField<String>(
                        value: title2Selected,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please select from this field';
                          }
                        },                                    items: title.map((e) => DropdownMenuItem<String>(child: Text(e),value:e,)).toList(), onChanged:(String ?value){
                        title2Selected=value!;
                      }, decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                      ),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Have you worked in demantia care before?'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.w, right: 20.w),
                      child:
                      DropdownButtonFormField<String>(
                        value: title3Selected,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please select from this field';
                          }
                        },                                    items: title.map((e) => DropdownMenuItem<String>(child: Text(e),value:e,)).toList(), onChanged:(String ?value){
                        title3Selected=value!;
                      }, decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                      ),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Text('Do you have a driving license?'),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.w, right: 20.w),
                      child:
                      DropdownButtonFormField<String>(
                        value: title4Selected,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please select from this field';
                          }
                        },                                    items: title.map((e) => DropdownMenuItem<String>(child: Text(e),value:e,)).toList(), onChanged:(String ?value){
                        title4Selected=value!;
                      }, decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                      ),),
                    ),

                    SizedBox(height: 60.h),
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
                                if(month =='January'){
                                  month = '01';
                                }else  if(month =='February'){
                                  month = '02';
                                }else  if( month =='March'){
                                  month = '03';
                                }else  if(month =='April'){
                                  month = '04';
                                }else  if(month =='May'){
                                  month = '05';
                                }else  if(month =='June'){
                                  month = '06';
                                }else  if(month =='July'){
                                  month = '07';
                                }else  if(month =='August'){
                                  month = '08';
                                }else  if(month =='September'){
                                  month = '09';
                                }else  if(month =='October'){
                                  month = '10';
                                }else  if(month =='November'){
                                  month = '11';
                                }else  if(month =='December'){
                                  month = '12';
                                }
                                Covid19 detail=new Covid19();
                                detail.covid19Test=year+'-'+month+'-'+day;
                                detail.tuberculosisVaccine=title1Selected;
                                detail.careHomeBefore=title2Selected;
                                detail.demantiaCareBefore=title3Selected;
                                detail.drivingLicense=title4Selected;
                                widget.model.covid19=detail;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BankDetailPage(model:widget.model),
                                  ),
                                );
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
