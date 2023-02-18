import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/TimesheetModel.dart';

class TimesheetController {
  Future<TimesheetModel> GetAvail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('https://pixelcare.stackbuffers.com/api/user/time-sheet'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return TimesheetModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  save(
      {unit,
      applicationid,
      scheduleid,
      start,
      end,
      brek,
      total,
      File? image}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/time-sheet/save'));
    request.fields.addAll({
      'business_unit': '$unit',
      'application_from_id': '$applicationid',
      'schedule_id': '$scheduleid',
      'start_time': '$start',
      'end_time': '$end',
      'break_time': '$brek',
      'total_hours': '$total'
    });

    request.files
        .add(await http.MultipartFile.fromPath('last_report', image!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }
}
