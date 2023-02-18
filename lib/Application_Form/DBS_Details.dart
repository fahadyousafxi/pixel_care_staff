import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import '../Constants/Constant.dart';
import 'Educational_Details.dart';
import 'Model/ApplicationFormModel.dart';

class DBSPage extends StatefulWidget {
  DBSPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();
  @override
  State<DBSPage> createState() => _DBSPageState();
}

class _DBSPageState extends State<DBSPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController code = new TextEditingController();
  TextEditingController num = new TextEditingController();
  List title = ['Yes', 'No'];
  List title2 = ['Yes', 'No'];
  var titleSelected = 'Yes';
  var title2Selected = 'Yes';
  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("numdb") != null) {
      num.text = _prefs.getString("numdbdb").toString();
    }

    if (_prefs.getString("codedbs") != null) {
      code.text = _prefs.getString("codedbs").toString();
    }
    if (_prefs.getString("Title2") != null) {
      titleSelected = _prefs.getString("Title2").toString();
    }
    if (_prefs.getString("Title3") != null) {
      title2Selected = _prefs.getString("Title3").toString();
    }

    setState(() {});
  }

  @override
  void initState() {
    hide();
    titleSelected = widget.model.dbsDetail?.registerOnlineDbs ?? "Yes";
    title2Selected = widget.model.dbsDetail?.permissionToCheckOnline ?? "Yes";
    code.text = widget.model.dbsDetail?.codeNo ?? "";
    num.text = widget.model.dbsDetail?.dbsCertificationNo ?? "";
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        formKey.currentState?.validate();
      });
    });
    _SetVals();
    // TODO: implement initState
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
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                height: 844.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, left: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'DBS Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Detail about Disclosure & Barring Service',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20.h),
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
                        ],
                      ),
                    ),
                    // SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('DBS Certificate Number'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("numdb", val.toString());
                              setState(() {});
                            },
                            controller: num,
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
                              hintText: 'Enter DBS certificate number',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Are you registered online with DBS? '),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: DropdownButtonFormField<String>(
                            value: "Yes",
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
                            onChanged: (String? value) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Title2", value.toString());

                              titleSelected = value!;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Color(0xffACA9A9),
                              ),
                              fillColor: Colors.grey.shade200,
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
                            ),
                          ),
                        ),
                        Visibility(
                            visible: titleSelected == 'No',
                            child: Container(
                              height: 200.h,
                            )),
                        Visibility(
                          visible: titleSelected == 'Yes',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text('Code number'),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: TextFormField(
                                  onChanged: (val) async {
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("codedbs", val.toString());
                                    setState(() {});
                                  },
                                  controller: code,
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
                                    hintText: 'Enter code number',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                                child: Text(
                                    'Do we have permission to check online?'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: DropdownButtonFormField<String>(
                                  value: "Yes",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please select from this field';
                                    }
                                  },
                                  items: title2
                                      .map((e) => DropdownMenuItem<String>(
                                            child: Text(e),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (String? value) async {
                                    title2Selected = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString(
                                        "Title3", value.toString());
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                DbsDetail dbs = new DbsDetail();
                                dbs.codeNo = code.text;
                                dbs.dbsCertificationNo = num.text;
                                dbs.permissionToCheckOnline = title2Selected;
                                dbs.registerOnlineDbs = titleSelected;
                                widget.model.dbsDetail = dbs;
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
                                if (formKey.currentState!.validate()) {
                                  DbsDetail dbs = new DbsDetail();
                                  dbs.codeNo = code.text;
                                  dbs.dbsCertificationNo = num.text;
                                  dbs.permissionToCheckOnline = title2Selected;
                                  dbs.registerOnlineDbs = titleSelected;
                                  widget.model.dbsDetail = dbs;
                                  print(widget.model.toJson());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EducationalPage(
                                            model: widget.model)),
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
                                          : num.text.isNotEmpty &&
                                                  titleSelected == "No"
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
                                                : num.text.isNotEmpty &&
                                                        titleSelected == "No"
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
                    SizedBox(height: 10.h),
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
