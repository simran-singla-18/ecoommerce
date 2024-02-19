import 'package:ecoommerce/core/network/usecase.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';

class LocalProductUseCase extends UseCase<List<ProductsEntity>, void> {
  final ProductRepo productRepo;

  LocalProductUseCase(this.productRepo);

  @override
  Future<List<ProductsEntity>> call(void params) {
    return productRepo.getLocalProducts();
  }
}
