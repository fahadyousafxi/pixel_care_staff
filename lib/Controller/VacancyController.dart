import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_app/Model/AccademicCertModel.dart';
import 'package:pixel_app/Model/AccademicQualModel.dart';
import 'package:pixel_app/Model/NmcModel.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:pixel_app/Model/VacancyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/NextKinModel.dart';
import '../widgets/Constants.dart';

var token;

class VacancyController {
  Future<vacancyModel> GetAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request('GET',
        Uri.parse('$baseUrl/api/care-home-jobs/get',),);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return vacancyModel
        .fromJson(jsonDecode(await response.stream.bytesToString()));
  }

  Future<vacancyModel> GetRelevant() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'GET',
        Uri.parse(
            '$baseUrl/api/care-home-jobs/get/relevant'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return vacancyModel
        .fromJson(jsonDecode(await response.stream.bytesToString()));
  }

  Apply(var id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'PUT',
        Uri.parse(
            '$baseUrl/api/care-home-jobs/apply?care_home_job_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<String>? data = ['NoId'];
      data = await pref.getStringList('Vacancy');
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
