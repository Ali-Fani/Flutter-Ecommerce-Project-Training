import 'package:flutter/material.dart';
import 'package:flutterfinalproject/Models/Cart.dart';
import 'package:flutterfinalproject/Models/Comment.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:flutterfinalproject/Views/cart_screen.dart';
import 'file:///D:/avd/flutter_final_project/lib/Views/HubPage.dart';
import 'package:flutterfinalproject/components/star.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutterfinalproject/components/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:adobe_xd/pinned.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';

class ProductScreen extends StatefulWidget {
  int product_id;

  ProductScreen(int id) {
    product_id = id;
  }

  @override
  _ProductScreenState createState() => _ProductScreenState(product_id);
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> comment_list = [];
  List<Product> cart = [];


  Product product;

  _ProductScreenState(product_id) {
    _getProduct(product_id);
  }

  Future<int> getImagelen() async {
    try {
      var len = await product.img_url.length;
      return len;
    } on NoSuchMethodError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int number_of_products = cart.fold(
        0, (sum, comment) => (comment.id == product.id) ? sum + 1 : sum);
    String price;
    var formatter = new intl.NumberFormat("###,###");
    price = formatter.format(10000);
    return product != null
        ? Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: new IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    Transform.translate(
                      offset: Offset(10, 18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HubPage(2)));
                        },
                        child: Text(
                          ' \u{F012}',
                          style: TextStyle(
                              fontFamily: 'digikala',
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 18),
                      child: Text(
                        ' \u{F021}',
                        style: TextStyle(
                            fontFamily: 'digikala',
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      onPressed: null,
                      iconSize: 20,
                    ),
                  ],
                  elevation: 5,
                  floating: true,
                  flexibleSpace: Container(
                    width: 10,
                    color: Colors.white,
                  ),
                  expandedHeight: 50,
                ),
                SliverList(
                  // That uses a delegate to build items as they're scrolled on screen.
                  delegate: SliverChildListDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item
                      [
                        Container(
                          height: 490,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
//              BoxShadow(
//                color: Colors.black,
//                offset: Offset(0.0, 500.0),
//                blurRadius: 10,
//              )
                          ]),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      width: MediaQuery.of(context).size.width,
                                      height: 250,
                                      child: product.img_url.length == null
                                          ? CircularProgressIndicator()
                                          : PageView.builder(
                                              itemBuilder: sliderPicture,
                                              itemCount:
                                                  product.img_url.length == null
                                                      ? 0
                                                      : product.img_url.length,
                                              scrollDirection: Axis.horizontal,
                                            )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      product.manufacture,
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  product.title,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'byekan',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: StarRating(
                                          rating: product.rating,
                                          color: Color(0xffffb518),
                                          starCount: 5,
                                          onRatingChanged: (rating) {
                                            setState(() {
                                              product.rating = rating;
                                            });
                                          },
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Container(
                          height: 300,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
//              BoxShadow(
//                color: Colors.black,
//                offset: Offset(0.0, 500.0),
//                blurRadius: 10,
//              )
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          "توضیحات محصول",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'byekan'),
                                        ),
                                        flex: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          product.description,
                                          maxLines: 8,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
//              BoxShadow(
//                color: Colors.black,
//                offset: Offset(0.0, 500.0),
//                blurRadius: 10,
//              )
                          ]),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "نظرات کاربران",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'byekan'),
                                      ),
                                      flex: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width,
                                      height: 210,
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: commentBlock,
                                        itemCount: product.comments.length,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      ]),
                )
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.5,
                    blurRadius: 5)
              ], color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                children: <Widget>[
//          Stack(
//          children: <Widget>[
//          Pinned.fromSize(
//
//          bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 51.0),
//
//          size: Size(157.0, 51.0),
//          pinLeft: true,
//          pinRight: true,
//          pinTop: true,
//          pinBottom: true,
//          child: Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(5.0),
//              color: const Color(0xffff0000),
//            ),
//          ),
//        ),
//      Pinned.fromSize(
//        bounds: Rect.fromLTWH(18.0, 13.0, 123.0, 24.0),
//        size: Size(157.0, 51.0),
//        pinLeft: true,
//        pinRight: true,
//        fixedHeight: true,
//        child: Text(
//          'افزودن به سبد خرید',
//          style: TextStyle(
//            fontFamily: 'B Yekan',
//            fontSize: 16,
//            color: const Color(0xffffffff),
//          ),
//          textAlign: TextAlign.left,
//        ),
//      ),
//      ],
//    )
                  cart.contains(product)
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        cart.add(product);
                                      });
                                      print(Product.decodeProducts(Product.encodeProducts(cart)));
                                      final map2 = <String, int>{};

                                      for(final product in cart){
                                        final id=product.id.toString();
                                        map2[id]=map2.containsKey(id)?map2[id]+1:1;

                                      }

                                      print(map2);
