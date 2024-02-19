import 'package:dio/dio.dart';
import 'package:ecoommerce/data/datasourcess/daoproduct.dart';
import 'package:ecoommerce/data/datasourcess/productapiservice.dart';
import 'package:ecoommerce/data/repodata/productdatabase.dart';
import 'package:ecoommerce/data/repodata/productrepoimpl.dart';
import 'package:ecoommerce/domain/repodomain/productrepo.dart';
import 'package:ecoommerce/domain/usecase/localproductusecase.dart';
import 'package:ecoommerce/domain/usecase/productusecase.dart';
import 'package:ecoommerce/domain/usecase/saveproductusecase.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductbloc.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsbloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecase/removeproductusecase.dart';

final locator = GetIt.instance;

Future<void> initilaizeDependecies() async {
  locator.registerSingleton<Dio>(Dio());

  final database = await $FloorProductDataBase
      .databaseBuilder('product_database_db')
      .build();
  locator.registerSingleton<ProductDataBase>(database);
  locator.registerSingleton<ProductApiService>(ProductApiService(locator()));
  locator.registerSingleton<ProductRepo>(ProductRepoImpl(locator(), locator()));
  locator.registerSingleton<ProductUseCase>(ProductUseCase(locator()));
  locator.registerSingleton<SaveProductUseCase>(SaveProductUseCase(locator()));
  locator.registerSingleton<LocalProductUseCase>(LocalProductUseCase(locator()));
  locator.registerSingleton<RemoveProductUsecase>(RemoveProductUsecase(locator()));

  locator.registerFactory<ProductsBloc>(() => ProductsBloc(locator()));
  locator.registerFactory<LocalProductBloc>(() => LocalProductBloc(locator(),locator(),locator()));



}
