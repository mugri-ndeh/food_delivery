import 'package:delivery_app/home/models/food_item.dart';

class Api {
  List<FoodItem> fooditems = [
    FoodItem(
        id: 1,
        price: '1000XAF',
        name: 'Eru',
        image: 'assets/images/eru1.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 2,
        price: '1000XAF',
        name: 'Achu',
        image: 'assets/images/achu.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 3,
        price: '1000XAF',
        name: 'Ekpang',
        image: 'assets/images/expang.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 4,
        price: '1000XAF',
        name: 'Puff puff and Beans',
        image: 'assets/images/puffbeans.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah nametits heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 5,
        price: '1000XAF',
        name: 'Deje',
        image: 'assets/images/deje.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
    FoodItem(
        id: 6,
        price: '1000XAF',
        name: 'Rice and Stew',
        image: 'assets/images/ricestew.png',
        catId: 1,
        description:
            'lorem ipsuem food u know is very good blah blah blah its heat having u here with us today u know lets have more food'),
  ];

  List<FoodItem> getFoodItems() {
    return fooditems;
  }
}
