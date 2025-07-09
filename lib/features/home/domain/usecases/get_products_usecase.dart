import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  HomeRepoContract homeRepo;

  GetProductsUseCase(this.homeRepo);
  Future<List<ProductModel>> call({
    String? categoryId,
    int? productPerPage,
    int? pageNumber,
  }) async {
    List<ProductModel> productList = await homeRepo.getProducts(
      categoryId: categoryId,
      productPerPage: productPerPage,
      pageNumber: pageNumber,
    );
    return productList;
  }
}
