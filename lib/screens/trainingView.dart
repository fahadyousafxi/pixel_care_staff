import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Controller/AuthController.dart';
import 'package:pixel_app/Model/AccademicCertModel.dart';

import '../Application_Form/Reference_Form.dart';
import '../DocumentsUpload/training_certificates.dart';
import 'AcademicQualification.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  GlobalKey<ScaffoldState> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink, //Color.fromARGB(255, 234, 129, 129),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrainingCertificates()));
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
                        ' Add New Certificate ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<AccademicCertModel>(
            future: AuthController().GetCert(),
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
                                                    'Date of Completion: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                      '${snapshot.data?.data?.elementAt(index).dateOfCompletion}',
                                                      style: TextStyle()),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () async {
                                                      var response =
                                                          await AuthController()
                                                              .DeleteCert(snapshot
                                                                  .data?.data
                                                                  ?.elementAt(
                                                                      index)
                                                                  .id);
                                                      setState(() {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                                    content:
                                                                        Text(
                                                          response,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )));
                                                      });
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
                                                'Expiry Date: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).expiryDate}',
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
                                                'Images: ',
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
                                              height: 100.h,
                                              width: 100.w,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          '${snapshot.data?.data?.elementAt(index).image}'))),
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'No certificate added yet!',
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
