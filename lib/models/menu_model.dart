class MenuModel {
  final String name, description, imageUrl;
  final int id;
  final double price;

  MenuModel.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['image_url'],
        id = json['id'];
}
