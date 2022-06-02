import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [FavouriteCard(foodItem: Api().fooditems[3])],
        ),
      ),
    )));
  }
}
