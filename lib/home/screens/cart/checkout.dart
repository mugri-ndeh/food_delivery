import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutState();
}

class _CheckoutState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 110,
                    width: size.width,
                    child: const Center(
                        child:
                            Text('Your order is on it\'s way hang in there'))),
              ),
            ),
            AuthButton(
                text: 'Go back',
                onTap: () {
                  Navigator.pop(context);
                }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
