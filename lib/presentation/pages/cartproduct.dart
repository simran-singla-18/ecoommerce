import 'package:ecoommerce/presentation/bloc/local/localproductevent.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/local/localproductbloc.dart';

class CartProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartProducts();
}

class CartProducts extends State<CartProduct> {
  @override
  void initState() {
    final localEvent = BlocProvider.of<LocalProductBloc>(context);
    localEvent.add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Cart Products")),
          body: _body(),
        ));
  }

  _body() {
    return BlocBuilder<LocalProductBloc, LocalProductState>(
        builder: (context, state) {
      if (state is GetAllLocalProductsStateDone) {
        return ListView.builder(
          itemCount: state.products!.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: Colors.blueGrey[100] as Color,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Image.network(
                    state.products![index].image.toString(),
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                          child: Text(
                            state.products![index].category.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        Text(
                          state.products![index].title.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 800,
                          child: Text(
                            state.products![index].description.toString(),
                            textDirection: TextDirection.ltr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "MRP:",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                TextSpan(
                                  text: state.products![index].price.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<LocalProductBloc>(context)
                        ..add(RemoveProductsEvent(state.products![index]));
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      size: 35,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        );
      }
      return SizedBox(
        height: 1,
      );
    });
  }
}
