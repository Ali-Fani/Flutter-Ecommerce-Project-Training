import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
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
        GestureDetector(
          onTap: (){
            print('search box taped');
          },
          child: Container(
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
                child:title
                    // Adobe XD layer: 'Icon_Search' (group)

              ),
            ],
          ),
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
