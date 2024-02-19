import 'package:ecoommerce/domain/model/productsentity.dart';

abstract class LocalProductState {
  final List<ProductsEntity>? products;

  const LocalProductState({
    this.products,
  });
}

class LocalProductsStateLoading extends LocalProductState {
  const LocalProductsStateLoading();
}

class GetAllLocalProductsStateDone extends LocalProductState {
  const GetAllLocalProductsStateDone(List<ProductsEntity> products)
      : super(products: products);
}

class SaveProducts extends LocalProductState {
  const SaveProducts(List<ProductsEntity> products) : super(products: products);
}


class RemoveProducts extends LocalProductState {
  const RemoveProducts(List<ProductsEntity> products) : super(products: products);
}