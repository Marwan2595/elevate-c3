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
    : super(HomeState());

  Future<void> getHomeData()async{
    getCategories1();
    getCategories2();
  }


  Future<void> getCategories1() async {
    emit(state.copyWith(isLoading1Arg: true));

    ApiResult<List<CategoryModel>> catResult1 = await getCategoriesUseCase();

   
    switch (catResult1) {
      case ApiSuccessResult<List<CategoryModel>>():
        emit(
          state.copyWith(isLoading1Arg: false, catList1Arg: catResult1.data),
        );
      case ApiErrorResult<List<CategoryModel>>():
        emit(state.copyWith(isLoading1Arg: false, catError1Arg: catResult1.errorMessage));
    }
  }

  Future<void> getCategories2() async {
    emit(state.copyWith(isLoading2Arg: true));
    await Future.delayed(Duration(seconds: 2));
    ApiResult<List<CategoryModel>> catResult2 = await getCategoriesUseCase();
    switch (catResult2) {
      case ApiSuccessResult<List<CategoryModel>>():
        emit(state.copyWith(isLoading2Arg: false,catList2Arg: catResult2.data));
      case ApiErrorResult<List<CategoryModel>>():
        emit(state.copyWith(isLoading2Arg: false,catError2Arg: catResult2.errorMessage));
    }
  }
}
