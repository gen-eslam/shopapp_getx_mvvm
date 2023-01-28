class CategoryModel {
  final String name, image;

  CategoryModel({required this.name, required this.image});

  factory CategoryModel.fromJson(Map<dynamic, dynamic> map) =>
      CategoryModel(name: map['name'], image: map['image']);

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
