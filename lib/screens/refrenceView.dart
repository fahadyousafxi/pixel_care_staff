import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:pixel_app/screens/EditReference.dart';

import '../Application_Form/Reference_Form.dart';
import '../Controller/AuthController.dart';

class RefrenceView extends StatefulWidget {
  const RefrenceView({Key? key}) : super(key: key);

  @override
  State<RefrenceView> createState() => _RefrenceViewState();
}

class _RefrenceViewState extends State<RefrenceView> {
  GlobalKey<ScaffoldState> key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ReferencePage()));
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
                        ' Add New Reference ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))),
        ],
      ),
      body: FutureBuilder<ReferenceModel>(
          future: AuthController().GetRef(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.data!.length != 0) {
                return SingleChildScrollView(
                  child: Column(
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
                                                    'Name: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                      '${snapshot.data?.data?.elementAt(index).name}',
                                                      style: TextStyle()),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditReferencePage(
                                                                    address: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .address,
                                                                    email: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .email,
                                                                    jobTitle: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .jobTitle,
                                                                    name: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .name,
                                                                    organization: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .organization,
                                                                    phoneNumber: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .phoneNumber,
                                                                    relation: snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .relation,
                                                                  )));
                                                    },
                                                    child: Icon(
                                                      Icons.edit_note,
                                                      color: Colors.green,
                                                      size: 30,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
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
                                                                      await AuthController().DeleteRef(snapshot
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
                                                                      response
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )));
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              RefrenceView()));
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                      ///////////
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Job Title: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                  '${snapshot.data?.data?.elementAt(index).jobTitle}',
                                                  style: TextStyle()),
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
                                                'Organization: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).organization}',
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
                                                'Address: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).address}',
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
                                                'Phone Number: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).phoneNumber}',
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
                                                'Email: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).email}',
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
                                                'How this person knows you? ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      '${snapshot.data?.data?.elementAt(index).relation} ',
                                                      style: TextStyle())),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))),
                    ],
                  ),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'No reference added yet!',
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
    );
  }
}
