import 'package:delivery_app/home/models/cart.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class CartHelper with ChangeNotifier {
  final LocalStorage storage = LocalStorage('cart');
  List cartItems = [];
  bool isCartItem = false;

  init() async {
    cartItems = await getCartItems();
    print('CART HELPER');
    notifyListeners();
  }

  CartHelper() {
    init();
  }

  bool isCartitem(FoodItem foodItem) {
    bool cartitem = false;
    int i;
    for (i = 0; i < cartItems.length; i++) {
      if (foodItem.id == CartItem.fromJson(cartItems[i]).item!['id']) {
        cartitem = true;
      }
    }
    isCartItem = cartitem;
    notifyListeners();
    print(cartitem);
    return cartitem;
  }

  addToCart(CartItem cartItem) {
    cartItems.add(cartItem.toJson());
    _saveToStorage();
    notifyListeners();
  }

  remove(int id) async {
    await storage.ready;

    // cartItems.removeWhere((element) {
    //   //print(element.values);
    //   var val = false;
    //   print(cartItem.toJson()['id']);

    //   if (element['id'] == cartItem.toJson()['id']) {
    //     val = true;
    //   } else {
    //     val = false;
    //   }
    //   return val;

    //   //return element.values == song.toJson().values;
    // });

    cartItems.removeAt(id);
    print(cartItems);
    _saveToStorage();
    notifyListeners();
    //storage.deleteItem('favourite $name');
  }

  _saveToStorage() async {
    await storage.ready;
    // List existing = await getFavourites();
    // existing.add(song.toJson());
    storage.setItem('cart', cartItems);
    print('SAVED CORRECTLY');
    notifyListeners();
  }

  getCartItems() async {
    await storage.ready;
    List fav = await storage.getItem('cart') ?? [];
    notifyListeners();

    return fav;
  }

  clearItems() async {
    await storage.ready;
    await storage.clear();
    print('Cleared');
    notifyListeners();
  }
}
