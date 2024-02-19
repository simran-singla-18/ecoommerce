import 'package:ecoommerce/domain/model/products.dart';

abstract class ProductsEvents{
  final Products? products;
  const ProductsEvents({this.products});
}

class GetProductEvent extends ProductsEvents{
  const GetProductEvent();
}
class CartProductEvent extends ProductsEvents{
  const CartProductEvent(Products pro):super(products: pro);
}