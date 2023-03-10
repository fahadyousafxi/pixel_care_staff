import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/HealthCondition.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';
import 'Model/ApplicationFormModel.dart';

class BankDetailPage extends StatefulWidget {
  BankDetailPage({required this.model});
  ApplicationFormModel model = ApplicationFormModel();
  @override
  State<BankDetailPage> createState() => _BankDetailPageState();
}

class _BankDetailPageState extends State<BankDetailPage> {
  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        onChanged: (val) {
          setState(() {});
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: const Color(0xffACA9A9),
          ),
          fillColor: const Color(0xfff0f0f0),
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
          hintText: hinttext,
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController companyname = TextEditingController();
  TextEditingController bankname = TextEditingController();
  TextEditingController accountname = TextEditingController();
  TextEditingController accountnum = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController branch = TextEditingController();
  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("companyname") != null) {
      companyname.text = _prefs.getString("companyname").toString();
    }

    if (_prefs.getString("bankname") != null) {
      bankname.text = _prefs.getString("bankname").toString();
    }
    if (_prefs.getString("accountname") != null) {
      accountname.text = _prefs.getString("accountname").toString();
    }
    if (_prefs.getString("accountnum") != null) {
      accountnum.text = _prefs.getString("accountnum").toString();
    }
    if (_prefs.getString("codeb") != null) {
      code.text = _prefs.getString("codeb").toString();
    }
    if (_prefs.getString("branch") != null) {
      branch.text = _prefs.getString("branch").toString();
    }

    setState(() {});
  }

  @override
  void initState() {
    hide();
    bankname.text = widget.model.bankDetails?.nameOfBank ?? "";
    accountname.text = widget.model.bankDetails?.accountName ?? "";
    accountnum.text = widget.model.bankDetails?.accountNo ?? "";
    code.text = widget.model.bankDetails?.sortCode ?? "";
    Future.delayed(const Duration(seconds: 1)).then((value) {
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
              MaterialPageRoute(
                  builder: (context) => const bottomNavigationBar()),
              (Route route) => false);
          return false as Future<bool>;
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h, left: 10.w),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bank Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
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
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade200,
                          ),
                        ),
                        const Spacer(),
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
                        child: const Text('Name of Bank'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: bankname,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (val) async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            _prefs.setString("bankname", val);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintStyle: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: const Color(0xffACA9A9),
                            ),
                            fillColor: const Color(0xfff0f0f0),
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
                            hintText: 'Enter name',
                          ),
                        ),
                      ),

                      // MyTextField(
                      //   controller: bankname,
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter name',
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: const Text('Account Name'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: accountname,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (val) async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            _prefs.setString("accountname", val);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintStyle: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: const Color(0xffACA9A9),
                            ),
                            fillColor: const Color(0xfff0f0f0),
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
                            hintText: 'Enter account name',
                          ),
                        ),
                      ),

                      // MyTextField(
                      //   controller: accountname,
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter account name',
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: const Text('Account Number '),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: accountnum,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (val) async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            _prefs.setString("accountnum", val);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintStyle: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: const Color(0xffACA9A9),
                            ),
                            fillColor: const Color(0xfff0f0f0),
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
                            hintText: 'Enter account number',
                          ),
                        ),
                      ),
                      // MyTextField(
                      //   controller: accountnum,
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter account number',
                      // ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: const Text('Sort Code'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        child: TextFormField(
                          controller: code,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (val) async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            _prefs.setString("codeb", val);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill out this field';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintStyle: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: const Color(0xffACA9A9),
                            ),
                            fillColor: const Color(0xfff0f0f0),
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
                            hintText: 'Enter sort code',
                          ),
                        ),
                      ),

                      // MyTextField(
                      //   controller: code,
                      //   decoration: InputDecoration(),
                      //   hinttext: 'Enter sort code',
                      // ),
                      SizedBox(height: 130.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 20.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  BankDetails details = BankDetails();
                                  details.accountName = accountname.text;
                                  details.accountNo = accountnum.text;
                                  details.nameOfBank = bankname.text;
                                  details.sortCode = code.text;
                                  widget.model.bankDetails = details;
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
                                  print(widget.model.bankDetails);
                                  if (formKey.currentState!.validate()) {
                                    BankDetails details = BankDetails();
                                    details.accountName = accountname.text;
                                    details.accountNo = accountnum.text;
                                    details.nameOfBank = bankname.text;
                                    details.sortCode = code.text;
                                    widget.model.bankDetails = details;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HealthPage(
                                          model: widget.model,
                                        ),
                                      ),
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
                                            : const Color(0xfffaeaea),
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
                                                : Colors.grey.shade500,
                                      ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
