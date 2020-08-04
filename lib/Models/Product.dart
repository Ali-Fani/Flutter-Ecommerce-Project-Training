import 'package:flutterfinalproject/Models/Comment.dart';
import 'dart:convert';
class Product {
  int id;
  String title;
  List img_url;
  String manufacture;
  double rating;
  String description;
  List<Comment> comments;
  int price;
  int discount;

  Product(
      {this.title,
        this.img_url,
        this.price,
        this.manufacture,
        this.description,
        this.rating,
        this.id,
        this.comments,
        this.discount

      });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'],
      rating: jsonData['rating'],
      img_url: jsonData['img_url'],
      discount: jsonData['discount'],
      price:jsonData['price'],
      title: jsonData['title'],
    );
  }

  static Map<String, dynamic> toMap(Product music) => {
    'id': music.id,
    'title': music.title,
    'discount': music.discount,
    'price': music.price,
    'img_url': music.img_url,
  };

  static String encodeProducts(List<Product> products) => json.encode(
    products
        .map<Map<String, dynamic>>((music) => Product.toMap(music))
        .toList(),
  );

  static List<Product> decodeProducts(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Product>((item) => Product.fromJson(item))
          .toList();
}
