import 'package:dio/dio.dart';
import 'package:ecoommerce/domain/model/products.dart';

abstract class ProductsState {
  final List<Products>? products;
  final DioException? exception;

  const ProductsState({this.products, this.exception});
}

class GetProductsStateLoading extends ProductsState {
  const GetProductsStateLoading();

}

class GetProductsStateDone extends ProductsState {
  const GetProductsStateDone(List<Products> products)
      : super(products: products);
}


class CartProductsState extends ProductsState {
  const CartProductsState(List<Products> products)
      : super(products: products);
}

class GetProductsStateFailed extends ProductsState{
  const GetProductsStateFailed(DioException exception): super(exception: exception);
  }
