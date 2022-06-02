class FoodItem {
  String id;
  int price;
  String name;
  String imageSrc;
  String category;
  String description;
  FoodItem({
    required this.id,
    required this.price,
    required this.name,
    required this.imageSrc,
    this.description = '',
    required this.category,
  });
}
