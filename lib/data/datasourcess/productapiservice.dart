
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:ecoommerce/domain/model/products.dart';
part 'productapiservice.g.dart';

@RestApi(baseUrl:"https://fakestoreapi.com")
abstract class ProductApiService{
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET("/products")
  Future<HttpResponse<List<Products>>> getProducts();
}