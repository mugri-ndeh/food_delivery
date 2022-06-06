import 'dart:convert';

class Order {
  int orderId;
  List? foodItems;
  int quantity;
  String state;
  int userId;
  String priceTotal;

  Order(
      {this.orderId = 0,
      this.foodItems,
      this.quantity = 0,
      this.state = '',
      this.priceTotal = '0',
      this.userId = 0});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['id'],
      foodItems: jsonDecode(json['food_items']!),
      quantity: json['qty'],
      state: json['o_state'],
      userId: json['u_id'],
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

  encodeList() {
    for (var item in foodItems!) {
      jsonEncode(item);
    }
  }
}
