import 'package:ecoommerce/domain/model/productsentity.dart';

abstract class LocalProductEvent {
  final ProductsEntity? productsEntity;

  const LocalProductEvent({this.productsEntity});
}

class GetAllProductsEvent extends LocalProductEvent {
  const GetAllProductsEvent();
}

class SaveProductsEvent extends LocalProductEvent {
  const SaveProductsEvent(ProductsEntity productsEntity)
      : super(productsEntity: productsEntity);
}

  class RemoveProductsEvent extends LocalProductEvent {
  const RemoveProductsEvent(ProductsEntity productsEntity)
      : super(productsEntity: productsEntity);
}
