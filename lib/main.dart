import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutterfinalproject/components/homepageAppbar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterfinalproject/components/home_page.dart';
import 'package:flutterfinalproject/Views/productPage.dart';
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
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.white),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        child: ProductPage(),
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
    );
  }
}
