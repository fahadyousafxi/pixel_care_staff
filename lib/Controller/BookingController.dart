import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixel_app/Constants/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/BookingModel.dart';

var token;

class BookingController {
  Future<BookingModel> GetConfirmed() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/care-home-jobs/get/confirmed'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return BookingModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<BookingModel> GetUnConfirmed() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/care-home-jobs/get/unconfirmed'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return BookingModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }
}
