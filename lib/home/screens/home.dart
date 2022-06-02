import 'dart:ui';

import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/screens/food_details/index.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:emojis/emojis.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> categories = [
    'Dishes',
    'Raw food',
    'Drinks',
  ];
  List<IconData> icons = [
    Icons.local_restaurant_outlined,
    Icons.food_bank_outlined,
    Icons.local_drink_outlined,
  ];
  int _selectedindex = 0;

  List<FoodItem> fooditems = [
    FoodItem(
        id: '1',
        price: 1000,
        name: 'Eru',
        imageSrc: 'assets/images/eru1.jpg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: '2',
        price: 1000,
        name: 'Achu',
        imageSrc: 'assets/images/achu.jpg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: '3',
        price: 1000,
        name: 'Ekpang',
        imageSrc: 'assets/images/expang.jpg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: '4',
        price: 1000,
        name: 'Puff puff and Beans',
        imageSrc: 'assets/images/puffbeans.jpg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah nametits heat having u here with us today u know lets have more food'),
    FoodItem(
        id: '5',
        price: 1000,
        name: 'Deje',
        imageSrc: 'assets/images/deje.jpeg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: '6',
        price: 1000,
        name: 'Rice and Stew',
        imageSrc: 'assets/images/ricestew.jpeg',
        category: 'category',
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var emoji = Emojis.wavingHandDarkSkinTone;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(width: 5)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Stack(children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Palette.scaffoldBg,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          color: Palette.primaryColor.withOpacity(0.09),
                          blurRadius: 2),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Find Your',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text('Favourite Food',
                              style: TextStyle(
                                fontSize: 24,
                              )),
                        ],
                      ),
                      CircleAvatar(
                        radius: 26,
                        child: CircleAvatar(
                            radius: 24,
                            foregroundColor: Colors.transparent,
                            backgroundColor: Palette.white,
                            child: Image.asset(
                                'assets/images/delivery-truck.png')),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  child: SizedBox(
                      width: size.width,
                      child: InputField(
                        hint: 'What do you want to order',
                        icon: const Icon(Icons.search),
                      )),
                )
              ]),
            ),
            Row(children: const [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            Container(
              width: size.width,
              height: 50,
              color: Colors.transparent,
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedindex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    color:
                                        Palette.primaryColor.withOpacity(0.1))
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedindex == index
                                  ? Palette.primaryColor
                                  : Palette.white,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: _selectedindex == index
                                        ? Palette.white
                                        : Palette.scaffoldBg,
                                    radius: 14,
                                    child: Icon(
                                      icons[index],
                                      size: 16,
                                      color: _selectedindex == index
                                          ? Palette.borderColor
                                          : Palette.primaryColor,
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(categories[index],
                                    style: TextStyle(
                                        color: _selectedindex == index
                                            ? Palette.white
                                            : Palette.borderColor,
                                        fontWeight: _selectedindex == index
                                            ? FontWeight.bold
                                            : FontWeight.w100,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: IndexedStack(
                index: _selectedindex,
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fooditems.length,
                          itemBuilder: (c, i) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FoodCard(
                              foodItem: fooditems[i],
                              onTap: () {
                                push(context,
                                    FoodDetail(foodItem: fooditems[i]));
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(children: const [
                        Text(
                          'Popular Today',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fooditems.length,
                          itemBuilder: (c, i) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FoodCard(
                              onTap: () {
                                push(context,
                                    FoodDetail(foodItem: Api().fooditems[i]));
                              },
                              foodItem: fooditems[i],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
