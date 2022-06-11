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
    print('Response body: ${response.body}');

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
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    List foods =
        result['state'].map((json) => FoodItem.fromJson(json)).toList();
    return foods;
  }

  static Future createOrder(Order order) async {
    order.encodeList();
    var url = Uri.parse('${Env.URL_PREFIX}/customer/create_order.php');
    final response = await http.post(url, body: {
      'food_items': jsonEncode(order.foodItems),
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

  static Future<List<Order>> getOrders(int id) async {
    var url = Uri.parse('${Env.URL_PREFIX}/customer/get_orders.php');
    final response = await http.post(url, body: {
      'id': id.toString(),
    });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Map<String, dynamic> result = json.decode(response.body);
    print(result['state'][0]['items']);

    List orders = result['state'];

    print(orders.length);

    List<Order> ordersReturened = [];

    for (var order in orders) {
      // List<FoodItem> foodItems =
      //     order["items"].map((e) => FoodItem.fromJson(e));

      // print(order["items"]);
      List<FoodItem> ordersFromFood = [];
      Order ordersOrder = Order();
      ordersFromFood = order["items"]
          .map((e) => FoodItem.fromJson(e))
          .toList()
          .cast<FoodItem>();

      ordersOrder = Order.fromBbJson(order["order"]);
      ordersOrder.foodItems = ordersFromFood.map((e) => e.toJson()).toList();
      ordersReturened.add(ordersOrder);
    }

    return ordersReturened;
  }
}

class Env {
  static String URL_PREFIX = "http://10.0.2.2/food_app_php/functions";
  // static String URL_PREFIX =
  //     "https://maestrofood.000webhostapp.com/food_app/functions";
}
