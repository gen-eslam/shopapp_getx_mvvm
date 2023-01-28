class ProductModel {
  final String name, description, sized, image, color, price;

  ProductModel({
    required this.name,
    required this.description,
    required this.image,
    required this.color,
    required this.price,
    required this.sized,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
      name: map['name'],
      description: map['description'],
      image: map['image'],
      color: map['color'],
      price: map['price'],
      sized: map['sized']);

  toJson() {
    return {
      "name": name,
      "description": description,
      "image": image,
      "color": color,
      "price": price,
      "sized": sized,
    };
  }
}
