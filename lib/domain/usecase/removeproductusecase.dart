import 'package:ecoommerce/core/network/usecase.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';

class RemoveProductUsecase extends UseCase<void,ProductsEntity> {
  final ProductRepo productRepo;

  RemoveProductUsecase(this.productRepo);

  @override
  Future<void> call(ProductsEntity productsEntity) {
    return productRepo.removeLocalProducts(productsEntity);
  }
}
