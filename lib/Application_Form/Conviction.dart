import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';

import '../Constants/Constant.dart';
import 'Address.dart';
import 'BankDetails.dart';
import 'Covid_19_Questions.dart';
import 'Model/ApplicationFormModel.dart';
import 'Next_of_Kin.dart';

class ConvictionPage extends StatefulWidget {
  ConvictionPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<ConvictionPage> createState() => _ConvictionPageState();
}

class _ConvictionPageState extends State<ConvictionPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    hide();
    controller.text = widget.model.convictions?.disclosure ?? "";
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        formKey.currentState?.validate();
      });
    }); // TODO: implement initState
    _SetVals();
    super.initState();
  }

  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString("dics") != null) {
      controller.text = _prefs.getString("dics").toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () {
            bottomNavigationBarState.selectedIndex = 0;
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => bottomNavigationBar()),
                (Route route) => false);
            return false as Future<bool>;
          },
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(top: 40.h, left: 10.w, right: 10),
                      child: Column(
                        children: [
                          Text(
                            'Convictions',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Upon offer of employement we reserve the right to request a Criminal Records Bearing Disclosure at standard level and this disclosure will include details of cautions, reprimands or final warnings as well as convictions.',
                            textAlign: TextAlign.justify,
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
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
                          SizedBox(height: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Disclosure'),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(top: 10.h, left: 20.w),
                                height: 200.h,
                                width: 600.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: TextFormField(
                                  onChanged: (val) async {
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("dics", val);
                                    setState(() {});
                                  },
                                  controller: controller,
                                  maxLines: 100,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please fill out this field';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(18),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Color(0xfff0f0f0),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    hintText:
                                        'Write about any criminal proceedings',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                                if (true) {
                                  Convictions convic = new Convictions();
                                  convic.disclosure = controller.text;
                                  widget.model.convictions = convic;
                                  print(widget.model.toJson());
                                  Navigator.of(context).pop();
                                }
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
                                if (formKey.currentState!.validate()) {
                                  Convictions convic = new Convictions();
                                  convic.disclosure = controller.text;
                                  widget.model.convictions = convic;
                                  print(widget.model.toJson());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NextOfKinPage(model: widget.model)),
                                  );
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color:
                                      formKey.currentState?.validate() == true
                                          ? Colors.pink
                                          : Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            formKey.currentState?.validate() ==
                                                    true
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
