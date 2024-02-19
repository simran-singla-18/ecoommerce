import 'package:ecoommerce/main.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsbloc.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsstate.dart';
import 'package:ecoommerce/presentation/pages/productdesc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../bloc/remote/productsevent.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductScreens();
}

class ProductScreens extends State<ProductScreen> {
  @override
  void initState() {
    final kycHomeBloc = BlocProvider.of<ProductsBloc>(context);
    kycHomeBloc.add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: _build(),
    );
  }

  _build() {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is GetProductsStateDone) {
        return ListView.builder(
          itemCount: state.products!.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: BlocProvider.of<ProductsBloc>(context),
                          // Reuse the existing bloc
                          child: ProductDesc(), // Your target screen
                        ),
                    settings: RouteSettings(arguments: state.products![index])),
              ).then((value) =>
                  BlocProvider.of<ProductsBloc>(globalContext.currentContext!)
                      .add(GetProductEvent()));
            },
            child: Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.products![index].title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                itemCount: 5,
                                itemSize: 17,
                                allowHalfRating: true,
                                initialRating:
                                    state.products![index].rating!.rate!,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (value) => print(value),
                              ),
                              Text("(${state.products![index].rating!.count!})")
                            ],
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
                                    text:
                                        state.products![index].price.toString(),
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
                  )
                ],
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: 2,
      );
    });
  }
}
