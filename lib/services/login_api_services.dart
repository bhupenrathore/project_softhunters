import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/login_api_model.dart';

class LoginPageApi {
  Future<LoginApiModel?> loginApiRequest(String email, String pass) async {
    var requestMap = {
      'email': email,
      'password': pass,
      'user_type': '4',
      'device_token': 'abcdef1234561f1f1f1f',
    };
    var url = Uri.parse("https://dmlux.in/project/public/api/auth/login");
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(requestMap);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);
      print(response.request);
      print(response.stream);

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        print(responseBody);

        Map<String, dynamic> responseJson = jsonDecode(responseBody);
        LoginApiModel loginObj = LoginApiModel.fromJson(responseJson);
        return loginObj;
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e, r) {
      print(e);
      print(r);
      return null;
    }
  }
}
