import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/screens/Profile.dart';

import '../Application_Form/Model/ApplicationFormModel.dart';
import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../DocumentsUpload/training_certificates.dart';
import '../Model/AccademicCertModel.dart';

class TrainingCertificateProfile extends StatefulWidget {
  TrainingCertificateProfile({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();
  @protected
  @mustCallSuper
  void initState() {
    model1 = this.model;
    navigator = false;
  }

  @override
  State<TrainingCertificateProfile> createState() =>
      _TrainingCertificateProfileState();
}

class _TrainingCertificateProfileState
    extends State<TrainingCertificateProfile> {
  List<File> images = [];
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

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  GlobalKey<FormState> formKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // bottomNavigationBarState.selectedIndex = 0;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ProfilePage()),
            (Route route) => false);
        return false as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            GestureDetector(
                onTap: () {
                  navigator = true;
                  setState(() {});
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TrainingCertificates()));
                },
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: const EdgeInsets.all(05),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          ' Add New Training ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ))),
          ],
        ),
        backgroundColor: Colors.grey.shade50,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 40.h,
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: SingleChildScrollView(
                                  child: FutureBuilder<AccademicCertModel>(
                                      future: AuthController().GetCert(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data!.data.isNotEmpty) {
                                            Future.delayed(
                                                    const Duration(seconds: 1))
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
                                                        snapshot
                                                            .data!.data.length,
                                                        (index) => Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      20),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                        spreadRadius:
                                                                            1,
                                                                        blurRadius:
                                                                            10)
                                                                  ]),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Text(
                                                                  //     'Training Name: ${snapshot.data?.data!.elementAt(index).docCategoryName}',
                                                                  //     style: TextStyle()),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text(
                                                                              'Date of Completion: ',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                                            ),
                                                                            Text('${snapshot.data?.data.elementAt(index).dateOfCompletion.toString().substring(0, 10)} ',
                                                                                style: const TextStyle()),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          GestureDetector(
                                                                              onTap: () async {
                                                                                showDialog<void>(
                                                                                  context: context,
                                                                                  barrierDismissible: false, // user must tap button!
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('Are you sure?'),
                                                                                      content: SingleChildScrollView(
                                                                                        child: ListBody(
                                                                                          children: <Widget>[
                                                                                            const Text('This action cannot be undone.'),
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
                                                                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                                content: Text(
                                                                                              "Deletion is in progress...",
                                                                                              style: TextStyle(color: Colors.white),
                                                                                            )));
                                                                                            var response = await AuthController().DeleteCert(snapshot.data?.data.elementAt(index).id);
                                                                                            setState(() {
                                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                  content: Text(
                                                                                                response,
                                                                                                style: const TextStyle(color: Colors.white),
                                                                                              )));
                                                                                              Navigator.of(context).pop();
                                                                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                                                  builder: (context) => TrainingCertificateProfile(
                                                                                                        model: model1,
                                                                                                      )));
                                                                                            });
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: const Icon(
                                                                                Icons.delete,
                                                                                color: Colors.red,
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
                                                                          'Expiry Date: ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                        Flexible(
                                                                            child:
                                                                                Text('${snapshot.data?.data.elementAt(index).expiryDate.toString().substring(0, 10)}', style: const TextStyle())),
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
                                                                        // comment for pull
                                                                        const Text(
                                                                          'File: ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            100.w,
                                                                        margin:
                                                                            const EdgeInsets.all(10),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.grey,
                                                                            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('${snapshot.data?.data.elementAt(index).image}'))),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ))),
                                              ],
                                            );
                                          } else {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: const Center(
                                                child: Text(
                                                  'No certificate added yet!',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            );
                                          }
                                        } else {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Center(
                                                child: Container(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Colors
                                                    .pinkAccent.shade100
                                                    .withOpacity(0.5),
                                              ),
                                            )),
                                          );
                                        }
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
