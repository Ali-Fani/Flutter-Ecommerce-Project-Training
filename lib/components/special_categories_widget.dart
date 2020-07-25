import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class specialCategoriesWidget extends StatelessWidget {
  const specialCategoriesWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.red.shade800,
                    child: IconButton(icon: FaIcon(FontAwesomeIcons.percent,size: 14,color: Colors.white,)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[Text("فروش ویژه",style: TextStyle(fontSize: 12),)],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.green.shade800,
                    child: IconButton(icon: FaIcon(FontAwesomeIcons.shoppingBasket,color: Colors.white,size: 14,)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[Text("موادغذایی",style: TextStyle(fontSize: 12),)],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.purple.shade800,
                    child: IconButton(icon: FaIcon(FontAwesomeIcons.tshirt,color: Colors.white,size: 14,)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[Text("پوشاک",style: TextStyle(fontSize: 12),)],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.teal.shade800,
                    child: IconButton(icon: FaIcon(FontAwesomeIcons.laptop,color: Colors.white,size: 14,)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[Text("کالای دیجیتال",style: TextStyle(fontSize: 12),)],
              )
            ],
          ),

        ],
      ),
    );
  }
}
