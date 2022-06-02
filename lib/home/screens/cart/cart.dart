import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Palette.scaffoldBg,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Api().fooditems.length ~/ 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(24)),
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
                                  Api().fooditems[index].imageSrc,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Api().fooditems[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    Api().fooditems[index].description,
                                    style: const TextStyle(color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${Api().fooditems[index].price} XAF',
                                    style:
                                        TextStyle(color: Palette.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SizedBox(
                                width: 90,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.close),
                                      color: Palette.primaryColor,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CistomCircularButton(
                                            outlined: true,
                                            onTap: () {},
                                            icon: Icons.remove),
                                        const Text(
                                          '02',
                                        ),
                                        CistomCircularButton(
                                            outlined: false,
                                            onTap: () {},
                                            icon: Icons.add),
                                      ],
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 10),
            AuthButton(text: 'Checkout', onTap: () {}),
            const SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
