import 'dart:developer';
import 'dart:convert';
import 'package:flutter_application_1/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var client = http.Client();

      var url = Uri.parse('http://192.168.1.4:4003/employees');
      final response = await http.get(url);
      var json = jsonDecode(response.body);
      //print('Response:- ${json["employee"]}');

      if (response.statusCode == 200) {
        print('success');
        return userFromJson(jsonEncode(json["employee"]));
      }
    } catch (e) {
      print(e);
    }
  }
}
