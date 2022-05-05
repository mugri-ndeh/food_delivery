import 'dart:ui';

import 'package:delivery_app/auth/widgets/custom_fields.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var emoji = Emojis.wavingHandDarkSkinTone;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(width: 5)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                            color: Palette.primaryGreen.withOpacity(0.09),
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
                                      offset: Offset(0, 2),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      color:
                                          Palette.primaryGreen.withOpacity(0.1))
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: _selectedindex == index
                                    ? Palette.primaryGreen
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
                                            ? Palette.borderGreen
                                            : Palette.primaryGreen,
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(categories[index],
                                      style: TextStyle(
                                          color: _selectedindex == index
                                              ? Palette.white
                                              : Palette.borderGreen,
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
              SizedBox(
                height: size.height,
                child: IndexedStack(
                  index: _selectedindex,
                  children: [
                    Column(
                      children: [
                        CustomContainer(
                            height: 150,
                            width: 200,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 100,
                                    child:
                                        Image.asset('assets/images/Logo.png')),
                                Container(
                                  height: 50,
                                )
                              ],
                            ))
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
      ),
    );
  }
}
