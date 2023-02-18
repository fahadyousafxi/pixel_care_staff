import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pixel_app/Application_Form/declearation.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';
import 'Model/ApplicationFormModel.dart';

class WorkingTimePage extends StatefulWidget {
  WorkingTimePage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<WorkingTimePage> createState() => _WorkingTimePageState();
}

class _WorkingTimePageState extends State<WorkingTimePage> {
  bool isChecked1 = true;
  bool isChecked2 = false;
  var grp;
  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getBool("isChecked1") != null) {
      isChecked1 = _prefs.getBool("isChecked1")!;
    }
    if (_prefs.getBool("isChecked2") != null) {
      isChecked2 = _prefs.getBool("isChecked2")!;
    }

    setState(() {});
  }

  @override
  void initState() {
    widget.model.timeRegulations?.doNotOtpOut == 0 ? grp = 1 : grp = 0;
    // TODO: implement initState
    hide();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: WillPopScope(

        onWillPop: () {
          bottomNavigationBarState.selectedIndex = 0;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => bottomNavigationBar()),
                  (Route route) => false);
          return false as Future<bool>;
        },
        // onWillPop: () => false as Future<bool>,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              //height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Container(
                    padding:
                        EdgeInsets.only(top: 40.h, left: 10.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Working Time Regulations 1998',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 23.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '48 hours opt in/out program',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                    width: 700.w,
                    child: Text(
                      'Regulations 4 of the Working Time Regulations 1998 policy (as amended, the ”WTR”) limits the average working week to 48 hours (average being calculated over a standard 17-week reference period, which can be extended to 26 to 52 weeks in certain circumstances).',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  Container(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                      width: 700.w,
                      child: Text(
                        'The worker can opt out of the 48 hours maximum but must give written notice that they intend to do so.The worker can later provide notice if they wish to opt back into the 48-hour working time limit.\n\nPlease Select of the Following options:',
                        textAlign: TextAlign.justify,
                      )),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.w),
                  //   child: Column(
                  //     children: [

                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 40.h),
                  RadioListTile(
                    activeColor: Colors.red,
                    value: 1,
                    onChanged: (newValue) => setState(() => grp = newValue),
                    groupValue: grp,
                    title: Text(
                        'I do wish to opt out of the 48-hours average working week.'),
                  ),
                  RadioListTile(
                    activeColor: Colors.red,
                    value: 0,
                    onChanged: (newValue) => setState(() => grp = newValue),
                    groupValue: grp,
                    title: Text(
                        'I do not wish to opt out of the 48-hours average working week.'),
                  ),
                  SizedBox(height: 100.h),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 30.h, bottom: 20.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              TimeRegulations reg = new TimeRegulations();
                              grp == 0 ? reg.otpOut = 1 : reg.otpOut = 0;
                              grp == 1
                                  ? reg.doNotOtpOut = 0
                                  : reg.doNotOtpOut = 1;
                              widget.model.timeRegulations = reg;
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 60.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
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
                              TimeRegulations reg = new TimeRegulations();
                              grp == 0 ? reg.otpOut = 1 : reg.otpOut = 0;
                              grp == 1
                                  ? reg.doNotOtpOut = 0
                                  : reg.doNotOtpOut = 1;
                              widget.model.timeRegulations = reg;
                              if (grp != null)
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Declaration(model: widget.model)));
                            },
                            child: Container(
                              height: 60.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: grp == null
                                    ? Color(0xfffaeaea)
                                    : Colors.pink,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: grp == null
                                          ? Colors.grey.shade500
                                          : Colors.white),
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
      ),
    );
  }
}
