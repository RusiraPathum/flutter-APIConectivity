import 'dart:convert';

import 'package:uidesign01/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService {
  String apiUrl = 'https://mocki.io/v1/372fe2cc-a75f-4764-9852-87c7251bce8e';

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
