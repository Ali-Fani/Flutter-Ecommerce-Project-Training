import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:flutterfinalproject/components/star.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var product = new Product(
      title: 'گوشی لنوو لژیون',
      img_url: [
        'images/Product_pcis/lenovo-legion-01.jpg',
        'images/Product_pcis/lenovo-legion-02.jpg',
        'images/Product_pcis/lenovo-legion-03.jpg'
      ],
      rating: 2.5,
      description: [
        "مانند سال‌های اخیر، ماه سپتامبر سال 2019 زمان برگزاری کنفرانس معرفی محصولات جدید اپل بود که در آن گوشی همراه «iPhone 11 Pro Max»  همراه با دو مدل دیگر از گوشی‌های این شرکت یعنی «iPhone 11» و «iPhone 11 Pro» معرفی شد. اپل برای ویژگی‌ها و طراحی کلی این گوشی از همان فرمول چند سال اخیرش استفاده کرده است. نمایشگر آیفون 11 Pro Max به پنل Super Retina مجهز ‌شده است تا تصاویر بسیار مطلوبی را به کاربر عرضه کند. این نمایشگر رزولوشن بسیار بالایی دارد؛ به‌طوری‌که در اندازه­‌ی 6.5اینچی‌اش، حدود 458 پیکسل را در هر اینچ جا داده است که دقیقاً با تراکم پیکسلی iPhone XS Max برابر است"
      ],
      garanty: {'time': 12, 'has': true, 'by': 'آونگ'},
      manufacture: 'لنوو',
      specification: {
        'ram': 12,
        'cpu': 'sd865+',
        'color': ['مشکی', 'آبی']
      },
      price: 1500000000);

  @override
  Widget build(BuildContext context) {
    var colors = product.specification['color'].length;
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(color: Colors.red),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: PageView.builder(
                        itemBuilder: sliderPicture,
                        itemCount: product.img_url.length,
                        scrollDirection: Axis.horizontal,
                      )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            product.manufacture,
                            style: TextStyle(color: Colors.blueAccent),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Row(
                        children: <Widget>[
                          Text(
                            product.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'byekan'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: StarRating(
                                rating: product.rating,
                                color: Color(0xffffb518),
                                starCount: 5,
                                onRatingChanged: (rating) {
//                                  print('current rating is ${product.rating} user rating is ${rating}');
                                  setState(() {
                                    product.rating = rating;
                                  });
                                },
                              )),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                        height: 25,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'رنگ: ${product.specification['color'][0]}',
                            style: TextStyle(
                                fontFamily: 'byekan',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: null,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            
                            child: Row(
                              children: <Widget>[
                                Text("مشکی"),
                                Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget sliderPicture(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Image(
        image: AssetImage(product.img_url[index]),
        width: MediaQuery.of(context).size.width,
      ),
      height: 250,
      color: Colors.redAccent,
    );
  }
}
