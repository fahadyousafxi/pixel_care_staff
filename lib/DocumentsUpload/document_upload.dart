import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:pixel_app/DocumentsUpload/enhanced_dbs_certificate.dart';
import 'package:pixel_app/DocumentsUpload/national_insurance.dart';
import 'package:pixel_app/DocumentsUpload/nmc_letter.dart';
import 'package:pixel_app/DocumentsUpload/p_45_46_60.dart';
import 'package:pixel_app/DocumentsUpload/passport.dart';
import 'package:pixel_app/DocumentsUpload/proof_of_address.dart';
import 'package:pixel_app/DocumentsUpload/right_to_work.dart';
import 'package:pixel_app/DocumentsUpload/term_letter.dart';
import 'package:pixel_app/DocumentsUpload/training_certificates.dart';
import 'package:pixel_app/DocumentsUpload/vaccination_proof.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentsUpload extends StatefulWidget {
  DocumentsUpload({Key? key}) : super(key: key);

  @override
  State<DocumentsUpload> createState() => _DocumentsUploadState();
}

class _DocumentsUploadState extends State<DocumentsUpload> {
  List title = [
    'Passport',
    'Enhanced DBS Certificate',
    //'Trainings Certificates',
    'Right to Work (Passport/Residence)',
    'Proof of Address',
    'National Insurance',
    'P45/P60',
    'Term Letter',
    'Vaccination Proof',
    'NMC Letter'
  ];
  late SharedPreferences _prefs;
  AssignVals() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    AssignVals();
    super.initState();
  }

  List widgets = [
    Passport(),
    EnhanceDBSCertificate(),
    RightToWork(),
    ProofAddress(),
    NationalInsurance(),
    P_45_46_60(),
    Term_Letter(),
    VaccinationProof(),
    NMC_Letter()
  ];

  @override
  Widget build(BuildContext context) {
    AssignVals();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
          'Documents Upload',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 30.h, left: 10.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Icon(
            //         Icons.arrow_back_ios_outlined,
            //         size: 20.sp,
            //         color: Colors.grey,
            //       ),
            //       SizedBox(width: 5.w),
            //       Text(
            //         'Documents Upload',
            //         style: TextStyle(
            //           fontSize: 20.sp,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: title.length,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widgets[index]));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ]),
                        child: ListTile(
                          leading: Icon(
                            Icons.file_copy_outlined,
                            size: 31,
                            color: Colors.blue,
                          ),
                          title: index == 2
                              ? Row(
                                  children: [
                                    Text("Right to Work",
                                        style: TextStyle(fontSize: 18.sp)),
                                    Text("(Passport/Residence)",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color.fromARGB(
                                                255, 110, 108, 108)))
                                  ],
                                )
                              : index == 8
                                  ? Row(
                                      children: [
                                        Text("NMC Letter",
                                            style: TextStyle(fontSize: 18.sp)),
                                        Text("(Only for Nurses)",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Color.fromARGB(
                                                    255, 110, 108, 108)))
                                      ],
                                    )
                                  : Text(
                                      title[index],
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
//                           String passportStatus = "Pending";
// String dbsCertificateStatus = "Pending";
// String rightToWorkStatus = "Pending";
// String proofaddressStatus = "Pending";
// String nationalInsuranceStatus = "Pending";
// String p45p60Status = "Pending";
// String termLetterStatus = "Pending";
// String vaccinationProofStatus = "Pending";
// String nmcLetterStatus = "Pending";
                          subtitle: Text(
                            index == 0
                                ? _prefs.getString("passportStatus") != null
                                    ? _prefs
                                        .getString("passportStatus")
                                        .toString()
                                    : passportStatus
                                : index == 1
                                    ? _prefs.getString(
                                                "dbsCertificateStatus") !=
                                            null
                                        ? _prefs
                                            .getString("dbsCertificateStatus")
                                            .toString()
                                        : dbsCertificateStatus
                                    : index == 2
                                        ? _prefs.getString(
                                                    "rightToWorkStatus") !=
                                                null
                                            ? _prefs
                                                .getString("rightToWorkStatus")
                                                .toString()
                                            : rightToWorkStatus
                                        : index == 3
                                            ? _prefs.getString(
                                                        "proofaddressStatus") !=
                                                    null
                                                ? _prefs
                                                    .getString(
                                                        "proofaddressStatus")
                                                    .toString()
                                                : proofaddressStatus
                                            : index == 4
                                                ? _prefs.getString(
                                                            "nationalInsuranceStatus") !=
                                                        null
                                                    ? _prefs
                                                        .getString(
                                                            "nationalInsuranceStatus")
                                                        .toString()
                                                    : nationalInsuranceStatus
                                                : index == 5
                                                    ? _prefs.getString(
                                                                "p45p60Status") !=
                                                            null
                                                        ? _prefs
                                                            .getString(
                                                                "p45p60Status")
                                                            .toString()
                                                        : p45p60Status
                                                    : index == 6
                                                        ? _prefs.getString(
                                                                    "termLetterStatus") !=
                                                                null
                                                            ? _prefs
                                                                .getString(
                                                                    "termLetterStatus")
                                                                .toString()
                                                            : termLetterStatus
                                                        : index == 7
                                                            ? _prefs.getString(
                                                                        "vaccinationProofStatus") !=
                                                                    null
                                                                ? _prefs
                                                                    .getString(
                                                                        "vaccinationProofStatus")
                                                                    .toString()
                                                                : vaccinationProofStatus
                                                            : index == 8
                                                                ? _prefs.getString(
                                                                            "nmcLetterStatus") !=
                                                                        null
                                                                    ? _prefs
                                                                        .getString(
                                                                            "nmcLetterStatus")
                                                                        .toString()
                                                                    : nmcLetterStatus
                                                                : "",
                            style: TextStyle(
                                color: index == 0 &&
                                        _prefs.getString("passportStatus") ==
                                            null
                                    ? Colors.red
                                    : index == 0 &&
                                            _prefs.getString("passportStatus") !=
                                                null
                                        ? Colors.blue
                                        : index == 1 &&
                                                _prefs.getString(
                                                        "dbsCertificateStatus") ==
                                                    null
                                            ? Colors.red
                                            : index == 1 &&
                                                    _prefs.getString(
                                                            "dbsCertificateStatus") !=
                                                        null
                                                ? Colors.blue
                                                : index == 2 &&
                                                        _prefs.getString(
                                                                "rightToWorkStatus") ==
                                                            null
                                                    ? Colors.red
                                                    : index == 2 &&
                                                            _prefs.getString(
                                                                    "rightToWorkStatus") !=
                                                                null
                                                        ? Colors.blue
                                                        : index == 3 &&
                                                                _prefs.getString(
                                                                        "proofaddressStatus") ==
                                                                    null
                                                            ? Colors.red
                                                            : index == 3 &&
                                                                    _prefs.getString("proofaddressStatus") != null
                                                                ? Colors.blue
                                                                : index == 4 && _prefs.getString("nationalInsuranceStatus") == null
                                                                    ? Colors.red
                                                                    : index == 4 && _prefs.getString("nationalInsuranceStatus") != null
                                                                        ? Colors.blue
                                                                        : index == 5 && _prefs.getString("p45p60Status") == null
                                                                            ? Colors.red
                                                                            : index == 5 && _prefs.getString("p45p60Status") != null
                                                                                ? Colors.blue
                                                                                : index == 6 && _prefs.getString("termLetterStatus") == null
                                                                                    ? Colors.red
                                                                                    : index == 6 && _prefs.getString("termLetterStatus") != null
                                                                                        ? Colors.blue
                                                                                        : index == 7 && _prefs.getString("vaccinationProofStatus") == null
                                                                                            ? Colors.red
                                                                                            : index == 7 && _prefs.getString("vaccinationProofStatus") != null
                                                                                                ? Colors.blue
                                                                                                : index == 8 && _prefs.getString("nmcLetterStatus") == null
                                                                                                    ? Colors.red
                                                                                                    : index == 8 && _prefs.getString("nmcLetterStatus") != null
                                                                                                        ? Colors.blue
                                                                                                        : Colors.red,
                                fontSize: 15.sp),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
