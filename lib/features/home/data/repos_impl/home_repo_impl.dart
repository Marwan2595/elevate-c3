import 'package:elevate_c3_sunday/features/home/data/datasources/home_local_datasource.dart';
import 'package:elevate_c3_sunday/features/home/data/datasources/home_remote_datasource.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  HomeLocalDataSource homeLocalDataSource;
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeLocalDataSource, this.homeRemoteDataSource);

  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> catList = await homeRemoteDataSource.getCategories();
    return catList;
  }

  @override
  Future<List<ProductModel>> getProducts({
    String? categoryId,
    int? productPerPage,
    int? pageNumber,
  }) async {
    List<ProductModel> productList = await homeRemoteDataSource.getProducts(
      categoryId: categoryId,
      productPerPage: productPerPage,
      pageNumber: pageNumber,
    );
    return productList;
  }
}
