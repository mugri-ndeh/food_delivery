import 'dart:math';

import 'package:delivery_app/home/models/food_item.dart';

class Cart {
  int id;
  List<CartItem> items;

  Cart({
    this.id = 0,
    this.items = const [],
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      items: json['items'],
    );
  }

  toJson() {
    return {
      'id': id,
      'items': items,
    };
  }
}

class CartItem {
  String id;
  FoodItem? item;
  int qty;
  CartItem({this.id = '', this.item, this.qty = 0});
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      qty: json['qty'],
      item: json['item'],
    );
  }

  toJson() {
    return {
      'item': item,
      'qty': qty,
    };
  }

  getRandom() {
    Random rand;
  }
}
