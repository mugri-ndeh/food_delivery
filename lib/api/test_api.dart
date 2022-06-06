import 'dart:convert';
import 'package:delivery_app/home/models/cart.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/models/orders.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TestApi {
  static Future<String> signUp(Customer customer) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/signup.php');

    final response = await http.post(url, body: customer.toLoginJson());

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

  static Future editProfile(Customer customer) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/edit_profile.php');

    final response = await http.post(url, body: customer.toJson());

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    print(result);
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

  static Future createOrder(Order order) async {
    order.encodeList();
    var url = Uri.parse('${Env.URL_PREFIX}/customer/create_order.php');
    final response = await http.post(url, body: {
      'food_items': json.encode(order.foodItems),
      'qty': order.quantity.toString(),
      'o_state': order.state,
      'price_total': order.priceTotal,
      'user_id': order.userId.toString()
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {}

    Map<String, dynamic> result = json.decode(response.body);
    // List foods =
    //     result['state'].map((json) => FoodItem.fromJson(json)).toList();
    // return foods;
  }

  static Future getOrders(int id) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/get_orders.php');
    final response = await http.post(url, body: {
      'id': id.toString(),
    });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // int orderId;
    // List? foodItems;
    // int quantity;
    // String state;
    // int userId;
    // String priceTotal;

    Map<String, dynamic> result = json.decode(response.body);
    List foodItems = (result['state']);
    List testItems = [];

    // print(foodItems[0]);

    // for (var item in foodItems) {
    //   testItems.add(Order.fromJson(item));

    //   var foods = jsonDecode(item['food_items']);
    //   // print(item['id']);
    //   print('\n');
    //   // for (var food in foods) {
    //   //   print(food);
    //   //   print('\n');
    //   // }
    // }

    List orderItems =
        result['state'].map((json) => Order.fromJson((json))).toList();
    // print(jsonDecode(result['state'][0]['food_items'])[0]['item']);
    // jsonDecode(result['state'][0]['food_items']);
    // print(orderItems[0].foodItems[]);
    // print();
    // var lol = jsonDecode(result['state'][0]['food_items']);
    // var hey = json.decode(lol);
    // var hehe = json.decode('"' + hey + '"');

    // print(jsonEncode(result['state'][0]['food_items'].replaceAll("\\", "")));
    // List orders = result['state'].map((json) => Order.fromJson(json)).toList();

    //  List orders = Order.fromJson(result['state']);
    // return orders;
  }
}

class Env {
  static String URL_PREFIX = "http://10.0.2.2/food_app/functions";
  // static String URL_PREFIX =
  //     "http://maestrofood.ultimatefreehost.in/food_app/functions";
}
