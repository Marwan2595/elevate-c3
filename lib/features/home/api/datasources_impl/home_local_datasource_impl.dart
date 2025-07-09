import 'package:elevate_c3_sunday/features/home/data/datasources/home_local_datasource.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() {
    // Local DB
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts({String? categoryId}) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
