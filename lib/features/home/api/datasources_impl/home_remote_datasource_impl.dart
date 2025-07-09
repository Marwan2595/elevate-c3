import 'package:elevate_c3_sunday/config/api_result/api_result.dart';
import 'package:elevate_c3_sunday/features/home/api/client/home_api_client.dart';
import 'package:elevate_c3_sunday/features/home/api/models/response/categories_response.dart';
import 'package:elevate_c3_sunday/features/home/api/models/response/products_response.dart';
import 'package:elevate_c3_sunday/features/home/data/datasources/home_remote_datasource.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeApiClient apiClient;
  

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    List<CategoryModel> catList = [];
    try {
      CategoriesResponse catRes = await apiClient.getCategories();
      catList =
          catRes.data?.map((catDTO) => catDTO.toCategoryModel()).toList() ?? [];
      return ApiSuccessResult<List<CategoryModel>>(catList);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult<List<CategoryModel>>(e.message ?? e.toString());
      }
      return ApiErrorResult<List<CategoryModel>>(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProducts({
    int? productPerPage,
    int? pageNumber,
    String? categoryId,
  }) async {
    ProductsResponse productsRes = await apiClient.getProducts(
      pageNumber: pageNumber ?? 1,
      productPerPage: productPerPage ?? 10,
      categoryId: categoryId ?? "",
    );
    List<ProductModel> catList =
        productsRes.data
            ?.map((productDTO) => productDTO.toProductModel())
            .toList() ??
        [];
    return catList;
  }
}
