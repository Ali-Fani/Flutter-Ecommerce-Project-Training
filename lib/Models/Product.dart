import 'dart:ffi';

class Product{
  String title;
  List<String> img_url;
  String manufacture;
  double rating;
  Map garanty;
  Map specification;
  List<String> description;

  int price;

  Product({this.title,this.img_url,this.price,this.manufacture,this.description,this.rating,this.garanty,this.specification});
}

