import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutterfinalproject/components/homepageAppbar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'file:///D:/avd/flutter_final_project/lib/Views/HubPage.dart';
import 'file:///D:/avd/flutter_final_project/lib/junk/productPage.dart';

import 'Views/ProductScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa'), // farsi
      ],
      theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
//          canvasColor: Colors.grey.shade300
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        child: HubPage(0),
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
    );
  }
}
