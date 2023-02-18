import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Controller/AuthController.dart';

class PersonalDetailsPage extends StatefulWidget {
  PersonalDetailsPage({Key? key, this.first}) : super(key: key);
  int? first = 1;
  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formkey = new GlobalKey();
  double rating = 1.0;
  var month = 'September';
  var day = '1';
  var year = '2022';
  var imageLink;
  List country = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua &amp; Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia &amp; Herzegovina",
    "Botswana",
    "Brazil",
    "British Virgin Islands",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Cape Verde",
    "Cayman Islands",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote D Ivoire",
    "Croatia",
    "Cruise Ship",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Polynesia",
    "French West Indies",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Kyrgyz Republic",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Namibia",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Pierre &amp; Miquelon",
    "Samoa",
    "San Marino",
    "Satellite",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "St Kitts &amp; Nevis",
    "St Lucia",
    "St Vincent",
    "St. Lucia",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor L'Este",
    "Togo",
    "Tonga",
    "Trinidad &amp; Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks &amp; Caicos",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "Uruguay",
    "Uzbekistan",
    "Venezuela",
    "Vietnam",
    "Virgin Islands (US)",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];
  var selectedCountry = 'Pakistan';
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  // TextEditingController country = TextEditingController();
  TextEditingController nxt = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
      DropdownMenuItem(child: Text("5"), value: "5"),
      DropdownMenuItem(child: Text("6"), value: "6"),
      DropdownMenuItem(child: Text("7"), value: "7"),
      DropdownMenuItem(child: Text("8"), value: "8"),
      DropdownMenuItem(child: Text("9"), value: "9"),
      DropdownMenuItem(child: Text("10"), value: "10"),
      DropdownMenuItem(child: Text("11"), value: "11"),
      DropdownMenuItem(child: Text("12"), value: "12"),
      DropdownMenuItem(child: Text("13"), value: "13"),
      DropdownMenuItem(child: Text("14"), value: "14"),
      DropdownMenuItem(child: Text("15"), value: "15"),
      DropdownMenuItem(child: Text("16"), value: "16"),
      DropdownMenuItem(child: Text("17"), value: "17"),
      DropdownMenuItem(child: Text("18"), value: "18"),
      DropdownMenuItem(child: Text("19"), value: "19"),
      DropdownMenuItem(child: Text("20"), value: "20"),
      DropdownMenuItem(child: Text("21"), value: "21"),
      DropdownMenuItem(child: Text("22"), value: "22"),
      DropdownMenuItem(child: Text("23"), value: "23"),
      DropdownMenuItem(child: Text("24"), value: "24"),
      DropdownMenuItem(child: Text("25"), value: "25"),
      DropdownMenuItem(child: Text("26"), value: "26"),
      DropdownMenuItem(child: Text("27"), value: "27"),
      DropdownMenuItem(child: Text("28"), value: "28"),
      DropdownMenuItem(child: Text("29"), value: "29"),
      DropdownMenuItem(child: Text("30"), value: "30"),
      DropdownMenuItem(child: Text("31"), value: "31"),
    ];
    return menuItems;
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  AnimationController? controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        lowerBound: 0.8,
        upperBound: 1.2,
        duration: Duration(seconds: 1));

    controller!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
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
          'Personal Details',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<UserModel>(
            future: AuthController().GetUserData(),
            builder: (context, snapShot) {
              UserModel model = new UserModel();

              if (snapShot.hasData) {
                model = snapShot.data!;
                imageLink = snapShot.data!.data?.avatar;
                if (model.data!.dob != null) {
                  year = model.data!.dob.toString().split('-').first;
                  if (model.data!.dob.toString().split('-').elementAt(1) ==
                      01) {
                    month = 'January';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      02) {
                    month = 'February';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      03) {
                    month = 'March';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      04) {
                    month = 'April';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      05) {
                    month = 'May';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      06) {
                    month = 'June';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      07) {
                    month = 'July';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      08) {
                    month = 'August';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      09) {
                    month = 'September';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      10) {
                    month = 'October';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      11) {
                    month = 'November';
                  } else if (model.data!.dob
                          .toString()
                          .split('-')
                          .elementAt(1) ==
                      12) {
                    month = 'December';
                  }
                  day = model.data!.dob.toString().split('-').last;
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(top: 20.h, left: 10.w),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.pop(context);
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
                      //         Text('Personal Details',
                      //             style: TextStyle(
                      //                 fontSize: 15.sp,
                      //                 fontWeight: FontWeight.w600)),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 10.h),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.image,
                              );
                              if (result != null) {
                                File file = File(result.files.single.path!);
                                model.data!.avatar = file.path;
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 70.r,
                                  backgroundImage: NetworkImage(
                                      "${snapShot.data!.data?.avatar}"),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -1,
                                  child: SvgPicture.asset(
                                      'assets/images/camera_icon.svg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 20.h),
                            child:
                                Text('Name', style: TextStyle(fontSize: 15.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: name,
                              onChanged: (value) {
                                model.data!.name = value;
                                setState(() {});
                              },
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18),
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
                                hintText: '${snapShot.data?.data?.name}',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Email',
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: Form(
                              key: formkey,
                              child: TextFormField(
                                controller: email,
                                onChanged: (value) {
                                  if (formkey.currentState!.validate()) {
                                    model.data!.email = value;
                                  }
                                  setState(() {});
                                },
                                validator: (String? value) {
                                  final bool isValid =
                                      EmailValidator.validate(value.toString());

                                  if (!isValid) {
                                    return 'Invalid Email';
                                  }

                                  if (value!.isEmpty) {
                                    return 'Please fillout this field';
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(18),
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
                                  hintText: '${snapShot.data?.data?.email}',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text(
                              'Phone Number',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                model.data!.phone = value;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18),
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
                                hintText: '${snapShot.data?.data?.phone}',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Country',
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: selectedCountry,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please select from this field';
                                }
                              },
                              items: country
                                  .map((e) => DropdownMenuItem<String>(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                model.data?.country = value.toString();
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18),
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
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       top: 10.h, left: 20.w, right: 20.w),
                          //   child: TextFormField(
                          //     controller: country,
                          //     onChanged: (value) {
                          //       model.data!.country = value;
                          //       setState(() {});
                          //     },
                          //     decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.all(18),
                          //       hintStyle: GoogleFonts.dmSans(
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 15.sp,
                          //         color: Color(0xffACA9A9),
                          //       ),
                          //       fillColor: Colors.grey.shade200,
                          //       filled: true,
                          //       border: OutlineInputBorder(
                          //         borderSide: BorderSide.none,
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8),
                          //         ),
                          //       ),
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide.none,
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8),
                          //         ),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide.none,
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8),
                          //         ),
                          //       ),
                          //       hintText: '${snapShot.data?.data?.country}',
                          //     ),
                          //   ),
                          // ),

                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Date of Birth',
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 90.w,
                                  child: DropdownButtonFormField<String>(
                                    value: '1',
                                    items: dropdownItems,
                                    // List.generate(
                                    //     31,
                                    //     (index) =>
                                    // DropdownMenuItem(
                                    //           child: Text('${index + 1}'),
                                    //           value: '${index + 1}',
                                    //         )),

                                    onChanged: (String? value) {
                                      day = value!;
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
                                              value:
                                                  '${DateTime.now().year - index}',
                                            )),
                                    onChanged: (String? value) {
                                      year = value!;
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
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(left: 20.w, top: 15.h),
                              child: Text('Next of Kin',
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: nxt,
                              onChanged: (value) {
                                model.data!.nextOfKin = value;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18),
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
                                hintText: '${snapShot.data?.data?.nextOfKin}',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: GestureDetector(
                          onTap: () async {
                            model.data!.dob = day + '-' + month + '-' + year;
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Container(
                                    child: Center(
                                        child: new CircularProgressIndicator(
                                  color: Color(0xfffaeaea),
                                )));
                              },
                            );
                            var data = await AuthController().UpdateProfile(
                                model: model, imageLink: imageLink);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              '$data',
                              style: TextStyle(color: Colors.white),
                            )));
                          },
                          child: Container(
                            height: 60.h,
                            width: 600.w,
                            decoration: BoxDecoration(
                              color: name.text != "" &&
                                      email.text != "" &&
                                      phone.text != "" &&
                                      selectedCountry != "" &&
                                      nxt.text != ""
                                  ? Colors.pink
                                  : Color(0xfffaeaea),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: name.text != "" &&
                                            email.text != "" &&
                                            phone.text != "" &&
                                            selectedCountry != "" &&
                                            nxt.text != ""
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
