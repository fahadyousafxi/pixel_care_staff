import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pixel_app/Constants/Constant.dart';

class ApplicationFormController {
  Apply(ApplicationFormModel? model) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseUrl/api/user/apply-care-home-jobs/store'));
    request.body = json.encode(model!.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    return jsonDecode(await response.stream.bytesToString())['message'];
  }
}
