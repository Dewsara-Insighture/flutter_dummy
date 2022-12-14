import 'dart:developer';
import 'dart:convert';
import 'package:flutter_application_1/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var client = http.Client();

      var url = Uri.parse('http://10.0.2.2:4003/employees');
      final response = await http.get(url);
      var json = jsonDecode(response.body);
      //print('Response:- ${json["employee"]}');

      if (response.statusCode == 200) {
        print('Initial data success');
        List<User> userList = userFromJson(jsonEncode(json["employee"]));

        return userList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<User>?> refreshUsers() async {
    try {
      var client = http.Client();

      var url = Uri.parse('http://10.0.2.2:4003/refresh');
      final response = await http.get(url);
      var json = jsonDecode(response.body);
      //print('Response:- ${json["employee"]}');

      if (response.statusCode == 200) {
        print('Refresh success');
        List<User> userList = userFromJson(jsonEncode(json["employee"]));

        return userList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
  }
}
