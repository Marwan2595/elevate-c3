import 'package:elevate_c3_sunday/config/api_result/api_result.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  HomeRepoContract homeRepo;

  GetCategoriesUseCase(this.homeRepo);
  Future<ApiResult<List<CategoryModel>>> call() async {
    ApiResult<List<CategoryModel>> catResult = await homeRepo.getCategories();
    return catResult;
  }
}
