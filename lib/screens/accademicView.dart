import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/AccademicQualModel.dart';

import '../Application_Form/Reference_Form.dart';
import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import 'AcademicQualification.dart';
import 'Profile.dart';

class AccademicView extends StatefulWidget {
  const AccademicView({Key? key}) : super(key: key);

  @override
  State<AccademicView> createState() => _AccademicViewState();
}

class _AccademicViewState extends State<AccademicView> {
  GlobalKey<ScaffoldState> key = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState

    academicnav = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  academicnav = true;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AcademicPage()));
              },
              child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.all(05),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        ' Add New Qualification ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<AccademicQualModel>(
            future: AuthController().GetQual(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.data!.length != 0) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                          children: List.generate(
                              snapshot.data!.data!.length,
                              (index) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 1,
                                              blurRadius: 10)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Degree: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                      '${snapshot.data?.data?.elementAt(index).degree}',
                                                      style: TextStyle()),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () async {
                                                      showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Are you sure?'),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      'This action cannot be undone.'),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: Text(
                                                                  'Delete',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  // Perform the delete action here
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          SnackBar(
                                                                              content: Text(
                                                                    "Deletion is in progress...",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )));
                                                                  var response =
                                                                      await AuthController().DeleteQual(snapshot
                                                                          .data
                                                                          ?.data
                                                                          ?.elementAt(
                                                                              index)
                                                                          .id);
                                                                  setState(() {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content: Text(
                                                                      response,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )));
                                                                  });

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator
                                                                      .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AccademicView()),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 05,
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'University: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).university}',
                                                      style: TextStyle())),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Passing Year: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).passingYear}',
                                                      style: TextStyle())),
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'No qualification added yet!',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.pinkAccent.shade100.withOpacity(0.5),
                    ),
                  )),
                );
              }
            }),
      ),
    );
  }
}
