import 'package:flutterfinalproject/Models/Comment.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetData {
  static String server_url = "http://10.0.2.2:1337/";

  static GoNewScreen(BuildContext context, Widget screen, double x, double y) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> Animation,
              Animation<double> SecondAnimation) {
            return screen;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> Animation,
              Animation<double> SecondAnimation,
              Widget child) {
            return SlideTransition(
              position: new Tween<Offset>(begin: Offset(x, y), end: Offset.zero)
                  .animate(Animation),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 1000),
        ));
  }


}
List<Product> getData() {
  List<Product> products=[];

  var url = "http://10.0.2.2:1337/products";

  http.get(url).then((response) {
    print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);

      for (int i = 0; i < jsonResponse.length; i++) {
        List images = [];
        for (int j = 0; j < jsonResponse[i]['images'].length; j++) {
          images.add(jsonResponse[i]['images'][j]['url']);
        }
        List<Comment> comments = [];

        for (int k = 0; k < jsonResponse[i]['comments'].length; k++) {
          comments.add(new Comment(
              id: jsonResponse[i]['comments'][k]['id'],
              author: jsonResponse[i]['comments'][k]['author'],
              comment_title: jsonResponse[i]['comments'][k]['comment_title'],
              comment_text: jsonResponse[i]['comments'][k]['comment_text'],
              created_at: jsonResponse[i]['comments'][k]['created_at']));
        }

        products.add(new Product(
            title: jsonResponse[i]["title"],
            img_url: images,
            description: jsonResponse[i]['description'],
            manufacture: jsonResponse[i]['manufacture'],
            price: int.parse(jsonResponse[i]['price']),
            id: jsonResponse[i]['id'],
            rating: jsonResponse[i]['rating'].toDouble(),
            discount: jsonResponse[i]['discount'],
            comments: comments));
      }
      // print(jsonResponse['images']);

    }
  });
  return products;
}
