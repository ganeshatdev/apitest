import 'dart:convert';

import 'package:apiapp/model/testapimodels.dart';
import 'package:apiapp/screens/userslist.dart';
import 'package:apiapp/utils/endurl.dart';
import 'package:http/http.dart' as http;

class Testapicall{
  
 static Future testapi()async{
  
  print("function falling");
 var request=await http.get(Uri.parse(testapiurl));
 var responseJson=request.body;
//  print(responseJson);
Map responseJsonDecoded=jsonDecode(responseJson);

if(request.statusCode==200){
  testapidata.clear();
  if(responseJsonDecoded['status']){
  //  var data= TestapimodelFromJson(responseJson);
  print("run time type ${responseJsonDecoded['data'].runtimeType}");
  List<dynamic> dataa=responseJsonDecoded['data'];
  print('dataa ${dataa}');
  var data=dataa.map((e){return  Testapimodel.fromjson(e);});
  return data.toList();
  //  for(var i=1;i>=data.l){

  //  }
  }else{
    (responseJsonDecoded['msg']);
  }
}else{
  print("Server error");
}

 return true ;
}
}