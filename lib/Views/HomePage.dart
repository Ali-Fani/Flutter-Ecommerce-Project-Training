import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterfinalproject/Models/Comment.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:flutterfinalproject/Views/ProductScreen.dart';
import 'package:flutterfinalproject/Views/splash_screen.dart';
import 'package:flutterfinalproject/components/homepageAppbar.dart';
import 'package:flutterfinalproject/components/search_bar_digi_kala.dart';
import 'package:flutterfinalproject/components/slider.dart';
import 'package:flutterfinalproject/components/special_categories_widget.dart';
import 'package:flutterfinalproject/components/utils.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutterfinalproject/Models/banner.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<AppBanner> sliders = [];

  void getProductList(List<Product> list) {
    if (products.length == 0) {
      print('geting data');
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
                  comment_title: jsonResponse[i]['comments'][k]
                      ['comment_title'],
                  comment_text: jsonResponse[i]['comments'][k]['comment_text'],
                  created_at: jsonResponse[i]['comments'][k]['created_at']));
            }
            setState(() {
              list.add(new Product(
                  title: jsonResponse[i]["title"],
                  img_url: images,
                  description: jsonResponse[i]['description'],
                  manufacture: jsonResponse[i]['manufacture'],
                  price: int.parse(jsonResponse[i]['price']),
                  id: jsonResponse[i]['id'],
                  rating: jsonResponse[i]['rating'].toDouble(),
                  discount: jsonResponse[i]['discount'],
                  comments: comments));
            });
          }
          // print(jsonResponse['images']);
        }
      });
    }
  }

//  Timer timer;
//
//  @override
//  void initState() {
//    super.initState();
//    if (products.length == 0) {
//      timer = Timer.periodic(
//          Duration(seconds: 5), (Timer t) => getProductList(products));
//    }
//  }
//
//  @override
//  void dispose() {
//    timer?.cancel();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    getProductList(products);
    var formatter = new NumberFormat("###,###");
    return products.length == 0
        ? SpinKitThreeBounce(
            size: 20,
            itemBuilder: (context, index) => Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
            ),
          )
        : Scaffold(
            appBar: TopBar(
              title: SearchBarDigiKala(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: picSlider(),
                  ),
                  specialCategoriesWidget(),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Container(
                    child: Transform.translate(
                      offset: Offset(0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: ListView.builder(
                                itemBuilder: containerss,
                                itemCount: products.length + 1,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
//                        containerrrrs(price: price),
//                        Container(
//                          margin: EdgeInsets.only(left: 10),
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.all(Radius.circular(5)),
//                              color: Colors.red),
//                          child: Column(
//                            children: <Widget>[
//                              ClipRRect(
//                                borderRadius: BorderRadius.circular(5.0),
//                                child: Image(
//                                  image: NetworkImage(
//                                      "https://dkstatics-public.digikala.com/digikala-products/119123965.jpg"),
//                                ),
//                              )
//                            ],
//                          ),
//                          width: 170,
//                          height: 330,
//                        ),
                        ],
                      ),
                    ),
                    height: 390,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage("images/digi.png"),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
          );
  }

  Widget containerss(BuildContext context, int index) {
    var formatter = new NumberFormat("###,###");
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Transform.translate(
          offset: Offset(-25, 0),
          child: Image(
            image: AssetImage("images/digi2.png"),
            width: 170,
          ),
        ),
      );
    }
    index -= 1;

    return Container(
      margin: EdgeInsets.only(left: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(products[index].id)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: NetworkImage(
                    "http://10.0.2.2:1337" + products[index].img_url[0]),
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              products[index].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Transform.translate(
              offset: Offset(10, 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (products[index].discount == 0)
                    Row(
                      children: <Widget>[
                        Transform.translate(
                            offset: Offset(0, -4),
                            child: Text(
                              formatter.format(products[index].price),
                              style: TextStyle(
                                  fontFamily: 'byekan',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )),
                        Text(
                          ' \u{F151}',
                          style: TextStyle(
                              fontFamily: 'digim',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  else
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Transform.translate(
                                offset: Offset(0, -4),
                                child: Text(
                                  products[index].discount == 100
                                      ? "رایگان"
                                      : formatter.format(products[index].price -
                                          (products[index].discount / 100) *
                                              products[index].price),
                                  style: TextStyle(
                                      fontFamily: 'byekan',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )),
                            Text(
                              products[index].discount == 100
                                  ? ""
                                  : ' \u{F151}',
                              style: TextStyle(
                                  fontFamily: 'digim',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: Offset(85, -30),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 20,
                              child: Text(
                                (products[index].discount).toString() + "%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'byekan',
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        Transform.translate(
                            offset: Offset(10, -30),
                            child: Text(
                              formatter.format(products[index].price),
                              style: TextStyle(
                                  fontFamily: 'byekan',
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )),
                      ],
                    ),
                ],
              )),
        ],
      ),
      width: 170,
      height: 330,
    );
  }
}
