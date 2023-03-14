import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:pixel_app/screens/NMC_details.dart';
import 'package:pixel_app/screens/NextOfKin.dart';
import 'package:pixel_app/screens/PasswordDetails.dart';
import 'package:pixel_app/screens/PersonalDetails.dart';
import 'package:pixel_app/screens/accademicView.dart';
import 'package:pixel_app/screens/refrenceView.dart';

import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../widgets/bottomNavigationBar/BottomNavigation.dart';
import 'ProfileTrainingCertificate.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double rating = 1.0;

  Widget TextField({required String text, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Icon(
            icon,
            size: 20.sp,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bottomNavigationBarState.selectedIndex = 0;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const bottomNavigationBar()),
          // (Route route) => false);
        );
        return false as Future<bool>;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              bottomNavigationBarState.selectedIndex = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const bottomNavigationBar()),
              );
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.grey,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<UserModel>(
                future: AuthController().GetUserData(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(top: 20.h, left: 10.w),
                            //   child: InkWell(
                            //     onTap: () {
                            //       bottomNavigationBarState.selectedIndex = 0;
                            //       Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => bottomNavigationBar()),
                            //       );
                            //     },
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       children: [
                            //         Icon(
                            //           Icons.arrow_back_ios_outlined,
                            //           size: 15.sp,
                            //           color: Colors.grey,
                            //         ),
                            //         SizedBox(width: 5.w),
                            //         Text(
                            //           'Profile',
                            //           style: TextStyle(
                            //               fontSize: 16.sp, fontWeight: FontWeight.w600),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 10.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60.r,
                                      backgroundColor: Colors.grey.shade300,
                                      backgroundImage: NetworkImage(
                                          '${snapshot.data?.data?.avatar}'),
                                    ),
                                    // Container(
                                    //   height: 100.h,
                                    //   width: 120.w,
                                    //   decoration: BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     image: DecorationImage(
                                    //       fit: BoxFit.cover,
                                    //       image: AssetImage('assets/images/men.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      '${snapshot.data?.data?.name}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      '${snapshot.data?.data?.email}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10.h, left: 20.w, right: 20.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 15.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PersonalDetailsPage()));
                                    },
                                    child: TextField(
                                      text: 'Personal Details',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NextKinPage()));
                                    },
                                    child: TextField(
                                      text: 'Next of Kin',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PasswordDetailPage()));
                                    },
                                    child: TextField(
                                      text: 'Password Details',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NMCDetails()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade100,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                spreadRadius: 1,
                                                blurRadius: 10)
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "NMC Details",
                                          ),
                                          Container(
                                            // margin: EdgeInsets.only(right: 110.w),
                                            child: Text("(Only for Nurses)",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: const Color.fromARGB(
                                                        255, 110, 108, 108))),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 20.sp,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // TextField(
                                    //   text: 'NMC Details (Only for N)',
                                    //   icon: Icons.arrow_forward_ios_outlined,
                                    // ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AccademicView()));
                                    },
                                    child: TextField(
                                      text: 'Academic Qualification',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TrainingCertificateProfile(
                                                    model: model1,
                                                  )));
                                    },
                                    child: TextField(
                                      text: 'Training Certificates',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RefrenceView()));
                                    },
                                    child: TextField(
                                      text: 'References',
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ],
                        );
                }),
          ),
        ),
      ),
    );
  }
}
