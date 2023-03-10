// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';

import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../Model/AccademicQualModel.dart';
import '../screens/AcademicQualification.dart';
import 'Model/ApplicationFormModel.dart';
import 'Trainings.dart';

class EducationalPage extends StatefulWidget {
  EducationalPage({required this.model});
  ApplicationFormModel model = ApplicationFormModel();

  @override
  State<EducationalPage> createState() => _EducationalPageState();
}

class _EducationalPageState extends State<EducationalPage> {
  var emp = false;
  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: const Color(0xffACA9A9),
          ),
          fillColor: const Color(0xfff0f0f0),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
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

  @override
  void initState() {
    // TODO: implement h
    hide();
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: WillPopScope(
        onWillPop: () {
          bottomNavigationBarState.selectedIndex = 0;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const bottomNavigationBar()),
              (Route route) => false);
          return false as Future<bool>;
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                height: 844.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, left: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Educational Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          const Text(
                            'All Educational Qualifications',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 30.h,
                      child: Row(
                        children: [
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          const Spacer(),
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
                    // SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AcademicPage()));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      ' Add New Qualification ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SingleChildScrollView(
                        child: FutureBuilder<AccademicQualModel>(
                            future: AuthController().GetQual(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.data!.isNotEmpty) {
                                  Future.delayed(const Duration(seconds: 1))
                                      .then((value) => setState(() {
                                            emp = true;
                                          }));
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                          children: List.generate(
                                              snapshot.data!.data!.length,
                                              (index) => Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              spreadRadius: 1,
                                                              blurRadius: 10)
                                                        ]),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                    'Degree: ',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  Text(
                                                                      '${snapshot.data?.data?.elementAt(index).degree}',
                                                                      style:
                                                                          const TextStyle()),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      showDialog<
                                                                          void>(
                                                                        context:
                                                                            context,
                                                                        barrierDismissible:
                                                                            false, // user must tap button!
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Are you sure?'),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: ListBody(
                                                                                children: const <Widget>[
                                                                                  Text('This action cannot be undone.'),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            actions: <Widget>[
                                                                              TextButton(
                                                                                child: const Text('Cancel', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                              ),
                                                                              TextButton(
                                                                                child: const Text(
                                                                                  'Delete',
                                                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                onPressed: () async {
                                                                                  // Perform the delete action here
                                                                                  var response = await AuthController().DeleteQual(snapshot.data?.data?.elementAt(index).id);

                                                                                  setState(() {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                        content: Text(
                                                                                      "This record and its details will be permanently deleted.",
                                                                                      style: TextStyle(color: Colors.white),
                                                                                    )));
                                                                                  });
                                                                                  Navigator.of(context).pop();
                                                                                  Navigator.pushReplacement(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => EducationalPage(
                                                                                              model: model1,
                                                                                            )),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );

                                                                      ///////////
                                                                      // var response = await AuthController().DeleteQual(snapshot
                                                                      //     .data
                                                                      //     ?.data
                                                                      //     ?.elementAt(
                                                                      //         index)
                                                                      //     .id);

                                                                      // setState(
                                                                      //     () {
                                                                      //   ScaffoldMessenger.of(
                                                                      //           context)
                                                                      //       .showSnackBar(SnackBar(
                                                                      //           content: Text(
                                                                      //     response,
                                                                      //     style: TextStyle(
                                                                      //         color:
                                                                      //             Colors.white),
                                                                      //   )));
                                                                      // });
                                                                      // Navigator
                                                                      //     .pushReplacement(
                                                                      //   context,
                                                                      //   MaterialPageRoute(
                                                                      //       builder: (context) =>
                                                                      //           EducationalPage(
                                                                      //             model: model1,
                                                                      //           )),
                                                                      // );
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .red,
                                                                    ))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 05,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                'University: ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Flexible(
                                                                  child: Text(
                                                                      '${snapshot.data?.data?.elementAt(index).university}',
                                                                      style:
                                                                          const TextStyle())),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                'Passing Year: ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Flexible(
                                                                  child: Text(
                                                                      '${snapshot.data?.data?.elementAt(index).passingYear}',
                                                                      style:
                                                                          const TextStyle())),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Center(
                                      child: Text(
                                        'No qualification added yet!',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: Container(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.redAccent.withOpacity(0.5),
                                    ),
                                  )),
                                );
                              }
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Previous',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (emp == true) {
                                  //EducationDetails details=new EducationDetails();
                                  // widget.model.educationDetails=details;
                                  print(widget.model.toJson());
                                  print(widget.model);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TrainingPage(model: widget.model),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: emp == true
                                      ? Colors.pink
                                      : const Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: emp == true
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
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
