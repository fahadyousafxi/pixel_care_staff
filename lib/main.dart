import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Application_Form/Educational_Details.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:pixel_app/screens/AcademicQualification.dart';
import 'package:pixel_app/screens/Avaiability.dart';
import 'package:pixel_app/screens/Booking1.dart';
import 'package:pixel_app/screens/DownloadsScreen.dart';
import 'package:pixel_app/screens/EditReference.dart';
import 'package:pixel_app/screens/Example.dart';
import 'package:pixel_app/screens/ForgotPassword.dart';
import 'package:pixel_app/screens/Home.dart';
import 'package:pixel_app/screens/NMC_details.dart';
import 'package:pixel_app/screens/NextOfKin.dart';
import 'package:pixel_app/screens/PasswordDetails.dart';
import 'package:pixel_app/screens/PersonalDetails.dart';
import 'package:pixel_app/screens/Profile.dart';
import 'package:pixel_app/screens/Register.dart';
import 'package:pixel_app/screens/SignUp.dart';
import 'package:pixel_app/screens/SplashScreen.dart';
import 'package:pixel_app/screens/Vacancy.dart';
import 'package:pixel_app/screens/TimeSheet.dart';
import 'package:pixel_app/screens/accademicView.dart';
import 'package:pixel_app/screens/trainingView.dart';

import 'Application_Form/DBS_Details.dart';
import 'Application_Form/Employement.dart';
import 'Application_Form/HealthCondition.dart';
import 'Application_Form/Next_of_Kin.dart';
import 'Application_Form/NmcDetailsForm.dart';
import 'Application_Form/Personal_Details.dart';
import 'Application_Form/Reference_Form.dart';
import 'Application_Form/Starting_Form.dart';
import 'Application_Form/Trainings.dart';
import 'Application_Form/WorkingTimeRegulation.dart';
import 'Application_Form/declearation.dart';
import 'DocumentsUpload/document_upload.dart';
import 'DocumentsUpload/training_certificates.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'pixel App',
            // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            //   ViewerLocalizationsDelegate.delegate,
            // ],
            theme: ThemeData(),
            home: SplashPage());
      },
    );
  }
}
