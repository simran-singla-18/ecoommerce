import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';

import '../../core/network/dataset.dart';

abstract class ProductRepo {
  Future<DataSet<List<Products>>> getProducts();

  Future<List<ProductsEntity>> getLocalProducts();

  Future<void> insertLocalProducts(ProductsEntity productsEntity);

  Future<void> removeLocalProducts(ProductsEntity productsEntity);

 // Future<void> getLocalProducts();
}
