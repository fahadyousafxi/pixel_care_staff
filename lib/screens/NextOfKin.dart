import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Controller/AuthController.dart';
import 'package:pixel_app/Model/NextKinModel.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class NextKinPage extends StatefulWidget {
  const NextKinPage({Key? key}) : super(key: key);

  @override
  State<NextKinPage> createState() => _NextKinPageState();
}

class _NextKinPageState extends State<NextKinPage> {
  var title = 'Mother';
  // Widget MyTextField(
  //     {required InputDecoration decoration,
  //     required String hinttext,
  //     var onChanged}) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
  //     child: TextFormField(
  //       onChanged: onChanged,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return 'Please fill out this field';
  //         }
  //       },
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(18),
  //         hintStyle: GoogleFonts.dmSans(
  //           fontWeight: FontWeight.w500,
  //           fontSize: 15.sp,
  //           color: Color(0xffACA9A9),
  //         ),
  //         fillColor: Colors.grey.shade200,
  //         filled: true,
  //         border: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(8),
  //           ),
  //         ),
  //         hintText: hinttext,
  //       ),
  //     ),
  //   );
  // }

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  // TextEditingController city = TextEditingController();

  String? countryValue = "Pakistan";
  String? stateValue = "Islamabad";
  String? cityValue = "Islamabad";

  // List country = [
  //   "Afghanistan",
  //   "Albania",
  //   "Algeria",
  //   "Andorra",
  //   "Angola",
  //   "Anguilla",
  //   "Antigua &amp; Barbuda",
  //   "Argentina",
  //   "Armenia",
  //   "Aruba",
  //   "Australia",
  //   "Austria",
  //   "Azerbaijan",
  //   "Bahamas",
  //   "Bahrain",
  //   "Bangladesh",
  //   "Barbados",
  //   "Belarus",
  //   "Belgium",
  //   "Belize",
  //   "Benin",
  //   "Bermuda",
  //   "Bhutan",
  //   "Bolivia",
  //   "Bosnia &amp; Herzegovina",
  //   "Botswana",
  //   "Brazil",
  //   "British Virgin Islands",
  //   "Brunei",
  //   "Bulgaria",
  //   "Burkina Faso",
  //   "Burundi",
  //   "Cambodia",
  //   "Cameroon",
  //   "Cape Verde",
  //   "Cayman Islands",
  //   "Chad",
  //   "Chile",
  //   "China",
  //   "Colombia",
  //   "Congo",
  //   "Cook Islands",
  //   "Costa Rica",
  //   "Cote D Ivoire",
  //   "Croatia",
  //   "Cruise Ship",
  //   "Cuba",
  //   "Cyprus",
  //   "Czech Republic",
  //   "Denmark",
  //   "Djibouti",
  //   "Dominica",
  //   "Dominican Republic",
  //   "Ecuador",
  //   "Egypt",
  //   "El Salvador",
  //   "Equatorial Guinea",
  //   "Estonia",
  //   "Ethiopia",
  //   "Falkland Islands",
  //   "Faroe Islands",
  //   "Fiji",
  //   "Finland",
  //   "France",
  //   "French Polynesia",
  //   "French West Indies",
  //   "Gabon",
  //   "Gambia",
  //   "Georgia",
  //   "Germany",
  //   "Ghana",
  //   "Gibraltar",
  //   "Greece",
  //   "Greenland",
  //   "Grenada",
  //   "Guam",
  //   "Guatemala",
  //   "Guernsey",
  //   "Guinea",
  //   "Guinea Bissau",
  //   "Guyana",
  //   "Haiti",
  //   "Honduras",
  //   "Hong Kong",
  //   "Hungary",
  //   "Iceland",
  //   "India",
  //   "Indonesia",
  //   "Iran",
  //   "Iraq",
  //   "Ireland",
  //   "Isle of Man",
  //   "Israel",
  //   "Italy",
  //   "Jamaica",
  //   "Japan",
  //   "Jersey",
  //   "Jordan",
  //   "Kazakhstan",
  //   "Kenya",
  //   "Kuwait",
  //   "Kyrgyz Republic",
  //   "Laos",
  //   "Latvia",
  //   "Lebanon",
  //   "Lesotho",
  //   "Liberia",
  //   "Libya",
  //   "Liechtenstein",
  //   "Lithuania",
  //   "Luxembourg",
  //   "Macau",
  //   "Macedonia",
  //   "Madagascar",
  //   "Malawi",
  //   "Malaysia",
  //   "Maldives",
  //   "Mali",
  //   "Malta",
  //   "Mauritania",
  //   "Mauritius",
  //   "Mexico",
  //   "Moldova",
  //   "Monaco",
  //   "Mongolia",
  //   "Montenegro",
  //   "Montserrat",
  //   "Morocco",
  //   "Mozambique",
  //   "Namibia",
  //   "Nepal",
  //   "Netherlands",
  //   "Netherlands Antilles",
  //   "New Caledonia",
  //   "New Zealand",
  //   "Nicaragua",
  //   "Niger",
  //   "Nigeria",
  //   "Norway",
  //   "Oman",
  //   "Pakistan",
  //   "Palestine",
  //   "Panama",
  //   "Papua New Guinea",
  //   "Paraguay",
  //   "Peru",
  //   "Philippines",
  //   "Poland",
  //   "Portugal",
  //   "Puerto Rico",
  //   "Qatar",
  //   "Reunion",
  //   "Romania",
  //   "Russia",
  //   "Rwanda",
  //   "Saint Pierre &amp; Miquelon",
  //   "Samoa",
  //   "San Marino",
  //   "Satellite",
  //   "Saudi Arabia",
  //   "Senegal",
  //   "Serbia",
  //   "Seychelles",
  //   "Sierra Leone",
  //   "Singapore",
  //   "Slovakia",
  //   "Slovenia",
  //   "South Africa",
  //   "South Korea",
  //   "Spain",
  //   "Sri Lanka",
  //   "St Kitts &amp; Nevis",
  //   "St Lucia",
  //   "St Vincent",
  //   "St. Lucia",
  //   "Sudan",
  //   "Suriname",
  //   "Swaziland",
  //   "Sweden",
  //   "Switzerland",
  //   "Syria",
  //   "Taiwan",
  //   "Tajikistan",
  //   "Tanzania",
  //   "Thailand",
  //   "Timor L'Este",
  //   "Togo",
  //   "Tonga",
  //   "Trinidad &amp; Tobago",
  //   "Tunisia",
  //   "Turkey",
  //   "Turkmenistan",
  //   "Turks &amp; Caicos",
  //   "Uganda",
  //   "Ukraine",
  //   "United Arab Emirates",
  //   "United Kingdom",
  //   "Uruguay",
  //   "Uzbekistan",
  //   "Venezuela",
  //   "Vietnam",
  //   "Virgin Islands (US)",
  //   "Yemen",
  //   "Zambia",
  //   "Zimbabwe"
  // ];

