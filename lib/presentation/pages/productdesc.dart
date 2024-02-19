import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductbloc.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductevent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

import 'cartproduct.dart';

class ProductDesc extends StatelessWidget{
   ProductDesc({super.key});
  @override
  Widget build(BuildContext context) {
    final product= ModalRoute.of(context)!.settings.arguments as Products;
  print(product.price);
    return
    WillPopScope(onWillPop:() async{
      Navigator.pop(context);
      return false;
    },
    child:
      Scaffold(appBar: AppBar(title: Text("product"),),
    body:SingleChildScrollView(child:  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(height:210,width:600,decoration: BoxDecoration(borderRadius:
        BorderRadius.circular(10),color :Colors.white24,),child: Image.network(product.image!.toString())),


        SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
      product.title.toString(),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
        SizedBox(height: 5,),

        Container(
          padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text(
      product.description.toString(),style: TextStyle(fontSize: 18),
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),

              SizedBox(height: 13,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                    child: RichText(
                      text: TextSpan(style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "MRP:",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text:  product.price.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InputQty(
                    decoration: QtyDecorationProps(borderShape: BorderShapeBtn.square,contentPadding: EdgeInsets.all(5),
                    plusBtn: Icon(Icons.add_circle_outline_outlined),btnColor: Colors.white24,
                    minusBtn: Icon(Icons.exposure_minus_1_outlined),),
                    initVal: 0,
                    maxVal: 10,
                    minVal: -100,
                    steps: 1,
                    onQtyChanged: (val) {
                    },
                  ),                ],
              ),
               SizedBox(height: 15,),
                  Container( width: 300,height:45,decoration: BoxDecoration(borderRadius:BorderRadius.circular(16) ),
                    child: ElevatedButton.icon(onPressed: (){
                      addToCart(product,context);

                    }, style:ButtonStyle(iconColor:MaterialStateProperty.all(Colors.black),
                       padding: MaterialStateProperty.all(
                 EdgeInsets.fromLTRB(20,10,10,10)),backgroundColor:MaterialStateProperty.all(Colors.yellow),
                 ) , icon: Icon(Icons.add_shopping_cart,size: 15,),
                 label: Text("Add to cart",style: TextStyle(fontSize: 15,color: Colors.black),),),
                  ),

          SizedBox(height: 15,),

          Container( width: 300,height:45,decoration: BoxDecoration(borderRadius:BorderRadius.circular(16) ),
            child: ElevatedButton.icon(onPressed: (){
            }, style:ButtonStyle(iconColor:MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(20,10,10,10)),backgroundColor:MaterialStateProperty.all(Colors.orange),
            ) , icon: Icon(Icons.currency_rupee,size: 15,),
              label: Text("Buy",style: TextStyle(fontSize: 15,color: Colors.black),),),
          ),

        ],),
    ))
      ));

  }
  addToCart(Products product, BuildContext context){
    final localBloc= BlocProvider.of<LocalProductBloc>(context);
    localBloc.add((SaveProductsEvent(ProductsEntity(title: product.title,price: product.price,image:
    product.image,id:product.id,category: product.category))));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider.value(
              value: localBloc
              , child:  CartProduct(), // Your target screen
            ),
      ),
    );

  }

}