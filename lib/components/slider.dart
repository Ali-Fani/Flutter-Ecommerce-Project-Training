import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterfinalproject/Models/banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutterfinalproject/components/utils.dart';
class picSlider extends StatefulWidget {
  picSlider({Key key}) : super(key: key);

  @override
  _picSliderState createState() => _picSliderState();
}

class _picSliderState extends State<picSlider> {
  List<AppBanner> sliders=[];
  void getSliders(List<AppBanner> list){

  if(sliders.length==0){



    var url=GetData.server_url+"Main-sliders";

    http.get(url).then((response){



      if (response.statusCode==200) {
        List jsonResponse = convert.jsonDecode(response.body);
        for (int i = 0; i < jsonResponse.length; i++) {
          setState(() {
            sliders.add(new AppBanner(

              img_url: jsonResponse[i]['images'][0]["url"],
              url: jsonResponse[i]['link']

            ),


            );
          });
        }
      }
    }
        );}

  }
  @override
  Widget build(BuildContext context) {
    getSliders(sliders);


    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(

        options: CarouselOptions(height: 200.0),
        items: sliders.map((i) {
          String image_url=i.img_url;
          String url=i.url;

          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: (){
                  print(url);
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: ClipRRect(
                      child: Image(
                        image: NetworkImage("http://10.0.2.2:1337"+"$image_url"),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(6)),
                    )),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}