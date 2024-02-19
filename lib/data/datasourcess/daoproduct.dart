import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DaoProduct{

  @Query("Select * From ProductsEntity")
  Future<List<ProductsEntity>> getAllProducts();

  @insert
  Future<void> insertProducts(ProductsEntity pro);

  @delete
  Future<void> removeProducts(ProductsEntity pro);
}