import 'dart:async';

class Product {
  final String title;
  final double price;
  final double oldPrice;
  final double star;
  final bool isFavorite;
  final String imageUrl;

  Product(
    this.title,
    this.price,
    this.oldPrice,
    this.star,
    // ignore: avoid_positional_boolean_parameters
    this.isFavorite,
    this.imageUrl,
  );

  //  constructor, for constructing a new User instance from a map structure
  Product.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        price = json['price'] as double,
        oldPrice = json['oldPrice'] as double,
        star = json['star'] as double,
        isFavorite = json['isFavorite'] as bool,
        imageUrl = json['imageUrl'] as String;

// method?, which converts a User instance into a map.
  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'oldPrice': oldPrice,
        'isFavorite': isFavorite,
        'imageUrl': imageUrl,
      };
}
