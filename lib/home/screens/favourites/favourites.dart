import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/screens/favourites/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Consumer<FavouritesHelper>(builder: (_, fav, __) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView.builder(
          itemCount: fav.favourites.length,
          itemBuilder: ((context, index) => FavouriteCard(
              foodItem: FoodItem.fromJson(fav.favourites[index]))),
        ),
        // child: Column(
        //   children: [FavouriteCard(foodItem: Api().fooditems[3])],
        // ),
      );
    })));
  }
}
