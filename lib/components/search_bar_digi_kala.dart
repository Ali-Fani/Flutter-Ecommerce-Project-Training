import 'package:flutter/material.dart';

class SearchBarDigiKala extends StatelessWidget {
  const SearchBarDigiKala({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    child: Transform.translate(
                      offset: Offset(-18, 2),
                      child: Stack(

                  children: <Widget>[
                      Transform.translate(
                          offset: Offset(17, 5),
                          child: Text(
                            ' \u{F169}',
                            style: TextStyle(
                                fontFamily: 'digikala',
                                color: Colors.black54,
                                fontSize: 16),
                          )),
                      Transform.translate(
                          offset: Offset(-25, 5),
                          child: Text(
                            ' \u{F168}',
                            style: TextStyle(
                                fontFamily: 'digikala',
                                color: Colors.red,
                                fontSize: 16),
                          ))
                  ],
                ),
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
                Text(
              ' \u{F03F}',
              style: TextStyle(fontFamily: 'digim', fontSize: 22),
            )),
      ],
    );
  }
}
