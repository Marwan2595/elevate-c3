import 'package:elevate_c3_sunday/config/dio_module/api_result.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';

abstract class HomeRepoContract {
  Future<List<ProductModel>> getProducts({
    String? categoryId,
    int? productPerPage,
    int? pageNumber,
  });
  Future<ApiResult<List<CategoryModel>>> getCategories();
}
