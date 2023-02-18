// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
//
// import 'Covid_19_Questions.dart';
// import 'Model/ApplicationFormModel.dart';
// import 'Next_of_Kin.dart';
//
// class EmploymentPrevPage extends StatefulWidget {
//   EmploymentPrevPage({required this.model});
//   ApplicationFormModel model=new ApplicationFormModel();
//
//   @override
//   State<EmploymentPrevPage> createState() => _EmploymentPrevPageState();
// }
//
// class _EmploymentPrevPageState extends State<EmploymentPrevPage> {
//   Widget MyTextField(
//       {required InputDecoration decoration,
//         required String hinttext,
//         controller}) {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//       child: TextFormField(
//         controller: controller,
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
//
//   GlobalKey<FormState> formKey = new GlobalKey();
//
//   TextEditingController name = new TextEditingController();
//   TextEditingController position = new TextEditingController();
//   TextEditingController reason = new TextEditingController();
//   TextEditingController salery = new TextEditingController();
//   TextEditingController desc = new TextEditingController();
//
//   List title = ['Previous', 'Present'];
//   var titleSelected = 'Previous';
//   var month1 = 'September';
//   var day1 = '1';
//   var year1 = '1995';
//   var month = 'September';
//   var day = '1';
//   var year = '2022';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key:formKey,
//             child: Container(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(top: 40.h, left: 10.w),
//                     child: Column(
//                       //mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Employment',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w900,
//                             fontSize: 25.sp,
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           'Employment details of last 3 years',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     height: 30.h,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),
//                         Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),        Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),               Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),                 Spacer(),
//
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),                 Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),               Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),                   Spacer(),
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),                    Spacer(),
//
//                         Container(
//                           height: 20.h,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.red,
//                           ),
//                           child: Icon(
//                             Icons.done,
//                             color: Colors.white,
//                             size: 20.sp,
//                           ),
//                         ),                     Spacer(),
//                         Container(
//                           height: 10.h,
//                           width: 10.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blue.shade200,
//                           ),
//                         ),                      Spacer(),
//
//                         Container(
//                           height: 10.h,
//                           width: 10.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blue.shade200,
//                           ),
//                         ),                      Spacer(),
//
//                         Container(
//                           height: 10.h,
//                           width: 10.w,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blue.shade200,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Type'),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: DropdownButtonFormField<String>(
//                           value: titleSelected,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please select from this field';
//                             }
//                           },
//                           items: title
//                               .map((e) => DropdownMenuItem<String>(
//                             child: Text(e),
//                             value: e,
//                           ))
//                               .toList(),
//                           onChanged: (String? value) {
//                             titleSelected = value!;
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 5),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.sp,
//                               color: Color(0xffACA9A9),
//                             ),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Date Started'),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 50.h,
//                               width: 90.w,
//                               child: DropdownButtonFormField<String>(
//                                 value: day1,
//                                 items: List.generate(
//                                     31,
//                                         (index) => DropdownMenuItem(
//                                       child: Text('${index + 1}'),
//                                       value: '${index + 1}',
//                                     )),
//                                 onChanged: (String? value) {
//                                   day1 = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Container(
//                               height: 50.h,
//                               width: 140.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField<String>(
//                                 value: month1,
//                                 items: [
//                                   'January',
//                                   'February',
//                                   'March',
//                                   'April',
//                                   'May',
//                                   'June',
//                                   'July',
//                                   'August',
//                                   'September',
//                                   'October',
//                                   'November',
//                                   'December'
//                                 ]
//                                     .map((e) => DropdownMenuItem(
//                                   child: Text('${e}'),
//                                   value: e,
//                                 ))
//                                     .toList(),
//                                 onChanged: (String? value) {
//                                   month1 = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Container(
//                               height: 50.h,
//                               width: 100.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField<String>(
//                                 value: year1,
//                                 items: List.generate(
//                                     DateTime.now().year,
//                                         (index) => DropdownMenuItem(
//                                       child: Text(
//                                           '${DateTime.now().year - index}'),
//                                       value:
//                                       '${DateTime.now().year - index}',
//                                     )),
//                                 onChanged: (String? value) {
//                                   year1 = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Name of Employer'),
//                       ),
//                       SizedBox(height: 10.h),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: TextFormField(
//                           controller: name,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please fill out this field';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(18),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.sp,
//                               color: Color(0xffACA9A9),
//                             ),
//                             fillColor: Color(0xfff0f0f0),
//                             filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             hintText: 'Enter name',
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Position Held'),
//                       ),
//                       SizedBox(height: 10.h),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: TextFormField(
//                           controller: position,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please fill out this field';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(18),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.sp,
//                               color: Color(0xffACA9A9),
//                             ),
//                             fillColor: Color(0xfff0f0f0),
//                             filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             hintText: 'Enter code number',
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Reason for leaving'),
//                       ),
//                       SizedBox(height: 10.h),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: TextFormField(
//                           controller: reason,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please fill out this field';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(18),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.sp,
//                               color: Color(0xffACA9A9),
//                             ),
//                             fillColor: Color(0xfff0f0f0),
//                             filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             hintText: 'Enter reason',
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Salary on Leaving Post'),
//                       ),
//                       SizedBox(height: 10.h),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: TextFormField(
//                           controller: salery,
//                           keyboardType: TextInputType.number,
//
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please fill out this field';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(18),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15.sp,
//                               color: Color(0xffACA9A9),
//                             ),
//                             fillColor: Color(0xfff0f0f0),
//                             filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             hintText: 'Enter salary',
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Notice period'),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 50.h,
//                               width: 90.w,
//                               child: DropdownButtonFormField<String>(
//                                 value: day,
//                                 items: List.generate(
//                                     31,
//                                         (index) => DropdownMenuItem(
//                                       child: Text('${index + 1}'),
//                                       value: '${index + 1}',
//                                     )),
//                                 onChanged: (String? value) {
//                                   day = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Container(
//                               height: 50.h,
//                               width: 140.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField<String>(
//                                 value: month,
//                                 items: [
//                                   'January',
//                                   'February',
//                                   'March',
//                                   'April',
//                                   'May',
//                                   'June',
//                                   'July',
//                                   'August',
//                                   'September',
//                                   'October',
//                                   'November',
//                                   'December'
//                                 ]
//                                     .map((e) => DropdownMenuItem(
//                                   child: Text('${e}'),
//                                   value: e,
//                                 ))
//                                     .toList(),
//                                 onChanged: (String? value) {
//                                   month = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Container(
//                               height: 50.h,
//                               width: 100.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField<String>(
//                                 value: year,
//                                 items: List.generate(
//                                     DateTime.now().year,
//                                         (index) => DropdownMenuItem(
//                                       child: Text(
//                                           '${DateTime.now().year - index}'),
//                                       value:
//                                       '${DateTime.now().year - index}',
//                                     )),
//                                 onChanged: (String? value) {
//                                   year = value!;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   hintStyle: GoogleFonts.dmSans(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15.sp,
//                                     color: Color(0xffACA9A9),
//                                   ),
//                                   fillColor: Colors.grey.shade200,
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Brief Description of duties'),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                         child: Container(
//                           padding: EdgeInsets.only(left: 10.w, top: 10.h),
//                           height: 150.h,
//                           width: 700.w,
//                           color: Color(0xfff0f0f0),
//                           child: TextFormField(
//                             controller: desc,
//                             maxLines: 100,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please fill out this field';
//                               }
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.all(18),
//                               hintStyle: GoogleFonts.dmSans(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15.sp,
//                                 color: Color(0xffACA9A9),
//                               ),
//                               fillColor: Color(0xfff0f0f0),
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8),
//                                 ),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8),
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8),
//                                 ),
//                               ),
//                               hintText: 'Enter description',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.h),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: InkWell(
//                     onTap:(){
//                   Navigator.of(context).pop();
//                   },child:Container(
//                             height: 60.h,
//                             width: 300.w,
//                             decoration: BoxDecoration(
//                               color: Colors.blue.shade100,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text('Previous',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.grey.shade500),),
//                             ),
//                           ),
//                         )),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               if (month == 'January') {
//                                 month = '01';
//                               } else if (month == 'February') {
//                                 month = '02';
//                               } else if (month == 'March') {
//                                 month = '03';
//                               } else if (month == 'April') {
//                                 month = '04';
//                               } else if (month == 'May') {
//                                 month = '05';
//                               } else if (month == 'June') {
//                                 month = '06';
//                               } else if (month == 'July') {
//                                 month = '07';
//                               } else if (month == 'August') {
//                                 month = '08';
//                               } else if (month == 'September') {
//                                 month = '09';
//                               } else if (month == 'October') {
//                                 month = '10';
//                               } else if (month == 'November') {
//                                 month = '11';
//                               } else if (month == 'December') {
//                                 month = '12';
//                               }
//
//                               //
//
//                               if (month1 == 'January') {
//                                 month1 = '01';
//                               } else if (month1 == 'February') {
//                                 month1 = '02';
//                               } else if (month1 == 'March') {
//                                 month1 = '03';
//                               } else if (month1 == 'April') {
//                                 month1 = '04';
//                               } else if (month1 == 'May') {
//                                 month1 = '05';
//                               } else if (month1 == 'June') {
//                                 month1 = '06';
//                               } else if (month1 == 'July') {
//                                 month1 = '07';
//                               } else if (month1 == 'August') {
//                                 month1 = '08';
//                               } else if (month1 == 'September') {
//                                 month1 = '09';
//                               } else if (month1 == 'October') {
//                                 month1 = '10';
//                               } else if (month1 == 'November') {
//                                 month1 = '11';
//                               } else if (month1 == 'December') {
//                                 month1 = '12';
//                               }
//                               if (formKey.currentState!.validate()) {
//                                 Employment details = new Employment();
//                                 details.type = titleSelected;
//                                 details.nameOfEmployer = name.text;
//                                 details.positionHeld = position.text;
//                                 details.dateStarted =
//                                     year1 + '-' + month1 + '-' + day1;
//                                 details.noticePeriod =
//                                     year + '-' + month + '-' + day;
//                                 details.reasonForLeaving = reason.text;
//                                 details.salaryOnLeavingPost = salery.text;
//                                 details.dutiesDescription = desc.text;
//                                 widget.model.employmentDetailsOfLast3Years=details;
//                                 print(widget.model.toJson());
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => CovidPage(model:widget.model)),
//                               );
//                             }
//                               },
//                             child: Container(
//                               height: 60.h,
//                               width: 300.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xfffaeaea),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Center(
//                                 child: Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.grey.shade500),),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
