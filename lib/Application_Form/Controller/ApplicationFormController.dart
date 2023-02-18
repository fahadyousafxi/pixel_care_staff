import 'dart:convert';

import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class ApplicationFormController{
  Apply(ApplicationFormModel ?model)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var token=await pref.getString('token');
    var headers = {
      'Authorization': 'Bearer $token',
       'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://pixelcare.stackbuffers.com/api/user/apply-care-home-jobs/store'));
    request.body = json.encode(model!.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['message'];
  }
}