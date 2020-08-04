
import 'package:flutterfinalproject/Models/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;


class Cart{
//  Product product;
//  int count;
//  Cart({this.product,this.count});
//  Map<String, dynamic> toJson() => {
//    'product': product,
//    'count': count,
//  };
//  factory Cart.fromJson(Map<String, dynamic> jsonData) {
//    return Cart(
//      product: jsonData['product'],
//      count: jsonData['count'],
//    );
//  }
//  static Map<String, dynamic> toMap(Cart cart) => {
//    'product': cart.product,
//    'count':cart.count,
//
//  };
//
//  static String encodeMusics(List<Cart> carts) => convert.json.encode(
//    carts
//        .map<Map<String, dynamic>>((cart) => Cart.toMap(cart))
//        .toList(),
//  );
//
//  static List<Cart> decodeMusics(String musics) =>
//      (convert.json.decode(musics) as List<dynamic>)
//          .map<Cart>((item) => Cart.fromJson(item))
//          .toList();
  static Future<bool> add_product_cart(String product_id,String title,int price,String img_url) async{


    SharedPreferences prefs=await SharedPreferences.getInstance();

    /*prefs.remove('products_id');*/

    String products_id=prefs.getString("products_id");

    if (products_id!=null) {

      if (products_id.indexOf(product_id)>=0) {



        await change_number_product(product_id);

      }
      else{


        String data=products_id+product_id+"_";
        prefs.setString('products_id', data);
        await add_product_data(product_id,title,price,img_url);

      }


    }
    else{

      String data=product_id+"_";
      prefs.setString('products_id', data);
      await add_product_data(product_id,title,price,img_url);
      print("a");

    }

    return true;





  }



  static add_product_data(String product_id,String title,int price,String img_url) async{

    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('title_'+product_id, title);
    prefs.setInt('price_'+product_id, price);
    prefs.setString('img_url_'+product_id, img_url);
    prefs.setInt('number_'+product_id, 1);


  }



  static change_number_product(String product_id) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int n=prefs.getInt('number_'+product_id);
    n=n+1;
    prefs.setInt('number_'+product_id,n);



  }


  static Future<bool> remove_cart_product(String product_id) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String products_id=prefs.getString("products_id");
    products_id=products_id.replaceAll(product_id+"_", "");

    if(products_id.isEmpty){

      prefs.remove('products_id');


    }else{

      prefs.setString('products_id', products_id);

    }

    prefs.remove('title_'+product_id);
    prefs.remove('price_'+product_id);
    prefs.remove('img_url_'+product_id);
    prefs.remove('number_'+product_id);

    return true;


  }



  static Future<bool> empty_cart() async{

    SharedPreferences prefs=await SharedPreferences.getInstance();

    String products_id=prefs.getString("produts_id");

    List<String> p_id=products_id.split('_');

    for(int i=0;i<(p_id.length-1);i++){

      prefs.remove('title_'+p_id[i]);
      prefs.remove('price_'+p_id[i]);
      prefs.remove('img_url_'+p_id[i]);
      prefs.remove('number_'+p_id[i]);




    }


    prefs.remove('products_id');

    return true;



  }


}