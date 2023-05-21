import 'package:apiapp/api/testapi.dart';
import 'package:apiapp/model/testapimodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();

  
}

  List <Testapimodel> testapidata=[];
class _UserlistState extends State<Userlist> {
  @override
  void initState() {

    fetchdata(setState);
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    ScrollController listpageconrolelr=ScrollController();
    ScrollController productcontroller=ScrollController();

    var size=MediaQuery.of(context).size;
    var h=size.height;
    var w=size.width;
    return Scaffold(
      body: SafeArea(
        child:testapidata.length==0?Center(child: CircularProgressIndicator(),): SizedBox(
          // height: double.infinity,
          child: ListView.builder(itemCount: testapidata.length,itemBuilder: ( (context, index) {
              var data=testapidata[index];
                  return Container(
                    height: 500,
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Flexible(flex: 1, child: Text("name= ${data.name ??'Unknown'}")),
                        Flexible(
                          flex: 1,
                          
                          child: Container(
                            color: Colors.amber,
                            child: ListView.builder(physics:NeverScrollableScrollPhysics(),itemCount: data.products.length, itemBuilder: ((context, indexs) {
                              var productdata=data.products[indexs];
                              var categorydata=data.products[indexs].category;
                              return Column(
                                children: [
                                  Container(child: Text("product name = "+productdata.pname.toString())),
                                  Container(
                                    color: Colors.lime,
                                    padding: EdgeInsets.all(50),
                                    child: Column(
                                      children: [
                                        Text(categorydata.categoryname.toString()),
                                        Text(categorydata.description.toString())
                                      ],
                                    ),
                                  )
                                ],
                              );
                            })),
                          ),
                        )
                        
                      ],
                    ),
                  );
               })),
        ),
      ),
    );
  }
}

Future<void> fetchdata(setState)async{
  final abc= await Testapicall.testapi();
  setState((){
    testapidata=abc;
  });
}