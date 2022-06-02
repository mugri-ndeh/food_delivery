import 'package:delivery_app/home/models/food_item.dart';

class Api {
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

  List<FoodItem> getFoodItems() {
    return fooditems;
  }
}
