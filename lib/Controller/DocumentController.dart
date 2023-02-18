import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_app/Model/AccademicCertModel.dart';
import 'package:pixel_app/Model/AccademicQualModel.dart';
import 'package:pixel_app/Model/NmcModel.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/NextKinModel.dart';

var token;

class DocumentController {
  AddPassport({passportNumber, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/passport/store'));
    request.fields.addAll(
        {'passport_number': '$passportNumber', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddDbs({number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/enhanced-dbs-certificate/store'));
    request.fields.addAll({'dbs_number': '$number', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  Addwork({type, number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json;charset=UTF-8',
      "Authorization": "Bearer $token"
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/right-to-work/store'));
    request.fields.addAll({
      'right_to_work_type': '$type',
      'british_residence_permit': '$number',
      'Expiry_date': '$expiry'
    });
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddProofOfAddress({type, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/proof-of-address/store'));
    request.fields.addAll({'type': '$type'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddNationalInsurance({number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/naional-insurance/store'));
    request.fields
        .addAll({'insurance_number': '$number', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddP45({type, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/P45-P46-P60/store'));
    request.fields.addAll({'type': '$type', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  Addvaccination({type, date, name, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/vaccination-proof/store'));
    request.fields.addAll({
      'dose_type': '$type',
      'name_of_vaccine': '$name',
      'date_of_vaccine': '$date'
    });
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddNMC({number, date, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/nmc-letter/store'));
    request.fields.addAll({'nmc_pin': '$number', 'Expiry_date': '$date'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', '${element.path}'));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddTerm({date1, date2, List<File>? images}) async {
    try {
      print(date1);
      print(date2);
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = await pref.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://pixelcare.stackbuffers.com/api/user/term-letter/store'));
      request.fields
          .addAll({'term_letter_start': '$date1', 'term_letter_end': '$date2'});

      request.files.add(await http.MultipartFile.fromPath(
          'image[]', '${images!.first.path}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return jsonDecode(await response.stream.bytesToString())['message'];
      }
      return;
    } catch (ex) {
      return ex;
    }
  }

  GetReference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://pixelcare.stackbuffers.com/api/user/my-referral-id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['data']
        ['referral_id'];
  }
}
