import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecoommerce/core/network/dataset.dart';
import 'package:ecoommerce/data/datasourcess/productapiservice.dart';
import 'package:ecoommerce/data/repodata/productdatabase.dart';
import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductApiService productApiService;
  final ProductDataBase productDataBase;

  ProductRepoImpl(this.productApiService, this.productDataBase);

  @override
  Future<DataSet<List<Products>>> getProducts() async {
    final products = await productApiService.getProducts();
    try {
      if (products.response.statusCode == HttpStatus.ok)
        return DataSuccess(products.data);
      else
        return DataFailed(DioException(
            error: products.response.statusMessage,
            requestOptions: products.response.requestOptions));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ProductsEntity>> getLocalProducts() async {
    return productDataBase.daoProduct.getAllProducts();
  }

  @override
  Future<void> insertLocalProducts(ProductsEntity productsEntity) {
    return productDataBase.daoProduct.insertProducts(productsEntity);
  }

  @override
  Future<void> removeLocalProducts(ProductsEntity productsEntity) {
    return productDataBase.daoProduct.removeProducts(productsEntity);
  }
}
