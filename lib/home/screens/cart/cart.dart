import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/home/models/cart.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/screens/cart/cart_provider.dart';
import 'package:delivery_app/home/screens/cart/checkout.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total = 0;
  getTotal(CartHelper cart) {
    total = 0;
    for (int i = 0; i < cart.cartItems.length; i++) {
      CartItem item = CartItem.fromJson(cart.cartItems[i]);
      FoodItem foodItem = FoodItem.fromJson(item.item!);
      total = total + int.parse(foodItem.price.replaceAll('XAF', '').trim());
    }
    print(total);
  }

  late CartHelper cart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cart = Provider.of<CartHelper>(context, listen: false);
    getTotal(cart);
  }

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
        child: Consumer<CartHelper>(builder: (_, cart, __) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      CartItem item = CartItem.fromJson(cart.cartItems[index]);
                      FoodItem foodItem = FoodItem.fromJson(item.item!);
                      print(item.item);
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
                                    'assets/images/' + foodItem.image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      foodItem.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      foodItem.description,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      foodItem.price,
                                      style: TextStyle(
                                          color: Palette.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cart.remove(index);
                                          setState(() {
                                            getTotal(cart);
                                          });
                                        },
                                        icon: const Icon(Icons.close),
                                        color: Palette.primaryColor,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Quantity: ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            item.qty.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(width: 10),
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
              Text(total.toString()),
              const SizedBox(height: 10),
              AuthButton(
                  text: 'Checkout',
                  onTap: () {
                    // push(context, const CheckoutPage());

                    // print(cart.cartItems);
                    int total = 0;
                    for (int i = 0; i < cart.cartItems.length; i++) {
                      CartItem item = CartItem.fromJson(cart.cartItems[i]);
                      FoodItem foodItem = FoodItem.fromJson(item.item!);
                      total = total +
                          int.parse(
                              foodItem.price.replaceAll('XAF', '').trim());
                    }
                    print(total);
                  }),
              const SizedBox(height: 10),
            ],
          );
        }),
      )),
    );
  }
}
