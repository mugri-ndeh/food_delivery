import 'dart:convert';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:http/http.dart' as http;

class TestApi {
  static Future<String> signUp(Customer customer) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/signup.php');

    final response = await http.post(url, body: customer.toJson());

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    return result['state'];
  }

  static Future login(String email, String password) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/login.php');

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    return result['state'];
  }

  static Future getuser(int id) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/get_user.php');
    final response = await http.post(url, body: {
      'id': id.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    return result['state'];
  }

  static Future getFoods(int id) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/view_dishes.php');
    final response = await http.post(url, body: {
      'id': id.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    List foods =
        result['state'].map((json) => FoodItem.fromJson(json)).toList();
    return foods;
  }
}

class Env {
  static String URL_PREFIX = "http://10.0.2.2/food_app/functions";
}
