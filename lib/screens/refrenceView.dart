import 'package:flutter/material.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:pixel_app/screens/EditReference.dart';
import 'package:pixel_app/screens/Profile.dart';

import '../Application_Form/Reference_Form.dart';
import '../Controller/AuthController.dart';

class RefrenceView extends StatefulWidget {
  const RefrenceView({Key? key}) : super(key: key);

  @override
  State<RefrenceView> createState() => _RefrenceViewState();
}

class _RefrenceViewState extends State<RefrenceView> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // bottomNavigationBarState.selectedIndex = 0;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        return false as Future<bool>;
      },
      child: Scaffold(
        key: key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ReferencePage()));
                },
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: const EdgeInsets.all(05),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
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
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                            children: List.generate(
                                snapshot.data!.data!.length,
                                (index) => Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                    const Text(
                                                      'Name: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                        '${snapshot.data?.data?.elementAt(index).name}',
                                                        style:
                                                            const TextStyle()),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        EditReferencePage(
                                                                          address: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .address,
                                                                          email: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .email,
                                                                          jobTitle: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .jobTitle,
                                                                          name: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .name,
                                                                          organization: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .organization,
                                                                          phoneNumber: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .phoneNumber,
                                                                          relation: snapshot
                                                                              .data
                                                                              ?.data
                                                                              ?.elementAt(index)
                                                                              .relation,
                                                                        )));
                                                      },
                                                      child: const Icon(
                                                        Icons.edit_note,
                                                        color: Colors.green,
                                                        size: 30,
                                                      )),
                                                  const SizedBox(
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
                                                              title: const Text(
                                                                  'Are you sure?'),
                                                              content:
                                                                  SingleChildScrollView(
                                                                child: ListBody(
                                                                  children: const <
                                                                      Widget>[
                                                                    Text(
                                                                        'This action cannot be undone.'),
                                                                  ],
                                                                ),
                                                              ),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  child: const Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .green,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child:
                                                                      const Text(
                                                                    'Delete',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // Perform the delete action here
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(const SnackBar(
                                                                            content: Text(
                                                                      "Deletion is in progress...",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )));
                                                                    var response = await AuthController().DeleteRef(snapshot
                                                                        .data
                                                                        ?.data
                                                                        ?.elementAt(
                                                                            index)
                                                                        .id);
                                                                    setState(
                                                                        () {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(SnackBar(
                                                                              content: Text(
                                                                        response
                                                                            .toString(),
                                                                        style: const TextStyle(
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
                                                                                const RefrenceView()));
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        ///////////
                                                      },
                                                      child: const Icon(
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
                                                const Text(
                                                  'Job Title: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                    '${snapshot.data?.data?.elementAt(index).jobTitle}',
                                                    style: const TextStyle()),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Organization: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).organization}',
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Address: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).address}',
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Phone Number: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).phoneNumber}',
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Email: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).email}',
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'How this person knows you? ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        '${snapshot.data?.data?.elementAt(index).relation} ',
                                                        style:
                                                            const TextStyle())),
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        'No reference added yet!',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: SizedBox(
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
