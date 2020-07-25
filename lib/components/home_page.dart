//
//import 'package:flutterfinalproject/Models/Product.dart';
//import 'package:flutter/material.dart';
//import 'package:flutterfinalproject/components/special_categories_widget.dart';
//import 'package:flutterfinalproject/components/homepageAppbar.dart';
//import 'package:flutterfinalproject/components/slider.dart';
//import 'package:intl/intl.dart';
//import 'package:flutter/services.dart';
//
//class HomePage extends StatefulWidget {
//  HomePage({Key key}) : super(key: key);
//
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  List<Product> products = [];
//  int _selectedIndex = 0;
//  static const TextStyle optionStyle =
//      TextStyle(fontSize: 20);
//  static const List<Widget> _widgetOptions = <Widget>[
//    Text(
//      'Index 0: Home',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 1: Business',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 2: School',
//      style: optionStyle,
//    ),
//  ];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    products.add(new Product(
//        title: 'هندزفری', img_url: 'images/digip.jpg', price: 1500000000));
//    products.add(new Product(
//        title: 'هندزفری', img_url: 'images/digip.jpg', price: 15000000));
//
//    String price;
//    var formatter = new NumberFormat("###,###");
//    price = formatter.format(1000000);
//SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
//    var w = MediaQuery.of(context).size.width * 0.5;
//    return Scaffold(
//
//
//      resizeToAvoidBottomPadding: true,
//      appBar: TopBar(title: "TOp Bar"),
////    appBar: AppBar(title: Text("data"),),
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(top: 25),
//              child: picSlider(),
//            ),
//            specialCategoriesWidget(),
//            Padding(padding: EdgeInsets.only(top: 25)),
//            Container(
//              child: Transform.translate(
//                offset: Offset(0, 0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Container(
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(vertical: 20.0),
//                        child: ListView.builder(
//                          itemBuilder: containerss,
//                          itemCount: products.length,
//                          scrollDirection: Axis.horizontal,
//                        ),
//                      ),
//                      width: MediaQuery.of(context).size.width,
//                    )
////                        containerrrrs(price: price),
////                        Container(
////                          margin: EdgeInsets.only(left: 10),
////                          decoration: BoxDecoration(
////                              borderRadius: BorderRadius.all(Radius.circular(5)),
////                              color: Colors.white),
////                          child: Column(
////                            children: <Widget>[
////                              ClipRRect(
////                                borderRadius: BorderRadius.circular(5.0),
////                                child: Image(
////                                  image: NetworkImage(
////                                      "https://dkstatics-public.digikala.com/digikala-products/119123965.jpg"),
////                                ),
////                              )
////                            ],
////                          ),
////                          width: 170,
////                          height: 330,
////                        ),
//                  ],
//                ),
//              ),
//              height: 390,
//              width: MediaQuery.of(context).size.width,
//              decoration: BoxDecoration(
//                  color: Colors.red,
//                  image: DecorationImage(
//                      image: AssetImage("images/digi.png"), fit: BoxFit.fill)),
//            ),
//          ],
//        ),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//
//          currentIndex: _selectedIndex,
//          selectedItemColor: Colors.black,
//          onTap: _onItemTapped,
//          showUnselectedLabels: true,
//          selectedLabelStyle: TextStyle(fontSize: 15,color: Colors.black),
//          unselectedLabelStyle: TextStyle(fontSize: 15,color: Colors.black),
//          type: BottomNavigationBarType.fixed,
//          items: [
//            BottomNavigationBarItem(
//              icon: Text(
//                ' \u{F028} \ue000',
//                style: TextStyle(fontFamily: 'digim', fontSize: 18),
//              ),
//              title: Transform.translate(
//                offset: Offset(-4, -15),
//                child: Text(
//                  "خانه"
//                ),
//              ),
//              activeIcon: Text(
//                ' \u{F027} \ue000',
//                style: TextStyle(fontFamily: 'digim', fontSize: 18),
//              ),
//            ),
//            BottomNavigationBarItem(
//                icon: Text(
//                  ' \u{F015} \ue000',
//                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
//                ),
//                title: Transform.translate(offset: Offset(-4, -15),child: Text("دسته بندی ها")),
//                activeIcon: Text(
//                  ' \u{F014} \ue000',
//                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
//                )),
//            BottomNavigationBarItem(
//                icon: Text(
//                  ' \u{F012} \ue000',
//                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
//                ),
//                title: Transform.translate(
//                  offset: Offset(-4, -15),
//                  child: Text(
//                    "سبد خرید"
//                  ),
//                ),
//              activeIcon:
//              Text(
//                ' \u{F013} \ue000',
//                style: TextStyle(fontFamily: 'digim', fontSize: 18),
//              ),
//
//            ),
//            BottomNavigationBarItem(
//                icon: Text(
//                  ' \u{F036} \ue000',
//                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
//                ),
//                title: Transform.translate(
//                  offset: Offset(-4, -15),
//                  child: Text(
//                    "دیجی کالای من"
//                  ),
//                ),
//            activeIcon: Text(
//              ' \u{F037} \ue000',
//              style: TextStyle(fontFamily: 'digim', fontSize: 18  ),
//            ),),
//          ]),
//    );
//  }
//
//  Widget containerss(BuildContext context, int index) {
//    String price;
//    var formatter = new NumberFormat("###,###");
//    price = formatter.format(products[index].price);
//    if (index == 0) {
//      return Padding(
//        padding: const EdgeInsets.only(left: 50.0),
//        child: Transform.translate(
//          offset: Offset(-25, 0),
//          child: Image(
//            image: AssetImage("images/digi2.png"),
//            width: 170,
//          ),
//        ),
//      );
//    }
//    return Container(
//      margin: EdgeInsets.only(left: 10, top: 15, bottom: 15),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.all(Radius.circular(5)),
//          color: Colors.white),
//      child: Column(
//        children: <Widget>[
//          ClipRRect(
//            borderRadius: BorderRadius.circular(5.0),
//            child: Image(image: AssetImage(products[index].img_url)),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 8.0),
//            child: Text(products[index].title),
//          ),
//          Transform.translate(
//              offset: Offset(10, 45),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Transform.translate(
//                      offset: Offset(0, -4),
//                      child: Text(
//                        price,
//                        style: TextStyle(
//                            fontFamily: 'byekan',
//                            fontSize: 18,
//                            fontWeight: FontWeight.w700),
//                      )),
//                  Text(
//                    ' \u{F151} \ue000',
//                    style: TextStyle(
//                        fontFamily: 'digim',
//                        fontSize: 18,
//                        fontWeight: FontWeight.w700),
//                  )
//                ],
//              )),
//        ],
//      ),
//      width: 170,
//      height: 330,
//    );
//  }
//}
