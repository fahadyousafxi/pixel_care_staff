import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';

class DownloadController {
  //  Future<String> getDownload() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString('token');
  //   print(token);
  //   var headers = {'Authorization': 'Bearer $token'};
  //
  //   // var request = http.Request('GET',
  //   //   Uri.parse('https://pixelcare.stackbuffers.com/api/user/document/pdf',),);
  //   //
  //   // request.headers.addAll(headers);
  //   //
  //   // http.StreamedResponse response = await request.send();
  //   //
  //   // return '';
  //   // // return fromJson(jsonDecode(await response.stream.bytesToString()));
  //
  //
  //
  //
  // }

  Future<void> downloadPDF() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    // var headers = {'Authorization': 'Bearer $token'};

    // final url = 'https://example.com/api/get_pdf';
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse("$baseUrl/api/user/document/pdf"),
        headers: headers);

    // Check if the response was successful
    if (response.statusCode == 200) {
      // Save the PDF to a file
      final file = File('example.pdf');
      await file.writeAsBytes(response.bodyBytes);
      print('downloaded');
      // print(json.response.stream.bytesToString());
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content))
    } else {
      // Handle the error
      print('Not downloaded');

      throw Exception('Failed to download PDF');
    }
  }
}
