import 'package:delivery_app/api/api.dart';
import 'package:delivery_app/api/test_api.dart';
import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/home/models/orders.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);
  // final List<Order> orders;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> orders = [];
  late Authentication auth;
  late Customer user;

  bool isLoading = true;

  getOrders() async {
    orders = await TestApi.getOrders(user.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Provider.of<Authentication>(context, listen: false).loggedUser!;
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.scaffoldBg,
        title: const Text(
          'My orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: orders.isEmpty
            ? Center(
                child: Text('You have no Orders'),
              )
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 110,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    Api().fooditems[4].image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(orders[0].foodItems![0]['']),
                                  const Text('caption'),
                                  const Text('detail'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('item count'),
                                      Text('Price'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        Row(),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
