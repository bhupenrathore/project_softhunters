import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/view_schemes_api_model.dart';
import 'package:project/screens/components/token_manager.dart';

class ViewSchemeApi {
  Future<ViewSchemesApiModel?> viewSchemeApiRequest() async {
    String token = await TokenManager.getToken() ?? "";
    var headers = {
      'Authorization': 'Bearer $token',
    };
    print("headers: $headers");
    final url =
        Uri.parse('https://dmlux.in/project/public/api/scheme/view-scheme/55');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ViewSchemesApiModel viewSchemeObj = ViewSchemesApiModel.fromJson(data);
        return viewSchemeObj;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

}
