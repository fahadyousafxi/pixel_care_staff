import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/WorkingTimeRegulation.dart';

import 'Model/ApplicationFormModel.dart';

class HealthPage extends StatefulWidget {
  HealthPage({required this.model});
  ApplicationFormModel model = ApplicationFormModel();

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  List title = ['Yes', 'No'];
  var title1Selected = 'Yes';
  var title2Selected = 'Yes';
  var title3Selected = 'Yes';
  var title4Selected = 'Yes';
  var month = 'September';
  var day = '1';
  var year = '2022';
  var dob;
  bool status = false;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;
  bool status8 = false;
  bool status9 = false;
  bool status10 = false;
  @override
  void initState() {
    title1Selected = widget.model.covid19?.tuberculosisVaccine ?? "Yes";
    title2Selected = widget.model.covid19?.careHomeBefore ?? "Yes";
    title3Selected = widget.model.covid19?.demantiaCareBefore ?? "Yes";
    title4Selected = widget.model.covid19?.drivingLicense ?? "Yes";

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40.h, left: 10.w),
                  child: Column(
                    children: [
                      Text(
                        'Health Condition',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 27.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Text(
                        'Details about your Health Condition',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20.h),
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
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                                'Do you suffer from any of the health conditions listed'),
                            const Text('below?'),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Diabetes'),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status,
                                        onChanged: (val) {
                                          setState(() {
                                            status = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status,
                                        onChanged: (val) {
                                          setState(() {
                                            status = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: const Text(
                                    'Heart or Circulatory Disorders')),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status1,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status1 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status1,
                                        onChanged: (val) {
                                          setState(() {
                                            status1 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status1,
                                        onChanged: (val) {
                                          setState(() {
                                            status1 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: const Text(
                                    'Stomach or Intestinal Disorders')),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status2,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status2 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status2,
                                        onChanged: (val) {
                                          setState(() {
                                            status2 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status2,
                                        onChanged: (val) {
                                          setState(() {
                                            status2 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const Text(
                                  'Any disease which cause difficulty in sleeping'),
                            ),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status3,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status3 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status3,
                                        onChanged: (val) {
                                          setState(() {
                                            status3 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status3,
                                        onChanged: (val) {
                                          setState(() {
                                            status3 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Chronic chest disorders'),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status4,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status4 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status4,
                                        onChanged: (val) {
                                          setState(() {
                                            status4 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status4,
                                        onChanged: (val) {
                                          setState(() {
                                            status4 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                  'Any other medical condiotion, requring medication to a strict timetable?'),
                            ),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status5,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status5 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status5,
                                        onChanged: (val) {
                                          setState(() {
                                            status5 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status5,
                                        onChanged: (val) {
                                          setState(() {
                                            status5 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                                    'Have you recently shown flu-like/COVID-19 Symptoms?')),
                            // Container(
                            //   child: FlutterSwitch(
                            //     //activeColor: Colors.red,
                            //     toggleColor: Colors.red,
                            //     activeColor: Colors.grey.shade300,
                            //     width: 50,
                            //     height: 25,
                            //     valueFontSize: 25.0,
                            //     toggleSize: 20.0,
                            //     value: status6,
                            //     borderRadius: 30.0,
                            //     // padding: 8.0,
                            //     //showOnOff: true,
                            //     onToggle: (val) {
                            //       setState(() {
                            //         status6 = val;
                            //       });
                            //     },
                            //   ),
                            // ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text('Yes'),
                                    Checkbox(
                                        value: status6,
                                        onChanged: (val) {
                                          setState(() {
                                            status6 = val!;
                                          });
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('No'),
                                    Checkbox(
                                        value: !status6,
                                        onChanged: (val) {
                                          setState(() {
                                            status6 = !val!;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              margin: EdgeInsets.only(top: 20.h),
                              child: const Text(
                                  'if you have answered \'yes\' to any of the above questions, you may be asked to see a doctor or nurse.',
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              margin: EdgeInsets.only(top: 20.h),
                              child: const Text(
                                  'i confirm, in my declaration, that the above information provided is correct to the best of my knowledge.',
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: const Text('Date of last negative COVID-19 test'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                            width: 90.w,
                            child: DropdownButtonFormField<String>(
                              value: day,
                              items: List.generate(
                                  31,
                                  (index) => DropdownMenuItem(
                                        child: Text('${index + 1}'),
                                        value: '${index + 1}',
                                      )),
                              onChanged: (String? value) {
                                day = value!;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                hintStyle: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xffACA9A9),
                                ),
                                fillColor: Colors.grey.shade200,
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
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 50.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: month,
                              items: [
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                                'August',
                                'September',
                                'October',
                                'November',
                                'December'
                              ]
                                  .map((e) => DropdownMenuItem(
                                        child: Text('${e}'),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (String? value) {
                                month = value!;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                hintStyle: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xffACA9A9),
                                ),
                                fillColor: Colors.grey.shade200,
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
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: year,
                              items: List.generate(
                                  DateTime.now().year,
                                  (index) => DropdownMenuItem(
                                        child: Text(
                                            '${DateTime.now().year - index}'),
                                        value: '${DateTime.now().year - index}',
                                      )),
                              onChanged: (String? value) {
                                year = value!;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                hintStyle: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: const Color(0xffACA9A9),
                                ),
                                fillColor: Colors.grey.shade200,
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: const Text(
                          'Have you ever had tuberculosis(TB) vaccine'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DropdownButtonFormField<String>(
                        value: title1Selected,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select from this field';
                          }
                        },
                        items: title
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          title1Selected = value!;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: Colors.grey.shade200,
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
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child:
                          const Text('Have you worked in a care home before?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DropdownButtonFormField<String>(
                        value: title2Selected,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select from this field';
                          }
                        },
                        items: title
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          title2Selected = value!;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: Colors.grey.shade200,
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
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: const Text(
                          'Have you worked in demantia care before?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DropdownButtonFormField<String>(
                        value: title3Selected,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select from this field';
                          }
                        },
                        items: title
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          title3Selected = value!;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: Colors.grey.shade200,
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
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: const Text('Do you have a driving license?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DropdownButtonFormField<String>(
                        value: title4Selected,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select from this field';
                          }
                        },
                        items: title
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          title4Selected = value!;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: Colors.grey.shade200,
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
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 30.h, bottom: 20.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            HealthConditions details = HealthConditions();
                            if (status == true) {
                              details.diabetes = '1';
                            } else {
                              details.diabetes = '0';
                            }
                            if (status1 == true) {
                              details.circulatoryDisorder = '1';
                            } else {
                              details.circulatoryDisorder = '0';
                            }
                            if (status2 == true) {
                              details.stomachDisorder = '1';
                            } else {
                              details.stomachDisorder = '0';
                            }
                            if (status5 == true) {
                              details.anyOtherConditionThatMedicationStrictTimetable =
                                  '1';
                            } else {
                              details.anyOtherConditionThatMedicationStrictTimetable =
                                  '0';
                            }
                            if (status4 == true) {
                              details.chronicChestDisorder = '1';
                            } else {
                              details.chronicChestDisorder = '0';
                            }
                            if (status3 == true) {
                              details.deseaseDifficultyInSleep = '1';
                            } else {
                              details.deseaseDifficultyInSleep = '0';
                            }
                            if (status6 == true) {
                              details.haveYouCovid19Symptoms = '1';
                            } else {
                              details.haveYouCovid19Symptoms = '0';
                            }
                            widget.model.healthConditions = details;
                            if (month == 'January') {
                              month = '01';
                            } else if (month == 'February') {
                              month = '02';
                            } else if (month == 'March') {
                              month = '03';
                            } else if (month == 'April') {
                              month = '04';
                            } else if (month == 'May') {
                              month = '05';
                            } else if (month == 'June') {
                              month = '06';
                            } else if (month == 'July') {
                              month = '07';
                            } else if (month == 'August') {
                              month = '08';
                            } else if (month == 'September') {
                              month = '09';
                            } else if (month == 'October') {
                              month = '10';
                            } else if (month == 'November') {
                              month = '11';
                            } else if (month == 'December') {
                              month = '12';
                            }
                            Covid19 detail = Covid19();
                            detail.covid19Test = '$year-$month-$day';
                            detail.tuberculosisVaccine = title1Selected;
                            detail.careHomeBefore = title2Selected;
                            detail.demantiaCareBefore = title3Selected;
                            detail.drivingLicense = title4Selected;
                            widget.model.covid19 = detail;
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
                            HealthConditions details = HealthConditions();
                            if (status == true) {
                              details.diabetes = '1';
                            } else {
                              details.diabetes = '0';
                            }
                            if (status1 == true) {
                              details.circulatoryDisorder = '1';
                            } else {
                              details.circulatoryDisorder = '0';
                            }
                            if (status2 == true) {
                              details.stomachDisorder = '1';
                            } else {
                              details.stomachDisorder = '0';
                            }
                            if (status5 == true) {
                              details.anyOtherConditionThatMedicationStrictTimetable =
                                  '1';
                            } else {
                              details.anyOtherConditionThatMedicationStrictTimetable =
                                  '0';
                            }
                            if (status4 == true) {
                              details.chronicChestDisorder = '1';
                            } else {
                              details.chronicChestDisorder = '0';
                            }
                            if (status3 == true) {
                              details.deseaseDifficultyInSleep = '1';
                            } else {
                              details.deseaseDifficultyInSleep = '0';
                            }
                            if (status6 == true) {
                              details.haveYouCovid19Symptoms = '1';
                            } else {
                              details.haveYouCovid19Symptoms = '0';
                            }
                            widget.model.healthConditions = details;
                            if (month == 'January') {
                              month = '01';
                            } else if (month == 'February') {
                              month = '02';
                            } else if (month == 'March') {
                              month = '03';
                            } else if (month == 'April') {
                              month = '04';
                            } else if (month == 'May') {
                              month = '05';
                            } else if (month == 'June') {
                              month = '06';
                            } else if (month == 'July') {
                              month = '07';
                            } else if (month == 'August') {
                              month = '08';
                            } else if (month == 'September') {
                              month = '09';
                            } else if (month == 'October') {
                              month = '10';
                            } else if (month == 'November') {
                              month = '11';
                            } else if (month == 'December') {
                              month = '12';
                            }
                            Covid19 detail = Covid19();
                            detail.covid19Test = '$year-$month-$day';
                            detail.tuberculosisVaccine = title1Selected;
                            detail.careHomeBefore = title2Selected;
                            detail.demantiaCareBefore = title3Selected;
                            detail.drivingLicense = title4Selected;
                            widget.model.covid19 = detail;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    WorkingTimePage(model: widget.model),
                              ),
                            );
                          },
                          child: Container(
                            height: 60.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pixel_app/Application_Form/WorkingTimeRegulation.dart';
// import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
//
// import '../Constants/Constant.dart';
// import 'BankDetails.dart';
// import 'Covid_19_Questions.dart';
// import 'Model/ApplicationFormModel.dart';
//
// class HealthPage extends StatefulWidget {
//   HealthPage({required this.model});
//   ApplicationFormModel model = new ApplicationFormModel();
//
//   @override
//   State<HealthPage> createState() => _HealthPageState();
// }
//
// class _HealthPageState extends State<HealthPage> {
//   List title = ['Yes', 'No'];
//   var title1Selected = 'Yes';
//   var title2Selected = 'Yes';
//   var title3Selected = 'Yes';
//   var title4Selected = 'Yes';
//   var month = 'September';
//   var day = '1';
//   var year = '2022';
//   var dob;
//   late bool status0yes = false;
//   late bool status1yes = false;
//   late bool status2yes = false;
//   late bool status3yes = false;
//   late bool status4yes = false;
//   late bool status5yes = false;
//   late bool status6yes = false;
//   late bool status7yes = false;
//   late bool status8yes = false;
//   late bool status9yes = false;
//   late bool status10yes = false;
// ////
//   late bool status0no = false;
//   late bool status1no = false;
//   late bool status2no = false;
//   late bool status3no = false;
//   late bool status4no = false;
//   late bool status5no = false;
//   late bool status6no = false;
//   late bool status7no = false;
//   late bool status8no = false;
//   late bool status9no = false;
//   late bool status10no = false;
//
//   // pink color changing variables
//   late int pinkColorChanging = 0;
//
//   late bool pinkColorChanging1 = false;
//   late bool pinkColorChanging2 = false;
//   late bool pinkColorChanging3 = false;
//   late bool pinkColorChanging4 = false;
//   late bool pinkColorChanging5 = false;
//   late bool pinkColorChanging6 = false;
//   late bool pinkColorChanging7 = false;
//
//   Future<void> _SetVals() async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//
//     if (_prefs.getBool("status0yes") != null) {
//       status0yes = _prefs.getBool("status0yes")!;
//     }
//
//     if (_prefs.getBool("status1yes") != null) {
//       status1yes = _prefs.getBool("status1yes")!;
//     }
//     if (_prefs.getBool("status2yes") != null) {
//       status2yes = _prefs.getBool("status2yes")!;
//     }
//     if (_prefs.getBool("status3yes") != null) {
//       status3yes = _prefs.getBool("status3yes")!;
//     }
//     if (_prefs.getBool("status4yes") != null) {
//       status4yes = _prefs.getBool("status4yes")!;
//     }
//     if (_prefs.getBool("status5yes") != null) {
//       status5yes = _prefs.getBool("status5yes")!;
//     }
//     if (_prefs.getBool("status6yes") != null) {
//       status6yes = _prefs.getBool("status6yes")!;
//     }
//     if (_prefs.getBool("status7yes") != null) {
//       status7yes = _prefs.getBool("status7yes")!;
//     }
//     if (_prefs.getBool("status8yes") != null) {
//       status8yes = _prefs.getBool("status8yes")!;
//     }
//     if (_prefs.getBool("status9yes") != null) {
//       status9yes = _prefs.getBool("status9yes")!;
//     }
//     if (_prefs.getBool("status10yes") != null) {
//       status10yes = _prefs.getBool("status10yes")!;
//     }
//     ////////////////////////////////////////////////
//     if (_prefs.getBool("status0no") != null) {
//       status0no = _prefs.getBool("status0no")!;
//     }
//
//     if (_prefs.getBool("status1no") != null) {
//       status1no = _prefs.getBool("status1no")!;
//     }
//     if (_prefs.getBool("status2no") != null) {
//       status2no = _prefs.getBool("status2no")!;
//     }
//     if (_prefs.getBool("status3no") != null) {
//       status3no = _prefs.getBool("status3no")!;
//     }
//     if (_prefs.getBool("status4no") != null) {
//       status4no = _prefs.getBool("status4no")!;
//     }
//     if (_prefs.getBool("status5no") != null) {
//       status5no = _prefs.getBool("status5no")!;
//     }
//     if (_prefs.getBool("status6no") != null) {
//       status6no = _prefs.getBool("status6no")!;
//     }
//     if (_prefs.getBool("status7no") != null) {
//       status7no = _prefs.getBool("status7no")!;
//     }
//     if (_prefs.getBool("status8no") != null) {
//       status8no = _prefs.getBool("status8no")!;
//     }
//     if (_prefs.getBool("status9no") != null) {
//       status9no = _prefs.getBool("status9no")!;
//     }
//     if (_prefs.getBool("status10no") != null) {
//       status10no = _prefs.getBool("status10no")!;
//     }
//     ///////////////////
//     if (_prefs.getString("day3") != null) {
//       day = _prefs.getString("day3").toString();
//     }
//
//     if (_prefs.getString("month3") != null) {
//       month = _prefs.getString("month3").toString();
//     }
//     if (_prefs.getString("year3") != null) {
//       year = _prefs.getString("year3").toString();
//     }
//     if (_prefs.getString("title1Selected") != null) {
//       title1Selected = _prefs.getString("title1Selected").toString();
//     }
//     if (_prefs.getString("title2Selected") != null) {
//       title2Selected = _prefs.getString("title2Selected").toString();
//     }
//     if (_prefs.getString("title3Selected") != null) {
//       title3Selected = _prefs.getString("title3Selected").toString();
//     }
//     if (_prefs.getString("title4Selected") != null) {
//       title4Selected = _prefs.getString("title4Selected").toString();
//     }
//
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     title1Selected = widget.model.covid19?.tuberculosisVaccine ?? "Yes";
//     title2Selected = widget.model.covid19?.careHomeBefore ?? "Yes";
//     title3Selected = widget.model.covid19?.demantiaCareBefore ?? "Yes";
// // TODO: implement initState
//     hide();
//     _SetVals();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       body: WillPopScope(
//         onWillPop: () {
//           bottomNavigationBarState.selectedIndex = 0;
//           Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => bottomNavigationBar()),
//                   (Route route) => false);
//           return false as Future<bool>;
//         },
//         // onWillPop: () => false as Future<bool>,
//         child: SafeArea(
//           child: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(top: 40.h, left: 10.w),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Health Condition',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 27.sp,
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           'Details about your Health Condition',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.w),
//                           height: 30.h,
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.red,
//                                 ),
//                                 child: Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                   size: 20.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 20.h),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                   'Do you suffer from any of the health conditions listed'),
//                               Text('below?'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Diabetes'),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       /// will change
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status0yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status0yes', val!);
//                                             setState(() {
//                                               status0yes = val;
//
//                                               pinkColorChanging1 = val;
//
//                                               if (status0no) {
//                                                 _prefs.setBool(
//                                                     'status0no', !status0yes);
//
//                                                 // changes
//                                                 status0no = !status0yes;
//                                                 // status0no = true;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status0no,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status0no', val!);
//                                             setState(() {
//                                               status0no = val;
//                                               pinkColorChanging1 = val;
//
//                                               if (status0yes) {
//                                                 _prefs.setBool(
//                                                     'status0yes', !status0no);
//                                                 status0yes = !status0no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.6,
//                                   child:
//                                       Text('Heart or Circulatory Disorders')),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status1,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status1 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status1yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status1yes', val!);
//                                             setState(() {
//                                               status1yes = val;
//
//                                               /// will change
//                                               pinkColorChanging2 = val;
//
//
//                                               if (status1no) {
//                                                 _prefs.setBool(
//                                                     'status1no', !status1yes);
//                                                 status1no = !status1yes;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status1no,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status1no', val!);
//                                             setState(() {
//                                               status1no = val;
//                                               pinkColorChanging2 = val;
//
//                                               if (status1yes) {
//                                                 _prefs.setBool(
//                                                     'status1yes', !status1no);
//                                                 status1yes = !status1no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.6,
//                                   child:
//                                       Text('Stomach or Intestinal Disorders')),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status2,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status2 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status2yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status2yes', val!);
//                                             setState(() {
//                                               status2yes = val;
//                                               pinkColorChanging3 = val;
//
//                                               if (status2no) {
//                                                 _prefs.setBool(
//                                                     'status2no', !status2yes);
//                                                 status2no = !status2yes;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status2no,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status2no', val!);
//                                             setState(() {
//                                               status2no = val;
//                                               pinkColorChanging3 = val;
//
//                                               if (status2yes) {
//                                                 _prefs.setBool(
//                                                     'status2yes', !status2no);
//                                                 status2yes = !status2no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.6,
//                                 child: Text(
//                                     'Any disease which cause difficulty in sleeping'),
//                               ),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status3,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status3 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status3yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status3yes', val!);
//                                             setState(() {
//                                               status3yes = val;
//                                               pinkColorChanging4 = val;
//
//                                               if (status3no) {
//                                                 _prefs.setBool(
//                                                     'status3no', !status3yes);
//                                                 status3no = !status3yes;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                         /// no 4 has to change
//                                           value: status3no,
//                                           onChanged: (val) async {
//
//                                             //
//
//                                               SharedPreferences _prefs =
//                                                   await SharedPreferences
//                                                       .getInstance();
//
//                                               _prefs.setBool('status3no', val!);
//
//                                             setState(() async {
//                                               status3no = val;
//                                               pinkColorChanging4 = val;
//
//                                               if (status3yes) {
//                                                 _prefs.setBool(
//                                                     'status3yes', !status3no);
//                                                 status3yes = !status3no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Chronic chest disorders'),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status4,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status4 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status4yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status4yes', val!);
//                                             setState(() {
//                                               status4yes = val;
//                                               pinkColorChanging5 = val;
//
//                                               if (status4no) {
//                                                 _prefs.setBool(
//                                                     'status4no', !status4yes);
//                                                 status4no = !status4yes;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status4no,
//                                           onChanged: (val) {
//                                             setState(() async {
//                                               SharedPreferences _prefs =
//                                                   await SharedPreferences
//                                                       .getInstance();
//
//                                               _prefs.setBool('status4no', val!);
//                                               status4no = val;
//                                               pinkColorChanging5 = val;
//
//                                               if (status4yes) {
//                                                 _prefs.setBool(
//                                                     'status4yes', !status4no);
//                                                 status4yes = !status4no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                     'Any other medical condition, requring medication to a strict timetable?'),
//                               ),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status5,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status5 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status5yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status5yes', val!);
//                                             setState(() {
//                                               status5yes = val;
//                                               pinkColorChanging6 = val;
//                                               _prefs.setBool(
//                                                   'status5no', !status5yes);
//                                               status5no = !status5yes;
//
//
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status5no,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status5no', val!);
//                                             setState(() {
//                                               status5no = val;
//                                               pinkColorChanging6 = val;
//
//                                               if (status5yes) {
//                                                 _prefs.setBool(
//                                                     'status5yes', !status5no);
//                                                 status5yes = !status5no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                   child: Text(
//                                       'Have you recently shown flu-like/COVID-19 Symptoms?')),
//                               // Container(
//                               //   child: FlutterSwitch(
//                               //     //activeColor: Colors.red,
//                               //     toggleColor: Colors.red,
//                               //     activeColor: Colors.grey.shade300,
//                               //     width: 50,
//                               //     height: 25,
//                               //     valueFontSize: 25.0,
//                               //     toggleSize: 20.0,
//                               //     value: status6,
//                               //     borderRadius: 30.0,
//                               //     // padding: 8.0,
//                               //     //showOnOff: true,
//                               //     onToggle: (val) {
//                               //       setState(() {
//                               //         status6 = val;
//                               //       });
//                               //     },
//                               //   ),
//                               // ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text('Yes'),
//                                       Checkbox(
//                                           value: status6yes,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status6yes', val!);
//                                             setState(() {
//                                               status6yes = val;
//
//                                               pinkColorChanging7 = val;
//
//                                               if (status6no) {
//                                                 _prefs.setBool(
//                                                     'status6no', !status6yes);
//                                                 status6no = !status6yes;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//
//                                   Column(
//                                     children: [
//                                       Text('No'),
//                                       Checkbox(
//                                           value: status6no,
//                                           onChanged: (val) async {
//                                             SharedPreferences _prefs =
//                                                 await SharedPreferences
//                                                     .getInstance();
//
//                                             _prefs.setBool('status6no', val!);
//                                             setState(() {
//                                               status6no = val;
//
//                                               pinkColorChanging7 = val;
//
//                                               if (status6yes) {
//                                                 _prefs.setBool(
//                                                     'status6yes', !status6no);
//                                                 status6yes = !status6no;
//                                               }
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.8,
//                                 margin: EdgeInsets.only(top: 20.h),
//                                 child: Text(
//                                     'if you have answered \'yes\' to any of the above questions, you may be asked to see a doctor or nurse.',
//                                     textAlign: TextAlign.justify),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: 20.w, right: 20.w, top: 15.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.8,
//                                 margin: EdgeInsets.only(top: 20.h),
//                                 child: Text(
//                                     'I confirm, in my declaration, that the above information provided is correct to the best of my knowledge.',
//                                     textAlign: TextAlign.justify),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 15.h),
//                         child: Text('Date of last negative COVID-19 test'),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
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
//                                     (index) => DropdownMenuItem(
//                                           child: Text('${index + 1}'),
//                                           value: '${index + 1}',
//                                         )),
//                                 onChanged: (String? value) async {
//                                   day = value!;
//                                   SharedPreferences _prefs =
//                                       await SharedPreferences.getInstance();
//                                   _prefs.setString("day3", value.toString());
//                                   setState(() {});
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
//                                           child: Text('${e}'),
//                                           value: e,
//                                         ))
//                                     .toList(),
//                                 onChanged: (String? value) async {
//                                   month = value!;
//                                   SharedPreferences _prefs =
//                                       await SharedPreferences.getInstance();
//                                   _prefs.setString("month3", value.toString());
//                                   setState(() {});
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
//                                     (index) => DropdownMenuItem(
//                                           child: Text(
//                                               '${DateTime.now().year - index}'),
//                                           value:
//                                               '${DateTime.now().year - index}',
//                                         )),
//                                 onChanged: (String? value) async {
//                                   year = value!;
//                                   SharedPreferences _prefs =
//                                       await SharedPreferences.getInstance();
//                                   _prefs.setString("year3", value.toString());
//                                   setState(() {});
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
//                         child:
//                             Text('Have you ever had tuberculosis(TB) vaccine'),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: DropdownButtonFormField<String>(
//                           value: title1Selected,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please select from this field';
//                             }
//                           },
//                           items: title
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (String? value) async {
//                             title1Selected = value!;
//                             SharedPreferences _prefs =
//                                 await SharedPreferences.getInstance();
//                             _prefs.setString(
//                                 "title1Selected", value.toString());
//                             setState(() {});
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
//                         child: Text('Have you worked in a care home before?'),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: DropdownButtonFormField<String>(
//                           value: title2Selected,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please select from this field';
//                             }
//                           },
//                           items: title
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (String? value) async {
//                             title2Selected = value!;
//                             SharedPreferences _prefs =
//                                 await SharedPreferences.getInstance();
//                             _prefs.setString(
//                                 "title2Selected", value.toString());
//                             setState(() {});
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
//                         child: Text('Have you worked in demantia care before?'),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: DropdownButtonFormField<String>(
//                           value: title3Selected,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please select from this field';
//                             }
//                           },
//                           items: title
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (String? value) async {
//                             title3Selected = value!;
//                             SharedPreferences _prefs =
//                                 await SharedPreferences.getInstance();
//                             _prefs.setString(
//                                 "title3Selected", value.toString());
//                             setState(() {});
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
//                         child: Text('Do you have a driving license?'),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                         child: DropdownButtonFormField<String>(
//                           value: title4Selected,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please select from this field';
//                             }
//                           },
//                           items: title
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (String? value) async {
//                             title4Selected = value!;
//                             SharedPreferences _prefs =
//                                 await SharedPreferences.getInstance();
//                             _prefs.setString(
//                                 "title4Selected", value.toString());
//                             setState(() {});
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
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 20.w, right: 20.w, top: 30.h, bottom: 20.h),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               HealthConditions details = new HealthConditions();
//                               if (status0yes == true) {
//                                 details.diabetes = '1';
//                               } else {
//                                 details.diabetes = '0';
//                               }
//                               if (status1yes == true) {
//                                 details.circulatoryDisorder = '1';
//                               } else {
//                                 details.circulatoryDisorder = '0';
//                               }
//                               if (status2yes == true) {
//                                 details.stomachDisorder = '1';
//                               } else {
//                                 details.stomachDisorder = '0';
//                               }
//                               if (status5yes == true) {
//                                 details.anyOtherConditionThatMedicationStrictTimetable =
//                                     '1';
//                               } else {
//                                 details.anyOtherConditionThatMedicationStrictTimetable =
//                                     '0';
//                               }
//                               if (status4yes == true) {
//                                 details.chronicChestDisorder = '1';
//                               } else {
//                                 details.chronicChestDisorder = '0';
//                               }
//                               if (status3yes == true) {
//                                 details.deseaseDifficultyInSleep = '1';
//                               } else {
//                                 details.deseaseDifficultyInSleep = '0';
//                               }
//                               if (status6yes == true) {
//                                 details.haveYouCovid19Symptoms = '1';
//                               } else {
//                                 details.haveYouCovid19Symptoms = '0';
//                               }
//                               widget.model.healthConditions = details;
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
//                               Covid19 detail = new Covid19();
//                               detail.covid19Test =
//                                   year + '-' + month + '-' + day;
//                               detail.tuberculosisVaccine = title1Selected;
//                               detail.careHomeBefore = title2Selected;
//                               detail.demantiaCareBefore = title3Selected;
//                               detail.drivingLicense = title4Selected;
//                               widget.model.covid19 = detail;
//                               Navigator.of(context).pop();
//                             },
//                             child: Container(
//                               height: 60.h,
//                               width: 300.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Previous',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               HealthConditions details = new HealthConditions();
//                               if (status0yes == true) {
//                                 details.diabetes = '1';
//                               } else {
//                                 details.diabetes = '0';
//                               }
//                               if (status1yes == true) {
//                                 details.circulatoryDisorder = '1';
//                               } else {
//                                 details.circulatoryDisorder = '0';
//                               }
//                               if (status2yes == true) {
//                                 details.stomachDisorder = '1';
//                               } else {
//                                 details.stomachDisorder = '0';
//                               }
//                               if (status5yes == true) {
//                                 details.anyOtherConditionThatMedicationStrictTimetable =
//                                     '1';
//                               } else {
//                                 details.anyOtherConditionThatMedicationStrictTimetable =
//                                     '0';
//                               }
//                               if (status4yes == true) {
//                                 details.chronicChestDisorder = '1';
//                               } else {
//                                 details.chronicChestDisorder = '0';
//                               }
//                               if (status3yes == true) {
//                                 details.deseaseDifficultyInSleep = '1';
//                               } else {
//                                 details.deseaseDifficultyInSleep = '0';
//                               }
//                               if (status6yes == true) {
//                                 details.haveYouCovid19Symptoms = '1';
//                               } else {
//                                 details.haveYouCovid19Symptoms = '0';
//                               }
//                               widget.model.healthConditions = details;
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
//                               Covid19 detail = new Covid19();
//                               detail.covid19Test =
//                                   year + '-' + month + '-' + day;
//                               detail.tuberculosisVaccine = title1Selected;
//                               detail.careHomeBefore = title2Selected;
//                               detail.demantiaCareBefore = title3Selected;
//                               detail.drivingLicense = title4Selected;
//                               widget.model.covid19 = detail;
//
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) =>
//                                       WorkingTimePage(model: widget.model)));
//                             },
//                             child: Container(
//                               height: 60.h,
//                               width: 300.w,
//                               decoration: BoxDecoration(
//                                 // color: Colors.pink,
//                                 color: pinkColorChanging1 == true &&
//                                       pinkColorChanging2 == true &&
//                                         // pinkColorChanging3 == true &&
//                                         // pinkColorChanging4 == true
//                                         // pinkColorChanging5 == true &&
//                                         // pinkColorChanging6 == true &&
//                                         pinkColorChanging7 == true
//                                     ? Colors.pink
//                                     : Color(0xfffaeaea),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Next',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white),
//                                 ),
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