  var areufree;
  var selectedCountry = 'Pakistan';
  var City = '';

  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Next of Kin',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<NextKinModel>(
              future: AuthController().GetNextKinUi(),
              builder: (context, snapshot) {
                NextKinModel model = new NextKinModel();
                if (snapshot.hasData) {
                  model = snapshot.data!;
                }
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(top: 20.h, left: 10.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           Navigator.pop(context);
                      //         },
                      //         child: Icon(
                      //           Icons.arrow_back_ios_outlined,
                      //           size: 15.sp,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       SizedBox(width: 5.w),
                      //       Text(
                      //         'Next of Kin',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w600, fontSize: 17.sp),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 10.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Text(
                              'Title',
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please select title';
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
                                hintText: 'Choose title',
                              ),
                              items: [
                                'Mother',
                                'Father',
                                'Spouse',
                                'Son',
                                'Daughter',
                                'Siblings',
                                'Uncle',
                                'Friend',
                                'Teacher',
                                'Colleague'
                              ]
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      value: e,
                                    ),
                                  )
                                  .toList(),
                              value: title,
                              onChanged: (String? value) {
                                title = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child:
                                Text('Name', style: TextStyle(fontSize: 17.sp)),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: name,
                              onChanged: (value) {
                                model.data?.name = value.toString();
                                setState(() {});
                              },
                              textCapitalization: TextCapitalization.words,
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
                                hintText: 'Enter name',
                              ),
                            ),
                          ),
                          // MyTextField(
                          //   decoration: InputDecoration(),
                          //   onChanged: (value) {
                          //     model.data?.name = value.toString();
                          //   },
                          //   hinttext: 'Enter name',
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Address',
                                style: TextStyle(fontSize: 17.sp)),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: address,
                              onChanged: (value) {
                                model.data?.address = value.toString();
                                setState(() {});
                              },
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
                                hintText: 'Enter address',
                              ),
                            ),
                          ),
                          // MyTextField(
                          //   onChanged: (value) {
                          //     model.data?.address = value.toString();
                          //   },
                          //   decoration: InputDecoration(),
                          //   hinttext: 'Enter address',
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Post Code',
                                style: TextStyle(fontSize: 17.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: TextFormField(
                              controller: zipcode,
                              onChanged: (value) {
                                model.data?.zipCode = value.toString();
                                setState(() {});
                              },
                              keyboardType: TextInputType.multiline,
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
                                hintText: 'Enter post code',
                              ),
                            ),
                          ),
                          // MyTextField(
                          //   onChanged: (value) {
                          //     model.data?.zipCode = value.toString();
                          //   },
                          //   decoration: InputDecoration(),
                          //   hinttext: 'Enter zip code',
                          // ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          //   child: Text('Country',
                          //       style: TextStyle(fontSize: 17.sp)),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: 20.w, right: 20.w, top: 10),
                          //   child: DropdownButtonFormField<String>(
                          //     value: selectedCountry,
                          //     validator: (value) {
                          //       if (value!.isEmpty) {
                          //         return 'Please select from this field';
                          //       }
                          //     },
                          //     items: country
                          //         .map((e) => DropdownMenuItem<String>(
                          //               child: Text(e),
                          //               value: e,
                          //             ))
                          //         .toList(),
                          //     onChanged: (value) {
                          //       model.data?.country = value.toString();
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
                          //     ),
                          //   ),
                          // ),

                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Text('Country',
                                style: TextStyle(fontSize: 17.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 20.w),
                            child: Container(
                              child: CSCPicker(
                                ///Enable disable state dropdown [OPTIONAL PARAMETER]
                                showStates: true,

                                /// Enable disable city drop down [OPTIONAL PARAMETER]
                                showCities: true,

                                ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                                flagState: CountryFlag.ENABLE,

                                ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                                dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey.shade200,
                                    border:
                                        Border.fromBorderSide(BorderSide.none)),

                                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                                // disabledDropdownDecoration: BoxDecoration(
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(10)),
                                //     color: Colors.grey.shade300,
                                //     border: Border.all(
                                //         color: Colors.grey.shade300, width: 1)),

                                ///placeholders for dropdown search field
                                countrySearchPlaceholder: countryValue!,
                                stateSearchPlaceholder: "State",
                                citySearchPlaceholder: "City",

                                ///labels for dropdown
                                countryDropdownLabel: countryValue!,
                                stateDropdownLabel: "State",
                                cityDropdownLabel: "City",

                                //  / /Default Country
                                // defaultCountry: DefaultCountry.India,

                                ///Disable country dropdown (Note: use it with default country)
                                // disableCountry: true,

                                ///selected item style [OPTIONAL PARAMETER]
                                selectedItemStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),

                                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                                dropdownHeadingStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),

                                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                                dropdownItemStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),

                                ///Dialog box radius [OPTIONAL PARAMETER]
                                dropdownDialogRadius: 10.0,

                                ///Search bar radius [OPTIONAL PARAMETER]
                                searchBarRadius: 10.0,

                                ///triggers once country selected in dropdown
                                onCountryChanged: (value) {
                                  setState(() {
                                    ///store value in country variable
                                    selectedCountry = value.toString();

                                    countryValue = value.toString();
                                    model.data?.country =
                                        countryValue.toString();
                                    setState(() {});
                                  });
                                },

                                //triggers once state selected in dropdown
                                onStateChanged: (value) {
                                  setState(() {
                                    ///store value in state variable
                                    stateValue = value;
                                    model.data?.city = stateValue.toString();
                                    setState(() {});
                                  });
                                },

                                ///triggers once city selected in dropdown
                                onCityChanged: (value) {
                                  setState(() {
                                    ///store value in city variable

                                    cityValue = value;
                                    model.data?.city = cityValue.toString();
                                    setState(() {});
                                  });
                                },
                              ),
                            ),

                            // TextFormField(
                            //   controller: city,
                            //   onChanged: (value) {
                            //     model.data?.city = value.toString();
                            //     setState(() {});
                            //   },
                            //   validator: (value) {
                            //     if (value!.isEmpty) {
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
                            //     fillColor: Colors.grey.shade200,
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
                            //     hintText: 'Enter city',
                            //   ),
                            // ),
                          ),

                          // MyTextField(
                          //   onChanged: (value) {
                          //     model.data?.city = value.toString();
                          //   },
                          //   decoration: InputDecoration(),
                          //   hinttext: 'Enter city',
                          // ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, bottom: 20.h),
                            child: GestureDetector(
                              onTap: () async {
                                model.data?.title = title;
                                if (formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Container(
                                          child: Center(
                                              child:
                                                  new CircularProgressIndicator(
                                        color: Color(0xfffaeaea),
                                      )));
                                    },
                                  );

                                  print(model.data?.city);
                                  print(model.data?.country);
                                  model.data?.city = cityValue.toString();
                                  model.data?.country = countryValue.toString();
                                  model.data?.address = address.text.toString();
                                  model.data?.zipCode = zipcode.text.toString();

                                  var data = await AuthController()
                                      .UpdateNextKin(model: model);
                                  Navigator.pop(context);

                                  AuthController().GetNextKinApi();
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    '$data',
                                    style: TextStyle(color: Colors.white),
                                  )));
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 600.w,
                                decoration: BoxDecoration(
                                  color: name.text != "" &&
                                          address.text != "" &&
                                          zipcode.text != "" &&
                                          countryValue != "" &&
                                          cityValue != ""
                                      ? Colors.pink
                                      : Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text('Save',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: name.text != "" &&
                                                  address.text != "" &&
                                                  zipcode.text != "" &&
                                                  countryValue != "" &&
                                                  cityValue != ""
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
