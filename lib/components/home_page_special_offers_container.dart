import 'package:flutter/material.dart';
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:persian_numbers/persian_numbers.dart';
class HomePageSpecialOffersContainer extends StatelessWidget {

  const HomePageSpecialOffersContainer({
    Key key,
    @required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 12.5, bottom: 12.5, left: 40),
        children: <Widget>[
          Transform.translate(
            offset: Offset(-25, 0),
            child: Image(
              image: AssetImage("images/digi2.png"),
              height: 390,
            ),
          ),
          Transform.translate(
            offset: Offset(-30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: NetworkImage(
                              "https://dkstatics-public.digikala.com/digikala-products/119123965.jpg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("هدفون بی سیم مانستر مدل isport Spirit"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0, top: 45),
                        child: Text(
                            PersianNumbers.toPersian("${price}") + " تومان ",
                            style: TextStyle(
                                fontSize: 21.0,
                                fontFamily: 'byekan',
                                color: Colors.green,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  width: 170,
                  height: 330,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: NetworkImage(
                              "https://dkstatics-public.digikala.com/digikala-products/119123965.jpg"),
                        ),
                      )
                    ],
                  ),
                  width: 170,
                  height: 330,
                ),
              ],
            ),
          ),
        ],
        scrollDirection: Axis.horizontal,
      ),
      height: 390,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage("images/digi.png"), fit: BoxFit.fill)),
    );
  }
}
