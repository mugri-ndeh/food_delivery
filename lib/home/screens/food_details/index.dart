import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({
    Key? key,
    required this.foodItem,
  }) : super(key: key);
  final FoodItem foodItem;

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: size.width,
                child: Stack(
                  children: [
                    CustomContainer(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.foodItem.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CistomCircularButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        outlined: true,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                widget.foodItem.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.foodItem.price} XAF',
                    style: TextStyle(
                        color: Palette.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CistomCircularButton(
                          icon: Icons.remove,
                          outlined: true,
                          onTap: () {},
                        ),
                        const Text(
                          '2',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        CistomCircularButton(
                          icon: Icons.add,
                          outlined: false,
                          onTap: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(widget.foodItem.description),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.shopping_bag,
                          color: Palette.primaryColor,
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBg,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text('Add to cart'),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
