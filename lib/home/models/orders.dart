import 'package:delivery_app/home/models/cart.dart';

class Order {
  String orderId;
  CartItem? foodItems;
  int quantity;
  String state;
  String userId;
  String priceTotal;

  Order(
      {this.orderId = '',
      this.foodItems,
      this.quantity = 0,
      this.state = '',
      this.priceTotal = '0',
      this.userId = ''});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['id'],
      foodItems: json['food_items'],
      quantity: json['qty'],
      state: json['o_state'],
      userId: json['user_id'],
      priceTotal: json['price_total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': orderId,
      'food_items': foodItems,
      'qty': quantity,
      'o_state': state,
      'user_id': userId,
      'price_total': priceTotal,
    };
  }
}
