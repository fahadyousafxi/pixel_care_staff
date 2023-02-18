import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Controller/DocumentController.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class ReferFriendPage extends StatefulWidget {
  const ReferFriendPage({Key? key}) : super(key: key);

  @override
  State<ReferFriendPage> createState() => _ReferFriendPageState();
}

class _ReferFriendPageState extends State<ReferFriendPage> {
  @override
  Widget build(BuildContext context) {
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
          'Refer a Friend',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 734.h,
            child: FutureBuilder(
                future: DocumentController().GetReference(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.only(top: 30.h, left: 10.w),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           InkWell(
                      //             onTap: () {
                      //               Navigator.pop(context);
                      //             },
                      //             child: Icon(
                      //               Icons.arrow_back_ios_outlined,
                      //               size: 15.sp,
                      //               color: Colors.grey,
                      //             ),
                      //           ),
                      //           SizedBox(width: 5.w),
                      //           Text(
                      //             'Refer a Friend',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 17.sp),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage('assets/images/rffriend.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Share this link with your friends and earn rewards upon their registration.',
                                style: TextStyle(fontSize: 17.sp),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.h, left: 20.w, right: 20.w),
                            child: Container(
                              height: 60.h,
                              width: 600.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                    '${snapshot.data == null ? 'Wait...' : snapshot.data}'),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Spacer(flex: 1,),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
                        child: GestureDetector(
                          onTap: () {
                            if (snapshot.data != null) {
                              Share.share(
                                  'https://pixelcare.stackbuffers.com/my-referral-id:${snapshot.data}');
                            }
                          },
                          child: Container(
                            height: 60.h,
                            width: 600.w,
                            decoration: BoxDecoration(
                              color: snapshot.data != null
                                  ? Colors.pink
                                  : Color(0xfffaeaea),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Share',
                                style: TextStyle(
                                    color: snapshot.data != null
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
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
