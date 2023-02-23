import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class DownloadController {

   Future<String> getDownload() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request('GET',
      Uri.parse('https://pixelcare.stackbuffers.com/api/user/document/pdf',),);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return request.body;
  }

}