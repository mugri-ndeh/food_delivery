import 'package:delivery_app/home/models/food_item.dart';

class Order {
  String orderId;
  List<FoodItem> foodItems;
  int quantity;
  String state;

  Order({
    this.orderId = '',
    this.foodItems = const [],
    this.quantity = 0,
    this.state = '',
  });
}
