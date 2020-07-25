import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  TopBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double height = (mediaQuery.size.height - mediaQuery.padding.top) * 10;
    return // Adobe XD layer: 'Search' (group)
        Container(
//      margin: EdgeInsets.only(top: 24),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, blurRadius: 1.0, offset: Offset(0.0, 0.75))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(0.0, 21.0),
              child:
                  // Adobe XD layer: 'Field_Search' (shape)
                  Container(
                width: MediaQuery.of(context).size.width,
                height: 43.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0x10000000),
//                color: Colors.black
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-11.0, 32.5),
              child:
                  // Adobe XD layer: 'Icon_Search' (group)
                  Stack(
                children: <Widget>[
                  Transform.translate(
                    child: RichText(
                        text: TextSpan(
                            text: "جستجو در ",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontFamily: 'byekan'),
                            children: [
                          WidgetSpan(
                              child: Stack(
                            children: <Widget>[
                              Transform.translate(
                                  offset: Offset(17, 5),
                                  child: Text(
                                    ' \u{F169} \ue000',
                                    style: TextStyle(fontFamily: 'digikala',color: Colors.black54,fontSize: 16),
                                  )),
                              Transform.translate(
                                  offset: Offset(-25, 5),
                                  child: Text(
                                    ' \u{F168} \ue000',
                                    style: TextStyle(fontFamily: 'digikala',color: Colors.red,fontSize: 16),
                                  ))
                            ],
                          ))
//                          TextSpan(
//                            text: "دیجی",
//                            style: TextStyle(
//                                color: Colors.black54,
//                                fontSize: 20,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          TextSpan(
//                            text: "کالا",
//                            style: TextStyle(
//                                color: Colors.red,
//                                fontSize: 20,
//                                fontWeight: FontWeight.bold),
//                          ),
                        ])),
                    offset: Offset(-40.0, -5.0),
                  ),
                  // Adobe XD layer: 'Oval' (shape)

                  Transform.translate(
                    offset: Offset(10, -3),
                    child:
                        // Adobe XD layer: 'Shape' (shape)
                    Text(' \u{F03F} \ue000',style: TextStyle(fontFamily: 'digim',fontSize: 22),)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blue, Colors.red],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
