//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutterfinalproject/Models/Product.dart';
//import 'package:flutterfinalproject/components/star.dart';
//
//class ProductPage extends StatefulWidget {
//  @override
//  _ProductPageState createState() => _ProductPageState();
//}
//
//class _ProductPageState extends State<ProductPage> {
//  var product = new Product(
//      title: 'گوشی لنوو لژیون',
//      img_url: [
//        'images/Product_pcis/lenovo-legion-01.jpg',
//        'images/Product_pcis/lenovo-legion-02.jpg',
//        'images/Product_pcis/lenovo-legion-03.jpg'
//      ],
//      rating: 2.5,
//      description: [
//        "مانند سال‌های اخیر، ماه سپتامبر سال 2019 زمان برگزاری کنفرانس معرفی محصولات جدید اپل بود که در آن گوشی همراه «iPhone 11 Pro Max»  همراه با دو مدل دیگر از گوشی‌های این شرکت یعنی «iPhone 11» و «iPhone 11 Pro» معرفی شد. اپل برای ویژگی‌ها و طراحی کلی این گوشی از همان فرمول چند سال اخیرش استفاده کرده است. نمایشگر آیفون 11 Pro Max به پنل Super Retina مجهز ‌شده است تا تصاویر بسیار مطلوبی را به کاربر عرضه کند. این نمایشگر رزولوشن بسیار بالایی دارد؛ به‌طوری‌که در اندازه­‌ی 6.5اینچی‌اش، حدود 458 پیکسل را در هر اینچ جا داده است که دقیقاً با تراکم پیکسلی iPhone XS Max برابر است"
//      ],
//      garanty: {'time': 12, 'has': true, 'by': 'آونگ'},
//      manufacture: 'لنوو',
//      specification: {
//        'ram': "12",
//        'cpu': 'sd865+',
//        'color': [
//          ['مشکی', Colors.black],
//          ['آبی', Colors.blue]
//        ]
//      },
//      price: 1500000000);
//  int colorindex = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.grey.shade300,
//      appBar: AppBar(
//        title: Text('Product Page'),
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//
//            Container(
//              height: 490,
//              decoration: BoxDecoration(color: Colors.white, boxShadow: [
////              BoxShadow(
////                color: Colors.black,
////                offset: Offset(0.0, 500.0),
////                blurRadius: 10,
////              )
//              ]),
//              child: Column(
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Container(
//                          decoration: BoxDecoration(color: Colors.white),
//                          width: MediaQuery.of(context).size.width,
//                          height: 250,
//                          child: PageView.builder(
//                            itemBuilder: sliderPicture,
//                            itemCount: product.img_url.length,
//                            scrollDirection: Axis.horizontal,
//                          )),
//                    ],
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(
//                        horizontal: 10, vertical: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Text(
//                          product.manufacture,
//                          style: TextStyle(color: Colors.blueAccent),
//                        )
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(
//                        horizontal: 10, vertical: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Text(
//                          product.title,
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 20,
//                              fontWeight: FontWeight.w700,
//                              fontFamily: 'byekan'),
//                        )
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(
//                        horizontal: 10, vertical: 10),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        Directionality(
//                            textDirection: TextDirection.ltr,
//                            child: StarRating(
//                              rating: product.rating,
//                              color: Color(0xffffb518),
//                              starCount: 5,
//                              onRatingChanged: (rating) {
////                                  print('current rating is ${product.rating} user rating is ${rating}');
//                                setState(() {
//                                  product.rating = rating;
//                                });
//                              },
//                            )),
//                      ],
//                    ),
//                  ),
//                  Divider(
//                    thickness: 1,
//                    color: Colors.grey.shade300,
//                    height: 25,
//                  ),
//                  Padding(
//                    padding:
//                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                    child: Row(
//                      children: <Widget>[
//                        Text(
//                          'رنگ: ${product.specification['color'][colorindex][0]}',
//                          style: TextStyle(
//                              fontFamily: 'byekan',
//                              fontSize: 20,
//                              fontWeight: FontWeight.w700),
//                        )
//                      ],
//                    ),
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Container(
//                          width: MediaQuery.of(context).size.width * 0.9,
//                          height: 35,
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10, horizontal: 10),
//                          child: ListView.builder(
//                            itemBuilder: colorpicker,
//                            itemCount: product.specification['color'].length,
//                            scrollDirection: Axis.horizontal,
//                          ))
//                    ],
//                  ),
//                ],
//              ),
//            ),
//            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//            Container(
//              height: 300,
//              decoration: BoxDecoration(color: Colors.white, boxShadow: [
////              BoxShadow(
////                color: Colors.black,
////                offset: Offset(0.0, 500.0),
////                blurRadius: 10,
////              )
//              ]),
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(vertical: 10),
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Text(
//                              "توضیحات محصول",
//                              style: TextStyle(
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.w700,
//                                  fontFamily: 'byekan'),
//                            ),
//                            flex: 5,
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.symmetric(vertical: 10),
//                      child: Row(
//                        children: <Widget>[
//                          Flexible(
//                            fit: FlexFit.tight,
//                            child: Text(
//                              product.description[0],
//                              maxLines: 10,
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: 'byekan',
//                                  letterSpacing: 2),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//            Container(
//              decoration: BoxDecoration(color: Colors.white, boxShadow: [
////              BoxShadow(
////                color: Colors.black,
////                offset: Offset(0.0, 500.0),
////                blurRadius: 10,
////              )
//              ]),
//              child: Column(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.symmetric(vertical: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(
//                            "نظرات کاربران",
//                            style: TextStyle(
//                                fontSize: 18,
//                                fontWeight: FontWeight.w700,
//                                fontFamily: 'byekan'),
//                          ),
//                          flex: 5,
//                        ),
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(vertical: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Container(
//                          color: Colors.white,
//                          width: MediaQuery.of(context).size.width,
//                          height: 210,
//                          child: ListView(
//                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                            scrollDirection: Axis.horizontal,
//                            children: <Widget>[
//                              Container(
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(5),
//
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.grey, blurRadius: 3)
//                                    ]),
//                                width: MediaQuery.of(context).size.width *
//                                    0.80,
//                                padding:
//                                    EdgeInsets.symmetric(horizontal: 10),
//                                height: 200,
//                                child: Column(
//                                  children: <Widget>[
//                                    Row(
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: const EdgeInsets.only(
//                                              top: 20, right: 10),
//                                          child: Text(
//                                            "تایتل نظر",
//                                            textAlign: TextAlign.right,
//                                            style: TextStyle(
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.w700,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 20, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              "پیشنهاد کرده",
//                                              textAlign: TextAlign.right,
//                                              overflow:
//                                                  TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                  fontSize: 14,
//                                                  fontWeight:
//                                                      FontWeight.w700,
//                                                  fontFamily: 'byekan',
//                                                  letterSpacing: 2,
//                                                  color: Colors.green),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 20, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              product.description[0],
//                                              textAlign: TextAlign.right,
//                                              overflow:
//                                                  TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 30, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              "زمان انتشار",
//                                              textAlign: TextAlign.right,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                          Flexible(
//                                            child: Text(
//                                              " . ",
//                                              textAlign: TextAlign.right,
//                                              overflow:
//                                                  TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.w700,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                          Flexible(
//                                            child: Text(
//                                              "توسط",
//                                              textAlign: TextAlign.right,
//                                              overflow:
//                                                  TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                              Container(
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(5),
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.grey, blurRadius: 3)
//                                    ]),
//                                width:
//                                    MediaQuery.of(context).size.width * 0.80,
//                                padding: EdgeInsets.symmetric(horizontal: 10),
//                                height: 200,
//                                child: Column(
//                                  children: <Widget>[
//                                    Row(
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: const EdgeInsets.only(
//                                              top: 20, right: 10),
//                                          child: Text(
//                                            "تایتل نظر",
//                                            textAlign: TextAlign.right,
//                                            style: TextStyle(
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.w700,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 20, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              "پیشنهاد کرده",
//                                              textAlign: TextAlign.right,
//                                              overflow: TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                  fontSize: 14,
//                                                  fontWeight: FontWeight.w700,
//                                                  fontFamily: 'byekan',
//                                                  letterSpacing: 2,
//                                                  color: Colors.green),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 20, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              product.description[0],
//                                              textAlign: TextAlign.right,
//                                              overflow: TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          top: 30, right: 10),
//                                      child: Row(
//                                        children: <Widget>[
//                                          Flexible(
//                                            child: Text(
//                                              "زمان انتشار",
//                                              textAlign: TextAlign.right,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                          Flexible(
//                                            child: Text(
//                                              " . ",
//                                              textAlign: TextAlign.right,
//                                              overflow: TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.w700,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                          Flexible(
//                                            child: Text(
//                                              "توسط",
//                                              textAlign: TextAlign.right,
//                                              overflow: TextOverflow.ellipsis,
//                                              maxLines: 3,
//                                              style: TextStyle(
//                                                fontSize: 14,
//                                                fontWeight: FontWeight.w500,
//                                                fontFamily: 'byekan',
//                                                letterSpacing: 2,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget colorpicker(BuildContext context, int index) {
//    return GestureDetector(
//      onTap: () {
//        setState(() {
//          colorindex = index;
//        });
//      },
//      child: Container(
//        margin: EdgeInsets.symmetric(horizontal: 8),
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(10),
//          boxShadow: <BoxShadow>[
//            colorindex == index
//                ? BoxShadow(
//                    color: Colors.lightBlue,
//                    offset: Offset(0.0, 0.0),
//                    blurRadius: 2.0,
//                  )
//                : BoxShadow(
//                    color: Colors.grey,
//                    offset: Offset(0.0, 0.0),
//                    blurRadius: 2.0,
//                  )
//          ],
//        ),
//        width: 70,
//        height: 20,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(product.specification['color'][index][0]),
//            Icon(
//              Icons.fiber_manual_record,
//              color: product.specification['color'][index][1],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget sliderPicture(BuildContext context, int index) {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 20),
//      child: Image(
//        image: AssetImage(product.img_url[index]),
//        width: MediaQuery.of(context).size.width,
//      ),
//      height: 250,
//      color: Colors.transparent,
//    );
//  }
//}
