import 'package:flutter/services.dart';

import '../Application_Form/Model/ApplicationFormModel.dart';

ApplicationFormModel model1 = ApplicationFormModel();
var navigator = false;
var academicnav = false;
String uemail = "";
String passportStatus = "Pending";
String dbsCertificateStatus = "Pending";
String rightToWorkStatus = "Pending";
String proofaddressStatus = "Pending";
String nationalInsuranceStatus = "Pending";
String p45p60Status = "Pending";
String termLetterStatus = "Pending";
String vaccinationProofStatus = "Pending";
String nmcLetterStatus = "Pending";
const baseUrl = "https://admin.pixelcare.co.uk";
void hide() {
  // This will hide the bottom system navigation bar
  // Only the status bar on the top will show up
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
}
