import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';

class HomeState {
  bool isLoadingCategories = false;
  bool isLoadingProducts = false;

  List<CategoryModel> categories = <CategoryModel>[];
  List<ProductModel> products = <ProductModel>[];

  String? errorProducts = '';
  String? errorCategories = '';

  HomeState({
    this.isLoadingCategories = true,
    this.isLoadingProducts = true,
    this.categories = const [],
    this.products = const [],
    this.errorCategories,
    this.errorProducts,
  });


    HomeState copyWith({
    bool? isLoadingCategories,
    bool? isLoadingProducts,
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    String? errorCategories,
    String? errorProducts,
  }) {
    return HomeState(
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      errorCategories: errorCategories ?? this.errorCategories,
      errorProducts: errorProducts ?? this.errorProducts,
    );
  }
}



