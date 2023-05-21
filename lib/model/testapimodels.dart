import 'dart:convert';

// Testapimodel TestapimodelFromJson(String str) => Testapimodel.fromjson(json.decode(str));

class Testapimodel{
  String? name;
  var id;
  var products;
  Testapimodel({ this.name, this.id,required this.products}){
    // print("id=> $id  name=>$name");

    // print("$products");
  }

  factory Testapimodel.fromjson(Map json){

    List productdata=json['product'] as  List;
    // print("productdata ${productdata}");
    var ss=productdata.map((listt) => Product.fromjson(listt))  ;
    // print("runtimepype productdata = ${productdata.runtimeType}");

   
    
    return Testapimodel(name: json['name'],id: json['id'],products:ss.toList()) ;
    
    }//Testapimodel(name: json['data']['name'],id: json['data']['id'])
// 

}

class Product{
  int? pid;
  String? pname;
  int? price;
  var category;

  Product({this.pid,this.pname,this.price,this.category});

  factory Product.fromjson(Map json){ 
    Map<String,dynamic> categorydetail=json['catdetail'];
    var catdetail=Category.fromjson(categorydetail);
    print("category in product ${catdetail}");

     return Product( pid: json['product_id'],pname: json['pname'],price: json['price'],category: catdetail);}

}

class Category{
  String? categoryname;
  String? description;

  Category(this.categoryname,this.description);

  factory Category.fromjson(Map json)=>Category(json['catename'], json['description']) ; 

}