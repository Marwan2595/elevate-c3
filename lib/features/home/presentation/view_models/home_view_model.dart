import 'package:elevate_c3_sunday/config/api_result/api_result.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeViewModel(this.getCategoriesUseCase, this.getProductsUseCase)
    : super(HomeInitialState());

  Future<void> getCategories() async {
    emit(HomeLoadingState());

    ApiResult<List<CategoryModel>> catResult = await getCategoriesUseCase();
    switch (catResult) {
      case ApiSuccessResult<List<CategoryModel>>():
        emit(HomeSuccessState(catList: catResult.data));
      case ApiErrorResult<List<CategoryModel>>():
        emit(HomeErrorState(errorMessage: catResult.errorMessage));
    }
  }
}
