import 'dart:convert';

import 'package:delivery_app/api/test_api.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:http/http.dart' as http;

class Api {
  List<FoodItem> fooditems = [
    FoodItem(
        id: 1,
        price: '1000XAF',
        name: 'Eru',
        image: 'assets/images/eru1.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 2,
        price: '1000XAF',
        name: 'Achu',
        image: 'assets/images/achu.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 3,
        price: '1000XAF',
        name: 'Ekpang',
        image: 'assets/images/expang.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 4,
        price: '1000XAF',
        name: 'Puff puff and Beans',
        image: 'assets/images/puffbeans.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah nametits heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 5,
        price: '1000XAF',
        name: 'Deje',
        image: 'assets/images/deje.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 6,
        price: '1000XAF',
        name: 'Rice and Stew',
        image: 'assets/images/ricestew.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
  ];

  List<FoodItem> getFoodItems() {
    return fooditems;
  }
}

class FoodsApi {
  static Future<List<FoodItem>> getFoods(String query) async {
    final url = Uri.parse('${Env.URL_PREFIX}/customer/get_all_foods.php');

    final response = await http.post(url, body: {'query': query});
    print(response.body);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result['state'] == 'failed') {
        return [];
      } else {
        final List foodItems = result['state'];
        return foodItems
            .map((json) => FoodItem.fromJson(json as Map<String, dynamic>))
            .toList();
      }
    } else {
      throw Exception();
    }
  }
}
