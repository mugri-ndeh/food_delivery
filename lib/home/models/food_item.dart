class FoodItem {
  int id;
  String price;
  String name;
  String image;
  int catId;
  String description;
  FoodItem({
    this.id = 0,
    this.price = '',
    this.name = '',
    this.image = '',
    this.description = '',
    this.catId = 0,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        price: json['price'],
        name: json['name'],
        image: json['image'],
        catId:
            json['cat_id'] is int ? json['cat_id'] : int.parse(json['cat_id']),
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'image': image,
      'cat_id': catId,
      'description': description,
    };
  }
}
