import 'dart:convert';

import 'package:pixel_app/Model/Upcomming_Shifts_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class UpcomingShiftsController {

  Future<UpcommingShiftsModel> GetAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request('GET',
      Uri.parse('https://pixelcare.stackbuffers.com/api/care-home-jobs/get',),);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return UpcommingShiftsModel
        .fromJson(jsonDecode(await response.stream.bytesToString()));
  }

}