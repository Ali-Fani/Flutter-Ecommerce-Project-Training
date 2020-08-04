import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterfinalproject/Views/categories_screen.dart';
import 'package:flutterfinalproject/Views/splash_screen.dart';
import 'package:flutterfinalproject/Views/user_account.dart';
import 'package:flutterfinalproject/components/search_bar_digi_kala.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinalproject/Views/cart_screen.dart';
import 'package:flutterfinalproject/components/special_categories_widget.dart';
import 'package:flutterfinalproject/components/homepageAppbar.dart';
import 'package:flutterfinalproject/components/slider.dart';
import 'package:flutterfinalproject/components/utils.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutterfinalproject/Views/ProductScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutterfinalproject/Models/Comment.dart';
import 'package:flutterfinalproject/Views/HomePage.dart';

class HubPage extends StatefulWidget {
  int index;

  HubPage(int id) {
    index = id;
  }

  @override
  _HubPageState createState() => _HubPageState(index);
}

class _HubPageState extends State<HubPage> {
  List<Product> products = [];
  int _selectedIndex = 2;
  _HubPageState(index) {
    _selectedIndex = index;
  }

  final List<Widget> _children = [
    HomePage(),
    CategoriesScreen(),
    CartScreen(),
    UserAccount(),
    SplashScreen()
  ];
  void set_index(int index) {
    if (index != 0) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    var formatter = new NumberFormat("###,###");

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    var w = MediaQuery.of(context).size.width * 0.5;
    return


      Scaffold(
      resizeToAvoidBottomPadding: true,
//      appBar: _selectedIndex == 0
//          ? TopBar(
//              title: SearchBarDigiKala(),
//            )
//          : null,
//    appBar: AppBar(title: Text("data"),),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,

          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 18, color: Colors.black),
          unselectedLabelStyle: TextStyle(fontSize: 18, color: Colors.black),
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(
              icon: Text(
                '\u{F028}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),
              title: Text("خانه"),
              activeIcon: Text(
                '\u{F027}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),
            ),
            BottomNavigationBarItem(
                icon: Text(
                  '\u{F015}',
                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
                ),
                title: Text("دسته بندی ها"),
                activeIcon: Text(
                  '\u{F014}',
                  style: TextStyle(fontFamily: 'digim', fontSize: 18),
                )),
            BottomNavigationBarItem(
              icon: Text(
                '\u{F012}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),
              title: Text("سبد خرید"),
              activeIcon: Text(
                '\u{F013}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),

            ),
            BottomNavigationBarItem(
              icon: Text(
                '\u{F036}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),
              title: Text("دیجی کالای من"),
              activeIcon: Text(
                '\u{F037}',
                style: TextStyle(fontFamily: 'digim', fontSize: 18),
              ),
            ),
          ]),
    );
  }

  Widget containerss(BuildContext context, int index) {
    var formatter = new NumberFormat("###,###");
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Transform.translate(
          offset: Offset(0, 0),
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
                    GetData.server_url+ products[index].img_url[0]),
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
              )),
        ],
      ),
      width: 170,
      height: 330,
    );
  }
}
