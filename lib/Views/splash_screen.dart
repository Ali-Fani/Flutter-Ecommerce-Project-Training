import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfinalproject/Models/Comment.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'file:///D:/avd/flutter_final_project/lib/Views/HubPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //TODO Check Connection To server
//  Future<void> CheckConnection() async{
//    await new Future.delayed(const Duration(seconds : 10));
//    try {
//      final result = await InternetAddress.lookup(InternetAddress.loopbackIPv4.address);
//      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        setState(() {
//          isConnected=true;
//        });
//      }
//    } on SocketException catch (e) {
//      print(e);
//      setState(() {
//        isConnected=false;
//      });
//    }
//  }
//  bool isConnected;

  @override
  Widget build(BuildContext context) {
//    CheckConnection();
//    print(isConnected);
//    print(InternetAddress.loopbackIPv4.address);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
            child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/digikala.png"),
                      width: 150,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
