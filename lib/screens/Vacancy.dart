//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pixel_app/Model/VacancyModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
//
// import '../Controller/VacancyController.dart';
//
// class VacancyPage extends StatefulWidget {
//   const VacancyPage({Key? key}) : super(key: key);
//
//   @override
//   State<VacancyPage> createState() => _VacancyPageState();
// }
//
// class _VacancyPageState extends State<VacancyPage> {
//   int index = 0;
//   Future<vacancyModel>?allVacancies;
//   Future<vacancyModel>?relevantVacancies;
//   List<String>? data=['NoId'];
//   @override
//   void initState() {
//     GetData();
//     // TODO: implement initState
//     super.initState();
//   }
//   GetData()async{
//     allVacancies=VacancyController().GetAll();
//     relevantVacancies=VacancyController().GetRelevant();
//   }
//   getApplied()async{
//     SharedPreferences pref=await SharedPreferences.getInstance();
//     data = await pref.getStringList('Vacancy');
//     if(data==null){
//       data=['No data'];
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     getApplied();
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             //height: 844.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 30.h, left: 10.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Icon(
//                               Icons.arrow_back_ios_outlined,
//                               size: 20.sp,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(width: 5.w),
//                           Text(
//                             'Vacancies',
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
//                       child: Container(
//                         height: 60.h,
//                         width: 700.w,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     index = 0;
//                                   });
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: index==0?Color(0xfffaeaea):Colors.grey.shade100,
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey.shade400,
//                                           spreadRadius: 1,
//                                           blurRadius: 10)
//                                     ],
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(6),
//                                       bottomLeft: Radius.circular(6),
//                                     ),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'All',
//                                       style: TextStyle(
//                                           color: Colors.black87,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.sp),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     index = 1;
//                                   });
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: index==1?Color(0xfffaeaea):Colors.grey.shade100,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.shade400,
//                                         spreadRadius: 1,
//                                         blurRadius: 10,
//                                       )
//                                     ],
//                                     borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(6),
//                                       bottomRight: Radius.circular(6),
//                                     ),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Relevant',
//                                       style: TextStyle(
//                                           color: Colors.grey.shade600,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.sp),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Visibility(
//                     //   visible: index != 1,
//                     //   child: Column(
//                     //     children: [
//                     //       Padding(
//                     //         padding: EdgeInsets.only(
//                     //             left: 20.w, right: 20.w, top: 20.h),
//                     //         child: Container(
//                     //           padding: EdgeInsets.only(
//                     //               left: 10.w, right: 10.w, top: 10.h),
//                     //           height: 90.h,
//                     //           width: 700.w,
//                     //           decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(6),
//                     //             color: Colors.white,
//                     //           ),
//                     //           child: Row(
//                     //             children: [
//                     //               Column(
//                     //                 children: [
//                     //                   Icon(
//                     //                     Icons.calendar_today,
//                     //                     size: 40.sp,
//                     //                     color: Color(0xff687bb9),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //               Column(
//                     //                 crossAxisAlignment:
//                     //                 CrossAxisAlignment.start,
//                     //                 children: [
//                     //                   Text('Cardinal Heenan House'),
//                     //                   Text(
//                     //                     'Nurse',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                   Text(
//                     //                     'Mar 01',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               Spacer(),
//                     //               // SizedBox(width: 20.w),
//                     //               Column(
//                     //                 crossAxisAlignment: CrossAxisAlignment.end,
//                     //                 children: [
//                     //                   Container(
//                     //                     height: 25.h,
//                     //                     width: 25.w,
//                     //                     decoration: BoxDecoration(
//                     //                       shape: BoxShape.circle,
//                     //                       color: Colors.redAccent.shade100,
//                     //                     ),
//                     //                     child: Center(
//                     //                       child: Text(
//                     //                         '-',
//                     //                         style: TextStyle(
//                     //                           fontSize: 20.sp,
//                     //                           color: Colors.white,
//                     //                           fontWeight: FontWeight.w700,
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                   SizedBox(height: 25.h),
//                     //                   Text(
//                     //                     '10:00 - 01:00',
//                     //                     style: TextStyle(
//                     //                         color: Color(0xff687bb9),
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //             ],
//                     //           ),
//                     //         ),
//                     //       ),
//                     //       Padding(
//                     //         padding: EdgeInsets.only(
//                     //             left: 20.w, right: 20.w, top: 20.h),
//                     //         child: Container(
//                     //           padding: EdgeInsets.only(
//                     //               left: 10.w, right: 10.w, top: 10.h),
//                     //           height: 90.h,
//                     //           width: 700.w,
//                     //           decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(6),
//                     //             color: Colors.white,
//                     //           ),
//                     //           child: Row(
//                     //             children: [
//                     //               Column(
//                     //                 children: [
//                     //                   Icon(
//                     //                     Icons.calendar_today,
//                     //                     size: 40.sp,
//                     //                     color: Color(0xff687bb9),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //               Column(
//                     //                 crossAxisAlignment:
//                     //                 CrossAxisAlignment.start,
//                     //                 children: [
//                     //                   Text('Cardinal Heenan House'),
//                     //                   Text(
//                     //                     'Nurse',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                   Text(
//                     //                     'Mar 01',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               Spacer(),
//                     //               // SizedBox(width: 20.w),
//                     //               Column(
//                     //                 crossAxisAlignment: CrossAxisAlignment.end,
//                     //                 children: [
//                     //                   Container(
//                     //                     height: 25.h,
//                     //                     width: 25.w,
//                     //                     decoration: BoxDecoration(
//                     //                       shape: BoxShape.circle,
//                     //                       color: Colors.redAccent.shade100,
//                     //                     ),
//                     //                     child: Center(
//                     //                       child: Text(
//                     //                         '-',
//                     //                         style: TextStyle(
//                     //                           fontSize: 20.sp,
//                     //                           color: Colors.white,
//                     //                           fontWeight: FontWeight.w700,
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                   SizedBox(height: 25.h),
//                     //                   Text(
//                     //                     '10:00 - 01:00',
//                     //                     style: TextStyle(
//                     //                         color: Color(0xff687bb9),
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //             ],
//                     //           ),
//                     //         ),
//                     //       ),
//                     //       Padding(
//                     //         padding: EdgeInsets.only(
//                     //             left: 20.w, right: 20.w, top: 20.h),
//                     //         child: Container(
//                     //           padding: EdgeInsets.only(
//                     //               left: 10.w, right: 10.w, top: 10.h),
//                     //           height: 90.h,
//                     //           width: 700.w,
//                     //           decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(6),
//                     //             color: Colors.white,
//                     //           ),
//                     //           child: Row(
//                     //             children: [
//                     //               Column(
//                     //                 children: [
//                     //                   Icon(
//                     //                     Icons.calendar_today,
//                     //                     size: 40.sp,
//                     //                     color: Color(0xff687bb9),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //               Column(
//                     //                 crossAxisAlignment:
//                     //                 CrossAxisAlignment.start,
//                     //                 children: [
//                     //                   Text('Cardinal Heenan House'),
//                     //                   Text(
//                     //                     'Nurse',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                   Text(
//                     //                     'Mar 01',
//                     //                     style: TextStyle(
//                     //                         color: Colors.grey,
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               Spacer(),
//                     //               // SizedBox(width: 20.w),
//                     //               Column(
//                     //                 crossAxisAlignment: CrossAxisAlignment.end,
//                     //                 children: [
//                     //                   Container(
//                     //                     height: 25.h,
//                     //                     width: 25.w,
//                     //                     decoration: BoxDecoration(
//                     //                       shape: BoxShape.circle,
//                     //                       color: Colors.redAccent.shade100,
//                     //                     ),
//                     //                     child: Center(
//                     //                       child: Text(
//                     //                         '-',
//                     //                         style: TextStyle(
//                     //                           fontSize: 20.sp,
//                     //                           color: Colors.white,
//                     //                           fontWeight: FontWeight.w700,
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                   SizedBox(height: 25.h),
//                     //                   Text(
//                     //                     '10:00 - 01:00',
//                     //                     style: TextStyle(
//                     //                         color: Color(0xff687bb9),
//                     //                         fontSize: 17.sp),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //               SizedBox(width: 10.w),
//                     //             ],
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     Visibility(
//                       visible:  index==0,
//                       child: Column(
//                         children: [
//
//                           Container(
//                             height: MediaQuery.of(context).size.height*0.8,
//                             child: FutureBuilder<vacancyModel>(
//                                 future:allVacancies,
//                                 builder: (context, snapshot) {
//                                   if(snapshot.hasData) {
//                                     return ListView.builder(
//                                         itemCount: snapshot.data!.data!.length,
//                                         itemBuilder: (context, index) {
//                                           return Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 20.w,
//                                                 right: 20.w,
//                                                 top: 20.h),
//                                             child: Container(
//                                               width: 700.w,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   BorderRadius.circular(6),
//                                                   color: Colors.grey.shade100,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                         color: Colors
//                                                             .grey.shade400,
//                                                         spreadRadius: 1,
//                                                         blurRadius: 10)
//                                                   ]),
//                                               child: Column(
//                                                 children: [
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                         left: 10.w,
//                                                         right: 10.w,
//                                                         top: 10.h),
//                                                     child: Row(
//                                                       children: [
//                                                         Column(
//                                                           children: [
//                                                             Row(
//                                                               children: [
//                                                                 Container(
//                                                                   height: 10.h,
//                                                                   width: 2.w,
//                                                                   color: Colors
//                                                                       .blue,
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width:
//                                                                     20.w),
//                                                                 Container(
//                                                                   height: 10.h,
//                                                                   width: 2.w,
//                                                                   color: Colors
//                                                                       .blue,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Column(
//                                                               children: [
//                                                                 Container(
//                                                                   height: 60.h,
//                                                                   width: 50.w,
//                                                                   decoration:
//                                                                   BoxDecoration(
//                                                                     borderRadius:
//                                                                     BorderRadius.circular(
//                                                                         10),
//                                                                     border: Border.all(
//                                                                         color: Colors
//                                                                             .blue,
//                                                                         width:
//                                                                         2),
//                                                                   ),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       Text(
//                                                                         'APR',
//                                                                         style:
//                                                                         TextStyle(
//                                                                           color:
//                                                                           Colors.grey,
//                                                                           fontSize:
//                                                                           12.sp,
//                                                                         ),
//                                                                       ),
//                                                                       Divider(
//                                                                         thickness:
//                                                                         1,
//                                                                         color: Colors
//                                                                             .grey,
//                                                                       ),
//                                                                       Text(
//                                                                         '18',
//                                                                         style:
//                                                                         TextStyle(
//                                                                           color:
//                                                                           Colors.red,
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SizedBox(width: 12.w),
//                                                         Container(
//                                                           height: 80.h,
//                                                           width: 1.w,
//                                                           color: Colors.grey,
//                                                         ),
//                                                         SizedBox(width: 12.w),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                           children: [
//                                                             Container(
//                                                                 width: MediaQuery.of(
//                                                                     context)
//                                                                     .size
//                                                                     .width *
//                                                                     0.6,
//                                                                 child: Text(
//                                                                   '${snapshot.data?.data?.elementAt(index).title}',
//                                                                     maxLines: 3,
//                                                                     overflow: TextOverflow.ellipsis,
//                                                                     )),
//                                                             Container(
//                                                               width: MediaQuery.of(
//                                                                   context)
//                                                                   .size
//                                                                   .width *
//                                                                   0.6,
//                                                               child: Text(
//                                                                 '${snapshot.data?.data?.elementAt(index).description}',
//                                                                 maxLines: 3,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 style:
//                                                                 TextStyle(
//                                                                   color: Colors
//                                                                       .grey,
//                                                                   fontSize:
//                                                                   12.sp,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                                 height: 5.h),
//                                                             Row(
//                                                               children: [
//                                                                 Icon(
//                                                                   Icons
//                                                                       .access_time,
//                                                                   color: Color(
//                                                                       0xff687bb9),
//                                                                   size: 20.sp,
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width: 5.w),
//                                                                 Text(
//                                                                   '${snapshot.data?.data?.elementAt(index).timeStart}-${snapshot.data?.data?.elementAt(index).timeEnd}',
//                                                                   style:
//                                                                   TextStyle(
//                                                                     color: Color(
//                                                                         0xff687bb9),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   GestureDetector(
//                                                     onTap: ()async{
//                                                       await apply(snapshot,index).then((value){
//                                                         setState(() {
//                                                           getApplied();
//                                                         });                                                    });
//                                                     },
//                                                     child: Container(
//                                                         child: Center(
//                                                             child: Text(
//                                                               '${data!.contains(snapshot.data!.data!.elementAt(index).id.toString())?'Applied':'Apply'}',
//                                                               style: TextStyle(
//                                                                   color: Colors.grey),
//                                                             )),
//                                                         height: 40,
//                                                         width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                         decoration: BoxDecoration(
//                                                           color:
//                                                           data!.contains(snapshot.data!.data!.elementAt(index).id.toString())?Colors.green.shade100:Color(0xfffaeaea),
//                                                           borderRadius:
//                                                           BorderRadius
//                                                               .circular(6),
//                                                         )),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         });
//                                   }else{
//                                     return Container(
//                                       height: MediaQuery.of(context).size.height*0.8,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Center(
//                                         child: Container(
//                                           height: 30,
//                                           width: 30,
//                                           child: CircularProgressIndicator(
//                                             color:Color(0xfffaeaea) ,
//                                           ),),
//                                       ),
//                                     );
//                                   }
//                                 }
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     Visibility(
//                       visible:  index==1,
//                       child: Column(
//                         children: [
//
//                           Container(
//                             height: MediaQuery.of(context).size.height*0.8,
//                             child: FutureBuilder<vacancyModel>(
//                                 future:relevantVacancies,
//                                 builder: (context, snapshot) {
//                                   if(snapshot.hasData) {
//                                     return ListView.builder(
//                                         itemCount: snapshot.data!.data!.length,
//                                         itemBuilder: (context, index) {
//                                           return Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 20.w,
//                                                 right: 20.w,
//                                                 top: 20.h),
//                                             child: Container(
//                                               width: 700.w,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   BorderRadius.circular(6),
//                                                   color: Colors.grey.shade100,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                         color: Colors
//                                                             .grey.shade400,
//                                                         spreadRadius: 1,
//                                                         blurRadius: 10)
//                                                   ]),
//                                               child: Column(
//                                                 children: [
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                         left: 10.w,
//                                                         right: 10.w,
//                                                         top: 10.h),
//                                                     child: Row(
//                                                       children: [
//                                                         Column(
//                                                           children: [
//                                                             Row(
//                                                               children: [
//                                                                 Container(
//                                                                   height: 10.h,
//                                                                   width: 2.w,
//                                                                   color: Colors
//                                                                       .blue,
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width:
//                                                                     20.w),
//                                                                 Container(
//                                                                   height: 10.h,
//                                                                   width: 2.w,
//                                                                   color: Colors
//                                                                       .blue,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Column(
//                                                               children: [
//                                                                 Container(
//                                                                   height: 60.h,
//                                                                   width: 50.w,
//                                                                   decoration:
//                                                                   BoxDecoration(
//                                                                     borderRadius:
//                                                                     BorderRadius.circular(
//                                                                         10),
//                                                                     border: Border.all(
//                                                                         color: Colors
//                                                                             .blue,
//                                                                         width:
//                                                                         2),
//                                                                   ),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       Text(
//                                                                         'APR',
//                                                                         style:
//                                                                         TextStyle(
//                                                                           color:
//                                                                           Colors.grey,
//                                                                           fontSize:
//                                                                           12.sp,
//                                                                         ),
//                                                                       ),
//                                                                       Divider(
//                                                                         thickness:
//                                                                         1,
//                                                                         color: Colors
//                                                                             .grey,
//                                                                       ),
//                                                                       Text(
//                                                                         '18',
//                                                                         style:
//                                                                         TextStyle(
//                                                                           color:
//                                                                           Colors.red,
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SizedBox(width: 12.w),
//                                                         Container(
//                                                           height: 80.h,
//                                                           width: 1.w,
//                                                           color: Colors.grey,
//                                                         ),
//                                                         SizedBox(width: 12.w),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                           children: [
//                                                             Container(
//                                                                 width: MediaQuery.of(
//                                                                     context)
//                                                                     .size
//                                                                     .width *
//                                                                     0.6,
//                                                                 child: Text(
//                                                                     '${snapshot.data?.data?.elementAt(index).title}')),
//                                                             Container(
//                                                               width: MediaQuery.of(
//                                                                   context)
//                                                                   .size
//                                                                   .width *
//                                                                   0.6,
//                                                               child: Text(
//                                                                 '${snapshot.data?.data?.elementAt(index).description}',
//                                                                 style:
//                                                                 TextStyle(
//                                                                   color: Colors
//                                                                       .grey,
//                                                                   fontSize:
//                                                                   12.sp,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                                 height: 5.h),
//                                                             Row(
//                                                               children: [
//                                                                 Icon(
//                                                                   Icons
//                                                                       .access_time,
//                                                                   color: Color(
//                                                                       0xff687bb9),
//                                                                   size: 20.sp,
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width: 5.w),
//                                                                 Text(
//                                                                   '${snapshot.data?.data?.elementAt(index).timeStart}-${snapshot.data?.data?.elementAt(index).timeEnd}',
//                                                                   style:
//                                                                   TextStyle(
//                                                                     color: Color(
//                                                                         0xff687bb9),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   GestureDetector(
//                                                     onTap: ()async{
//                                                       await apply(snapshot,index).then((value){
//                                                         setState(() {
//                                                           getApplied();
//                                                         });
//                                                       });
//                                                     },
//                                                     child: Container(
//                                                         child: Center(
//                                                             child: Text(
//                                                               '${data!.contains(snapshot.data!.data!.elementAt(index).id.toString())?'Applied':'Apply'}',
//                                                               style: TextStyle(
//                                                                   color: Colors.grey),
//                                                             )),
//                                                         height: 40,
//                                                         width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                         decoration: BoxDecoration(
//                                                           color:
//                                                           data!.contains(snapshot.data!.data!.elementAt(index).id.toString())?Colors.green.shade100:Color(0xfffaeaea),
//                                                           borderRadius:
//                                                           BorderRadius
//                                                               .circular(6),
//                                                         )),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         });
//                                   }else{
//                                     return Container(
//                                       height: MediaQuery.of(context).size.height*0.8,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Center(
//                                         child: Container(
//                                           height: 30,
//                                           width: 30,
//                                           child: CircularProgressIndicator(
//                                             color:Color(0xfffaeaea) ,
//                                           ),),
//                                       ),
//                                     );
//                                   }
//                                 }
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Future apply(snapshot,index)async{
//     // SharedPreferences pref=await SharedPreferences.getInstance();
//     // pref.setStringList('Vacancy',[]);
//     await VacancyController().Apply(snapshot.data!.data!.elementAt(index).id);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/VacancyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/VacancyController.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({Key? key}) : super(key: key);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  int index = 0;
  late Future<vacancyModel> allVacancies;
  late Future<vacancyModel> relevantVacancies;
  List<String> data = ['NoId'];
  @override
  void initState() {
    GetData1();
    // TODO: implement initState
    super.initState();
  }

  Future<void> GetData() async {
    allVacancies = VacancyController().GetAll();
    relevantVacancies = VacancyController().GetRelevant();
  }

  GetData1() async {
    await GetData();
  }

  getApplied() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var a = await pref.getStringList('Vacancy');
    if (a == null) {
      data = ['No data'];
    } else {
      data = a;
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    getApplied();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
          'Vacancies',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 844.h,
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
                    //           size: 20.sp,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       SizedBox(width: 5.w),
                    //       Text(
                    //         'Vacancies',
                    //         style: TextStyle(
                    //           fontSize: 20.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Container(
                        height: 60.h,
                        width: 700.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 10)
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Relevant',
                                      style: TextStyle(
                                          color: index == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == 1
                                        ? Colors.pink
                                        : Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'All',
                                      style: TextStyle(
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Visibility(
                    //   visible: index != 1,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.only(
                    //             left: 20.w, right: 20.w, top: 20.h),
                    //         child: Container(
                    //           padding: EdgeInsets.only(
                    //               left: 10.w, right: 10.w, top: 10.h),
                    //           height: 90.h,
                    //           width: 700.w,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(6),
                    //             color: Colors.white,
                    //           ),
                    //           child: Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.calendar_today,
                    //                     size: 40.sp,
                    //                     color: Color(0xff687bb9),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //               Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text('Cardinal Heenan House'),
                    //                   Text(
                    //                     'Nurse',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                   Text(
                    //                     'Mar 01',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Spacer(),
                    //               // SizedBox(width: 20.w),
                    //               Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.end,
                    //                 children: [
                    //                   Container(
                    //                     height: 25.h,
                    //                     width: 25.w,
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       color: Colors.redAccent.shade100,
                    //                     ),
                    //                     child: Center(
                    //                       child: Text(
                    //                         '-',
                    //                         style: TextStyle(
                    //                           fontSize: 20.sp,
                    //                           color: Colors.white,
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 25.h),
                    //                   Text(
                    //                     '10:00 - 01:00',
                    //                     style: TextStyle(
                    //                         color: Color(0xff687bb9),
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(
                    //             left: 20.w, right: 20.w, top: 20.h),
                    //         child: Container(
                    //           padding: EdgeInsets.only(
                    //               left: 10.w, right: 10.w, top: 10.h),
                    //           height: 90.h,
                    //           width: 700.w,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(6),
                    //             color: Colors.white,
                    //           ),
                    //           child: Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.calendar_today,
                    //                     size: 40.sp,
                    //                     color: Color(0xff687bb9),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //               Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text('Cardinal Heenan House'),
                    //                   Text(
                    //                     'Nurse',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                   Text(
                    //                     'Mar 01',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Spacer(),
                    //               // SizedBox(width: 20.w),
                    //               Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.end,
                    //                 children: [
                    //                   Container(
                    //                     height: 25.h,
                    //                     width: 25.w,
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       color: Colors.redAccent.shade100,
                    //                     ),
                    //                     child: Center(
                    //                       child: Text(
                    //                         '-',
                    //                         style: TextStyle(
                    //                           fontSize: 20.sp,
                    //                           color: Colors.white,
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 25.h),
                    //                   Text(
                    //                     '10:00 - 01:00',
                    //                     style: TextStyle(
                    //                         color: Color(0xff687bb9),
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(
                    //             left: 20.w, right: 20.w, top: 20.h),
                    //         child: Container(
                    //           padding: EdgeInsets.only(
                    //               left: 10.w, right: 10.w, top: 10.h),
                    //           height: 90.h,
                    //           width: 700.w,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(6),
                    //             color: Colors.white,
                    //           ),
                    //           child: Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.calendar_today,
                    //                     size: 40.sp,
                    //                     color: Color(0xff687bb9),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //               Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text('Cardinal Heenan House'),
                    //                   Text(
                    //                     'Nurse',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                   Text(
                    //                     'Mar 01',
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Spacer(),
                    //               // SizedBox(width: 20.w),
                    //               Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.end,
                    //                 children: [
                    //                   Container(
                    //                     height: 25.h,
                    //                     width: 25.w,
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       color: Colors.redAccent.shade100,
                    //                     ),
                    //                     child: Center(
                    //                       child: Text(
                    //                         '-',
                    //                         style: TextStyle(
                    //                           fontSize: 20.sp,
                    //                           color: Colors.white,
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 25.h),
                    //                   Text(
                    //                     '10:00 - 01:00',
                    //                     style: TextStyle(
                    //                         color: Color(0xff687bb9),
                    //                         fontSize: 17.sp),
                    //                   ),
                    //                 ],
                    //               ),
                    //               SizedBox(width: 10.w),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Visibility(
                      visible: index == 0,
                      child:
                          //  data[0] == "No data"
                          //     ? Column(children: [
                          //         Center(
                          //             child: Container(
                          //                 margin: const EdgeInsets.fromLTRB(
                          //                     20, 200, 20, 10),
                          //                 child: Text("No Vacancy Available")))
                          //       ])
                          //     :
                          Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: StreamBuilder<vacancyModel>(
                                stream: allVacancies.asStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: Text(
                                                  "No Vacancy Available")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade400,
                                                          spreadRadius: 1,
                                                          blurRadius: 10)
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w,
                                                          top: 10.h),
                                                      child: Row(
                                                        children: [
                                                          /// calendar image
                                                          Flexible(
                                                              child: Image(
                                                                  image: AssetImage(
                                                                      'assets/images/calendar2.png'))),
                                                          SizedBox(width: 12.w),
                                                          Container(
                                                            height: 80.h,
                                                            width: 1.w,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(width: 12.w),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              /// changes in vacancies
                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).careHome!.name}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).title}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              // Container(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     '${snapshot.data?.data?.elementAt(index).description}',
                                                              //     maxLines: 3,
                                                              //     overflow:
                                                              //         TextOverflow
                                                              //             .ellipsis,
                                                              //     style:
                                                              //         TextStyle(
                                                              //       color: Colors
                                                              //           .grey,
                                                              //       fontSize:
                                                              //           12.sp,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'No of Staff: ${snapshot.data?.data!.elementAt(index).noOfStaff.toString()}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'Shifts: ${snapshot.data?.data?.elementAt(index).shiftDetailName}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                  height: 5.h),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: Color(
                                                                        0xff687bb9),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          5.w),
                                                                  Text(
                                                                    // '${snapshot.data?.data!.elementAt(index).date.toString().substring(0, 10)} - ${snapshot.data?.data!.elementAt(index).jobEndDate.toString().substring(0, 11)}',
                                                                    '${snapshot.data?.data!.elementAt(index).date.toString().substring(0, 10)} ',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff687bb9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await apply(
                                                                snapshot, index)
                                                            .then((value) {
                                                          setState(() {
                                                            getApplied();
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Center(
                                                              child: Text(
                                                            '${data.contains(snapshot.data!.data!.elementAt(index).id.toString()) ? 'Applied' : 'Apply'}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                          height: 40,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: data.contains(snapshot
                                                                    .data!.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .id
                                                                    .toString())
                                                                ? Colors.blue
                                                                : Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: index == 1,
                      child:
                          // data[0] == "No data"
                          //     ? Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //             Center(
                          //                 child: Container(
                          //                     margin: const EdgeInsets.fromLTRB(
                          //                         20, 200, 20, 10),
                          //                     child: Text(
                          //                         "No Relavent Vacancy Available")))
                          //           ])
                          //     :
                          Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: StreamBuilder<vacancyModel>(
                                stream: relevantVacancies.asStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.data == null) {
                                      return Center(
                                          child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 10),
                                              child: Text(
                                                  "No Relavent Vacancy Available")));
                                    } else {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (context, index) {
                                            // start setting date
                                            String? date = '';
                                            if (snapshot.data!.data!
                                                    .elementAt(index)
                                                    .date !=
                                                null) {
                                              date = snapshot.data!.data!
                                                  .elementAt(index)
                                                  .date
                                                  .toString()
                                                  .substring(0, 10);
                                            }
                                            if (snapshot.data!.data!
                                                    .elementAt(index)
                                                    .jobEndDate !=
                                                null) {
                                              date = "${date} - ";
                                              date = date +
                                                  snapshot.data!.data!
                                                      .elementAt(index)
                                                      .jobEndDate
                                                      .toString()
                                                      .substring(0, 11);
                                            }
                                            // end setting date

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 20.h),
                                              child: Container(
                                                width: 700.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.grey.shade100,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade400,
                                                          spreadRadius: 1,
                                                          blurRadius: 10)
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w,
                                                          top: 10.h),
                                                      child: Row(
                                                        children: [
                                                          Flexible(
                                                              child: Image(
                                                            image: AssetImage(
                                                                'assets/images/calendar2.png'),
                                                            height: 44,
                                                            width: 44,
                                                          )),

                                                          // Column(
                                                          //   children: [
                                                          //     Row(
                                                          //       children: [
                                                          //         Container(
                                                          //           height:
                                                          //               10.h,
                                                          //           width: 2.w,
                                                          //           color: Colors
                                                          //               .blue,
                                                          //         ),
                                                          //         SizedBox(
                                                          //             width:
                                                          //                 20.w),
                                                          //         Container(
                                                          //           height:
                                                          //               10.h,
                                                          //           width: 2.w,
                                                          //           color: Colors
                                                          //               .blue,
                                                          //         ),
                                                          //       ],
                                                          //     ),
                                                          //     Column(
                                                          //       children: [
                                                          //         Container(
                                                          //           height:
                                                          //               60.h,
                                                          //           width: 50.w,
                                                          //           decoration:
                                                          //               BoxDecoration(
                                                          //             borderRadius:
                                                          //                 BorderRadius.circular(
                                                          //                     10),
                                                          //             border: Border.all(
                                                          //                 color: Colors
                                                          //                     .blue,
                                                          //                 width:
                                                          //                     2),
                                                          //           ),
                                                          //           child:
                                                          //               Column(
                                                          //             children: [
                                                          //               Text(
                                                          //                 'APR',
                                                          //                 style:
                                                          //                     TextStyle(
                                                          //                   color:
                                                          //                       Colors.grey,
                                                          //                   fontSize:
                                                          //                       12.sp,
                                                          //                 ),
                                                          //               ),
                                                          //               Divider(
                                                          //                 thickness:
                                                          //                     1,
                                                          //                 color:
                                                          //                     Colors.grey,
                                                          //               ),
                                                          //               Text(
                                                          //                 '18',
                                                          //                 style:
                                                          //                     TextStyle(
                                                          //                   color:
                                                          //                       Colors.red,
                                                          //                 ),
                                                          //               ),
                                                          //             ],
                                                          //           ),
                                                          //         ),
                                                          //       ],
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          SizedBox(width: 12.w),
                                                          Container(
                                                            height: 80.h,
                                                            width: 1.w,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(width: 12.w),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              // Container(
                                                              //     width: MediaQuery.of(
                                                              //                 context)
                                                              //             .size
                                                              //             .width *
                                                              //         0.6,
                                                              //     child: Text(
                                                              //         '${snapshot.data?.data?.elementAt(index).title}')),
                                                              // Container(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     '${snapshot.data?.data?.elementAt(index).description}',
                                                              //     style:
                                                              //         TextStyle(
                                                              //       color: Colors
                                                              //           .grey,
                                                              //       fontSize:
                                                              //           12.sp,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).careHome!.name}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.6,
                                                                  child: Text(
                                                                    // jhb
                                                                    '${snapshot.data?.data?.elementAt(index).title}',
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )),

                                                              // Container(
                                                              //   width: MediaQuery.of(
                                                              //               context)
                                                              //           .size
                                                              //           .width *
                                                              //       0.6,
                                                              //   child: Text(
                                                              //     '${snapshot.data?.data?.elementAt(index).description}',
                                                              //     maxLines: 3,
                                                              //     overflow:
                                                              //         TextOverflow
                                                              //             .ellipsis,
                                                              //     style:
                                                              //         TextStyle(
                                                              //       color: Colors
                                                              //           .grey,
                                                              //       fontSize:
                                                              //           12.sp,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'No of Staff: ${snapshot.data?.data!.elementAt(index).noOfStaff.toString()}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                child: Text(
                                                                  'Shifts: ${snapshot.data?.data?.elementAt(index).shiftDetailName}',
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // style:
                                                                  // TextStyle(
                                                                  //   color: Colors
                                                                  //       .grey,
                                                                  //   fontSize:
                                                                  //   12.sp,
                                                                  // ),
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                  height: 5.h),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: Color(
                                                                        0xff687bb9),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          5.w),
                                                                  Text(
                                                                    date.toString(),
                                                                    // '${snapshot.data?.data!.elementAt(index).date.toString().substring(0,10)} - ${snapshot.data?.data!.elementAt(index).jobEndDate.toString().substring(0,11)}',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff687bb9),
                                                                    ),
                                                                  ),
                                                                  // Text(
                                                                  //   '${snapshot.data?.data!.elementAt(index).timeStart}-${snapshot.data?.data!.elementAt(index).timeEnd}',
                                                                  //   style:
                                                                  //       TextStyle(
                                                                  //     color: Color(
                                                                  //         0xff687bb9),
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await apply(
                                                                snapshot, index)
                                                            .then((value) {
                                                          setState(() {
                                                            getApplied();
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Center(
                                                              child: Text(
                                                            '${data.contains(snapshot.data!.data!.elementAt(index).id.toString()) ? 'Applied' : 'Apply'}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                          height: 40,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: data.contains(snapshot
                                                                    .data!.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .id
                                                                    .toString())
                                                                ? Colors.blue
                                                                : Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  } else {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0xfffaeaea),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
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

  Future apply(snapshot, index) async {
    // SharedPreferences pref=await SharedPreferences.getInstance();
    // pref.setStringList('Vacancy',[]);
    await VacancyController().Apply(snapshot.data!.data!.elementAt(index).id);
  }
}
