import 'dart:async';

import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/screens/food_details/index.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<FoodItem> foodItems = [];
  Timer? debouncer;
  String query = '';

  Future searchBook(String query) async => debounce(
        () async {
          final foods = await FoodsApi.getFoods(query);
          if (!mounted) return;
          setState(() {
            this.query = query;
            this.foodItems = foods;
          });
          print('SONG IS');
        },
      );

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: InputField(
                            onChanged: (str) {
                              searchBook(_searchController.text);
                            },
                            controller: _searchController,
                            hint: 'Search',
                            password: false,
                            prefixIcon: IconButton(
                              onPressed: () async {
                                searchBook(_searchController.text);
                              },
                              icon: const Icon(Icons.search),
                              color: Palette.buttonColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              foodItems.isEmpty
                  ? Center(
                      child: Text('No results'),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => SearchResult(
                          foodItem: foodItems[index],
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 2,
                        ),
                        itemCount: foodItems.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, this.foodItem}) : super(key: key);
  final FoodItem? foodItem;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          push(context, FoodDetail(foodItem: foodItem!));
        },
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
              color: Palette.white, borderRadius: BorderRadius.circular(24)),
          height: 100,
          width: size.width,
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/' + foodItem!.image,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodItem!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        foodItem!.description,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        foodItem!.price,
                        style: TextStyle(color: Palette.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
