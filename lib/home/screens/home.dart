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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                ),
                Positioned(
                  top: 80,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: size.width,
                      child: InputField(
                        hint: 'What do you want to order',
                        icon: Icon(Icons.search),
                      )),
                )
              ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
