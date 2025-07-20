import 'package:dio/dio.dart';
import 'package:elevate_c3_sunday/core/values/api_endpoints.dart';
import 'package:elevate_c3_sunday/features/home/api/models/response/categories_response.dart';
import 'package:elevate_c3_sunday/features/home/api/models/response/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApiEndpoints.productsEndpoint)
  Future<ProductsResponse> getProducts({
    @Query("limit") int productPerPage = 10,
    @Query("page") int pageNumber = 1,
  });

  @GET(ApiEndpoints.categoriesEndpoint)
  Future<CategoriesResponse> getCategories({
    @Query("limit") int categoryPerPage = 10,
    @Query("page") int pageNumber = 1,
  });
}
