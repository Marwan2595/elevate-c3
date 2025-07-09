import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    String? categoryId,
    int? productPerPage,
    int? pageNumber,
  });
  Future<List<CategoryModel>> getCategories();
}
