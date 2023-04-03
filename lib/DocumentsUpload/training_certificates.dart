import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Constants/Constant.dart';

import '../Application_Form/Trainings.dart';
import '../Controller/AuthController.dart';
import '../screens/ProfileTrainingCertificate.dart';

class TrainingCertificates extends StatefulWidget {
  const TrainingCertificates({Key? key}) : super(key: key);

  @override
  State<TrainingCertificates> createState() => _TrainingCertificatesState();
}

class _TrainingCertificatesState extends State<TrainingCertificates> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  List<File>? images = [];
  List<String>? pdfs = [];

  var date;
  var month = 'September';
  var day = '1';
  var year = '2023';
  var month1 = 'September';
  var day1 = '1';
  var year1 = '2022';
  var expiry;
  List title = [
    "Complaints Handling",
    "Conflict Resolution",
    "COSHH",
    "Countering Fraud Bribery and Corruption in the (NHS)",
    "Domestic Violence and Abuse",
    "Dysphagia Care",
    "Epilepsy Awareness",
    "Equality, Diversity and Human Rights",
    "Fire Safety",
    "First Aid In The Workplace",
    "Food Hygiene",
    "General Data Protection Regulations",
    "Handling Medication & Avoiding Drug Errors - Level 2",
    "Health, Safety and Welfare",
    "Infection Prevention and Control (Level 1)",
    "Infection Prevention and Control (Level 2)",
    "Information Governance including Cyber Security",
    "Learning Disabilities Awareness",
    "Lone Worker",
    "Management of Anaphylaxis",
    "Medication Management (Social Workers Only)",
    "Mental Capacity Act 2005 inc Deprivation of Liberty Safeguards (DoLS)",
    "Moving and Handling Level 1",
    "Moving and Handling Level 2",
    "National Early Warning Score 2 (NEWS2)",
    "Numeracy and Drug Calculations",
    "Preventing Radicalisation",
    "Rapid Tranquillisation",
    "Reducing Restraints in Health and Social Care",
    "Resuscitation: Adult Basic Life Support - incl safe use of AEDs",
    "RIDDOR",
    "Safeguarding Children (SOCA) Level 1",
    "Safeguarding Children (SOCA) Level 2",
    "Safeguarding Vulnerable Adults (SOVA) Level 1",
    "Safeguarding Vulnerable Adults (SOVA) Level 2",
    "Sepsis Awareness",
    "Coronavirus (COVID-19) Infection Prevention and Control",
    "Mental Health Act 2007",
    "Paediatric Basic Life Support",
    "Safeguarding Children (SOCA) Level 3",
    "Safeguarding Vulnerable Adults (SOVA) Level 3",
    "Blood Component Transfusion",
    "Communication",
    "Consent",
    "Dementia Awareness",
    "Duty of Care in Health and Social Care",
    "Fluids and Nutrition",
    "Privacy And Dignity In Health And Social Care",
    "Promoting Person Centred Care In Health And Social Care",
    "Your Health Career",
  ];
  var titleSelected = 'Complaints Handling';
  //  DateTime now = DateTime.now();
  //   int dayn = now.day;
  //   int monthn = now.month;
  //   int yearn = now.year
  @override
  void initState() {
    // TODO: implement initState

    hide();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (navigator) {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainingCertificateProfile(
                            model: model1,
                          )));
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainingPage(
                            model: model1,
                          )));
            }
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
            size: 20.sp,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Text(
          'Training Certificates',
          style: TextStyle(
              fontSize: 19.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => false as Future<bool>,
        child: SingleChildScrollView(
          child: Container(
              color: Colors.grey.shade50,
              padding: const EdgeInsets.all(17),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 0.w),
                                child: Text(
                                  'Certifiates',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.w, right: 0.w, top: 20),
                                child: DropdownButtonFormField<String>(
                                  value: titleSelected,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please select from this field';
                                    }
                                  },
                                  items: title
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Text(e),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ))),
                                          ),
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      titleSelected = value!;
                                    });
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
                          SizedBox(height: 10.h),
                          Text(
                            'Date of Completion',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          // TextFormField(
                          //   onChanged: (value){
                          //     date=value;
                          //   },
                          //   validator: (value){
                          //     if(value!.isEmpty){
                          //       return 'Please fill out this field';
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.all(18),
                          //     hintStyle: GoogleFonts.dmSans(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 15.sp,
                          //       color: Color(0xffACA9A9),
                          //     ),
                          //     fillColor: Color(0xffF3F3F4),
                          //     filled: true,
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     hintText: 'Enter date of completion',
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 90.w,
                                  child: DropdownButtonFormField<String>(
                                    value: day1,
                                    items: List.generate(
                                        31,
                                        (index) => DropdownMenuItem(
                                              child: Text('${index + 1}'),
                                              value: '${index + 1}',
                                            )),
                                    onChanged: (String? value) {
                                      day1 = value!;
                                      setState(() {
                                        day = day1;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                    value: month1,
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
                                              value: e,
                                              child: Text('${e}'),
                                            ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      month1 = value!;
                                      setState(() {
                                        month = month1;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                    value: year1,
                                    items: List.generate(
                                        DateTime.now().year,
                                        (index) => DropdownMenuItem(
                                              child: Text(
                                                  '${DateTime.now().year - index}'),
                                              value:
                                                  '${DateTime.now().year - index}',
                                            )),
                                    onChanged: (String? value) {
                                      year1 = value!;
                                      setState(() {
                                        year = "${int.parse(year1) + 1}";
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry Date',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // TextFormField(
                          //   onChanged: (value){
                          //     expiry=value;
                          //   },
                          //   validator: (value){
                          //     if(value!.isEmpty){
                          //       return 'Please fill out this field';
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.all(18),
                          //     hintStyle: GoogleFonts.dmSans(
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 15.sp,
                          //       color: Color(0xffACA9A9),
                          //     ),
                          //     fillColor: Color(0xffF3F3F4),
                          //     filled: true,
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8),
                          //       ),
                          //     ),
                          //     hintText: 'Enter expiry date',
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 90.w,
                                  child: IgnorePointer(
                                    child: DropdownButtonFormField<String>(
                                      value: day,
                                      items: List.generate(
                                          31,
                                          (index) => DropdownMenuItem(
                                                enabled: false,
                                                child: Text('${index + 1}'),
                                                value: '${index + 1}',
                                              )),
                                      onChanged: (String? value) {
                                        // day=value!;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
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
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  height: 50.h,
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IgnorePointer(
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
                                        // month=value!;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
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
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  height: 50.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IgnorePointer(
                                    child: DropdownButtonFormField<String>(
                                      value: year,
                                      items: List.generate(
                                          DateTime.now().year + 1,
                                          (index) => DropdownMenuItem(
                                                child: Text(
                                                    '${DateTime.now().year + 1 - index}'),
                                                value:
                                                    '${DateTime.now().year + 1 - index}',
                                              )),
                                      onChanged: (String? value) {
                                        // year=value!;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
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
                        children: List.generate(images!.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .2,

                        /// pdf changes

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              images!.elementAt(index),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                // margin: EdgeInsets.all(88),
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(color: Colors.black),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      images!.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // child: Stack(
                        //   children: [
                        //     if (pdfs != null)
                        //       Container(
                        //         margin: EdgeInsets.symmetric(vertical: 5),
                        //         width: MediaQuery.of(context).size.width,
                        //         height: MediaQuery.of(context).size.height * .3,
                        //         child: PDFView(
                        //           filePath: pdfs!.elementAt(index),
                        //           fitEachPage: true,
                        //
                        //           // fitPolicy: ,
                        //         ),
                        //       ),
                        //     if (images != null)
                        //       Container(
                        //        decoration: BoxDecoration(
                        //            image: DecorationImage(
                        //                image: FileImage(images!.elementAt(index)))),
                        //         )
                        //     else Container(
                        //       decoration: BoxDecoration(
                        //           image: DecorationImage(
                        //               image: FileImage(images!.elementAt(index)))),
                        //     )
                        //
                        //       // Image.file(
                        //       //   images! as File,
                        //       //   fit: BoxFit.cover,
                        //       // ),
                        //   ],
                        // ),
                      );
                    })),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () async {
                        // _modalBottomSheetMenu();
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.image,
                        );
                        if (result != null) {
                          result.files.forEach((element) {
                            File file = File(element.path!);
                            setState(() {
                              images!.add(file);
                            });
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        dashPattern: [
                          10,
                          10,
                        ],
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_present_rounded,
                                  color: Colors.grey,
                                  size: 70.sp,
                                ),
                                // SvgPicture.asset(
                                //   'assets/images/multiplephotosicon.svg',
                                //   color: Colors.black,
                                //   height: 80.h,
                                //   width: 80.w,
                                // ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Tap to upload file',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Text(
                                //   'File should be .jpg and less than 10 MB',
                                //   style: TextStyle(
                                //       fontSize: 15.sp, color: Colors.grey),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    InkWell(
                      onTap: () async {
                        if (month1 == 'January') {
                          month1 = '01';
                        } else if (month1 == 'February') {
                          month1 = '02';
                        } else if (month1 == 'March') {
                          month1 = '03';
                        } else if (month1 == 'April') {
                          month1 = '04';
                        } else if (month1 == 'May') {
                          month1 = '05';
                        } else if (month1 == 'June') {
                          month1 = '06';
                        } else if (month1 == 'July') {
                          month1 = '07';
                        } else if (month1 == 'August') {
                          month1 = '08';
                        } else if (month1 == 'September') {
                          month1 = '09';
                        } else if (month1 == 'October') {
                          month1 = '10';
                        } else if (month1 == 'November') {
                          month1 = '11';
                        } else if (month1 == 'December') {
                          month1 = '12';
                        }
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
                        expiry = year + '-' + month + '-' + day;
                        date = year1 + '-' + month1 + '-' + day1;
                        if (formKey.currentState!.validate()) {
                          if (images!.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              'Please input images',
                              style: TextStyle(color: Colors.white),
                            )));
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Container(
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                  color: Color(0xfffaeaea),
                                )));
                              },
                            );

                            var data = await AuthController()
                                .UpdateTrainingCert(
                                    completion: date,
                                    expiry: expiry,
                                    images: images,
                                    position:
                                        "${title.indexOf(titleSelected) + 1}");

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              '$data',
                              style: const TextStyle(color: Colors.white),
                            )));
                            if (navigator) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TrainingCertificateProfile(
                                            model: model1,
                                          )));
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrainingPage(
                                            model: model1,
                                          )));
                            }
                          }
                        }
                      },
                      child: Container(
                        height: 60.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: images!.isNotEmpty
                              ? Colors.pink
                              : const Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: images!.isNotEmpty
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.white, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                // decoration: new BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: new BorderRadius.only(
                //         topLeft: const Radius.circular(10.0),
                //         topRight: const Radius.circular(10.0))),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.image,
                    );
                    if (result != null) {
                      result.files.forEach((element) {
                        File file = File(element.path!);
                        setState(() {
                          images!.add(file);
                        });
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: const Center(
                    child: Text("Pick From Gallary"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.any,
                    );
                    if (result != null) {
                      result.files.forEach((element) {
                        File file = File(element.path!);
                        setState(() {
                          images!.add(file);
                        });
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: const Center(
                    child: Text("Pick From Files"),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
