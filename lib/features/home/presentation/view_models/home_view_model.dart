import 'package:elevate_c3_sunday/config/dio_module/api_result.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c3_sunday/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_events.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeViewModel(this.getCategoriesUseCase, this.getProductsUseCase)
    : super(HomeState());

  void doIntent(HomeEvents event) {
    switch (event) {
      case GetHomeData():
        _getHomeData();
        break;
      case GetCategoriesEvent():
        _getCategories();
        break;
      case GetProductsEvent():
        _getProducts();
        break;
    }
  }

  void _getHomeData() async {
    await Future.wait([_getCategories()]);
  }

  Future<void> _getCategories() async {
    //Loading Categories
    emit(state.copyWith(isLoadingCategories: true));
    ApiResult<List<CategoryModel>> catListResult = await getCategoriesUseCase
        .call();
    switch (catListResult) {
      case ApiSuccessResult<List<CategoryModel>>():
        emit(
          state.copyWith(
            isLoadingCategories: false,
            categories: catListResult.data,
          ),
        );
        break;
      case ApiErrorResult<List<CategoryModel>>():
        emit(
          state.copyWith(
            isLoadingCategories: false,
            errorCategories: catListResult.errorMessage,
          ),
        );
        break;
      case ApiStreamResult<List<CategoryModel>>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Future<void> _getProducts() async {
    //Loading Categories
    emit(state.copyWith(isLoadingProducts: true));
    List<ProductModel> productList = await getProductsUseCase.call();
    emit(state.copyWith(isLoadingProducts: false, products: productList));
  }
}
// class HomeViewModel extends Bloc<HomeEvents, HomeState> {
//   GetCategoriesUseCase getCategoriesUseCase;
//   GetProductsUseCase getProductsUseCase;

//   HomeViewModel(this.getCategoriesUseCase, this.getProductsUseCase)
//     : super(HomeState()) {
//     on<GetHomeData>(_getHomeData);
//     on<GetCategoriesEvent>(_getCategories);
//     on<GetProductsEvent>(_getProducts);
//   }

//   void _getHomeData(GetHomeData event, Emitter emit) async {
//     await Future.wait([
//       _getCategories(GetCategoriesEvent(), emit),
//       _getProducts(GetProductsEvent(), emit),
//     ]);
//   }

//   Future<void> _getCategories(GetCategoriesEvent event, Emitter emit) async {
//     //Loading Categories
//     emit(state.copyWith(isLoadingCategories: true));
//     List<CategoryModel> catList = await getCategoriesUseCase.call();
//     emit(state.copyWith(isLoadingCategories: false, categories: catList));
//   }

//   Future<void> _getProducts(GetProductsEvent event, Emitter emit) async {
//     //Loading Categories
//     emit(state.copyWith(isLoadingProducts: true));
//     List<ProductModel> productList = await getProductsUseCase.call();
//     emit(state.copyWith(isLoadingProducts: false, products: productList));
//   }
// }