//                                      for (final m in cart) {
//                                        final letter = m.id;
//                                        print(map2.containsKey(letter.toString()));
//                                        map2[letter.toString()] = map2.containsKey(letter.toString()) ? map2[letter.toString()] + 1 : 1;
//                                      }
//                                      print(map2);
                                    },
                                  )
                                ],
                              ),
                              Column(children: <Widget>[
                                Text(number_of_products.toString())
                              ]),
                              Column(children: <Widget>[
                                IconButton(

                                    icon: Icon(Icons.remove), onPressed: (){
                                      setState(() {
                                        cart.remove(cart.firstWhere((element) => element.id==product.id));
                                        print(cart.length);
                                      });
                                })
                              ]),
                            ],
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                          child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {
                                setState(() {
                                  cart.add(product);
                                });
                                List products=[product];


                              },
                              child: Text(
                                "افزودن به سبد خرید",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.red,
                            ),
                          ),
                        ),
                  product.discount == 0
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            textDirection: TextDirection.ltr,
                            children: <Widget>[
                              Text(
                                ' \u{F151}',
                                style: TextStyle(
                                    fontFamily: 'digim',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                formatter.format(product.price),
                                style: TextStyle(
                                    fontFamily: 'byekan',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Wrap(
                            textDirection: TextDirection.ltr,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(-50, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 20,
                                      child: Text(
                                        (product.discount).toString() + "%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'byekan',
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(-25, 0),
                                    child: Text(
                                      ' \u{F151}',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black54,
                                          fontFamily: 'digim',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(55, 0),
                                    child: Text(
                                      formatter.format(product.price),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: 'byekan',
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Transform.translate(
                                offset: Offset(-60, 25),
                                child: Stack(
                                  children: <Widget>[
                                    Transform.translate(
                                      offset: Offset(-80, 0),
                                      child: Text(
                                        ' \u{F151}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'digim',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      formatter.format(product.price -
                                          (product.discount / 100) *
                                              product.price),
                                      style: TextStyle(
                                          fontFamily: 'byekan',
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ))
        : CircularProgressIndicator();
  }

  Widget sliderPicture(BuildContext context, int index) {
    if (product.img_url.length < 1) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Image(
        image: NetworkImage("http://10.0.2.2:1337" + product.img_url[index]),
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
      height: 250,
      color: Colors.transparent,
    );
  }

  Widget commentBlock(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)]),
      width: MediaQuery.of(context).size.width * 0.80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Text(
                  product.comments[index].comment_title == null
                      ? ""
                      : product.comments[index].comment_title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    "پیشنهاد کرده",
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'byekan',
                        letterSpacing: 2,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    product.comments[index].comment_text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10),
            child: Text(
              product.comments[index].author,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'byekan',
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getProduct(int product_id) async {
    String url = GetData.server_url + "products/" + product_id.toString();

    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        dynamic jsonResponse = convert.jsonDecode(response.body);

        List images = [];
        for (int j = 0; j < jsonResponse['images'].length; j++) {
          images.add(jsonResponse['images'][j]['url']);
        }

        List<Comment> comments = [];

        for (int k = 0; k < jsonResponse['comments'].length; k++) {
          comments.add(new Comment(
              id: jsonResponse['comments'][k]['id'],
              author: jsonResponse['comments'][k]['author'],
              comment_title: jsonResponse['comments'][k]['comment_title'],
              comment_text: jsonResponse['comments'][k]['comment_text'],
              created_at: jsonResponse['comments'][k]['created_at']));
        }
        setState(() {
          product = new Product(
            title: jsonResponse["title"],
            img_url: images,
            description: jsonResponse['description'],
            manufacture: jsonResponse['manufacture'],
            price: int.parse(jsonResponse['price']),
            id: jsonResponse['id'],
            rating: jsonResponse['rating'].toDouble(),
            comments: comments,
            discount: jsonResponse['discount'],
          );
        });
      }
    });
  }
}
