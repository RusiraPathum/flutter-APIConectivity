import 'dart:convert';

import 'package:uidesign01/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService {
  String apiUrl = 'https://mocki.io/v1/411b2139-ac1f-40b9-a80a-cdafd78b05f0';

  //future method to get all users from api url (response or error)
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    print(response.body);

    if (response.statusCode == 200) {
      return getUsersList(response.body);
    } else {
      throw Exception('Unable to fetch data');
    }
  }

  //convert response body => User object list
  List<User> getUsersList(String responseBody) {
    final parsedBody = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsedBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
