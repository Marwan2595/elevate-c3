import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_products_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeViewModel(this.getCategoriesUseCase, this.getProductsUseCase);

  Future<void> getProducts() async {}
  Future<void> getCategories() async {
    List<CategoryModel> catList = await getCategoriesUseCase.call();
    catList.forEach((cat) {
      print("=================================");
      print(cat.name);
      print("=================================");
    });
  }
}
