import 'package:ecoommerce/core/network/dataset.dart';
import 'package:ecoommerce/core/network/usecase.dart';
import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';

class ProductUseCase extends UseCase<DataSet<List<Products>>,void>{

  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);
  @override
  Future<DataSet<List<Products>>> call(void params) {
  return productRepo.getProducts();
  }


}