import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 200),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(top: 30),
            child: new TabBar(
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: "سبدخرید",
                ),
                Tab(
                  text: "لیست خرید بعدی",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "محصولات در سبد خرید",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'byekan'),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Container(
                    height: 200,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.transparent,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Image(
                                      image: AssetImage(
                                          "images/Product_pcis/115604447.jpg")),
                                  height: 150,
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.transparent,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: EdgeInsets.only(right: 10, top: 0),
                                  child: Text(
                                    "گوشی گیمینگ لنوو مدل لژیون",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  height: 150,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Transform.translate(
                                offset: Offset(0, 5),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.up,

                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
//                                      for (final m in cart) {
//                                        final letter = m.id;
//                                        print(map2.containsKey(letter.toString()));
//                                        map2[letter.toString()] = map2.containsKey(letter.toString()) ? map2[letter.toString()] + 1 : 1;
//                                      }
//                                      print(map2);
                                          },
                                        )
                                      ],
                                    ),
                                    Column(children: <Widget>[
                                      Text(
                                        count.toString(),
                                        style: TextStyle(color: Colors.red,fontFamily: 'byekan',fontSize: 20),
                                      )
                                    ]),
                                    Column(children: <Widget>[
                                      count > 1
                                          ? IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {})
                                          : IconButton(
                                              icon: Text(
                                                "\u{F018}",
                                                style: TextStyle(
                                                    fontFamily: 'digim',
                                                    color: Colors.red,
                                                    fontSize: 25),
                                              ),
                                              onPressed: () {
                                                print("deleteed");
                                              },
                                            )
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "محصولات در سبد خرید",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'byekan'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ) // Complete this code in the next step.
        ;
  }
}
