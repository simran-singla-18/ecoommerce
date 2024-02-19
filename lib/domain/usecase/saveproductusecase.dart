import 'package:ecoommerce/core/network/usecase.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';

class SaveProductUseCase extends UseCase<void,ProductsEntity> {
  final ProductRepo productRepo;

  SaveProductUseCase(this.productRepo);

  @override
  Future<void> call(ProductsEntity productsEntity) {
    return productRepo.insertLocalProducts(productsEntity);
  }
}
