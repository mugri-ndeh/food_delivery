import 'package:delivery_app/home/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class FavouritesHelper with ChangeNotifier {
  final LocalStorage storage = LocalStorage('favourites');
  List favourites = [];
  bool isFavourite = false;

  init() async {
    favourites = await getFavourites();
    print('INIT FAV HELPER');
    notifyListeners();
  }

  FavouritesHelper() {
    init();
  }

  bool isfavourite(FoodItem foodItem) {
    bool favourite = false;
    int i;
    for (i = 0; i < favourites.length; i++) {
      if (foodItem.id == FoodItem.fromJson(favourites[i]).id) {
        favourite = true;
      }
    }
    isFavourite = favourite;
    return favourite;
  }

  addFavourites(FoodItem foodItem) {
    favourites.add(foodItem.toJson());
    _saveToStorage();
    notifyListeners();
  }

  remove(FoodItem food) async {
    await storage.ready;

    favourites.removeWhere((element) {
      //print(element.values);
      var val = false;
      print(food.toJson()['id']);

      if (element['id'] == food.toJson()['id']) {
        val = true;
      } else {
        val = false;
      }
      return val;

      //return element.values == song.toJson().values;
    });
    print(favourites);
    _saveToStorage();
    notifyListeners();
    //storage.deleteItem('favourite $name');
  }

  _saveToStorage() async {
    await storage.ready;
    // List existing = await getFavourites();
    // existing.add(song.toJson());
    storage.setItem('favourite', favourites);
    // print('SAVED CORRECTLY');
    notifyListeners();
  }

  clearItems() async {
    await storage.ready;
    // List existing = await getFavourites();
    // existing.add(song.toJson());
    storage.clear();
    // print('SAVED CORRECTLY');
    notifyListeners();
  }

  getFavourites() async {
    await storage.ready;
    List fav = await storage.getItem('favourite') ?? [];
    notifyListeners();

    return fav;
  }
}
