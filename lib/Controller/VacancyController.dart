import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixel_app/Model/VacancyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';

var token;

class VacancyController {
  Future<vacancyModel> GetAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
      'GET',
      Uri.parse(
        '$baseUrl/api/care-home-jobs/get',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return vacancyModel
        .fromJson(jsonDecode(await response.stream.bytesToString()));
  }

  Future<vacancyModel> GetRelevant() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/care-home-jobs/get/relevant'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return vacancyModel.fromJson(jsonDecode(await response.stream.bytesToString()));
  }

  Apply(var id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request('PUT',
        Uri.parse('$baseUrl/api/care-home-jobs/apply?care_home_job_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<String>? data = ['NoId'];
      data = pref.getStringList('Vacancy');
      if (data == null) {
        data = ['No data'];
      }
      data.add(id.toString());
      pref.setStringList("Vacancy", data);
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
