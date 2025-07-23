import 'package:elevate_c3_sunday/config/base_state/base_state.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';

class HomeState {
  CatOneStates? catOneStates;

  bool isLoading2;
  List<CategoryModel> catList2;
  String? catError2;

  HomeState({
    this.catOneStates,
    this.isLoading2 = true,
    this.catList2 = const [],
    this.catError2,
  });

  HomeState copyWith({
    bool? isLoading1Arg,
    List<CategoryModel>? catList1Arg,
    String? catError1Arg,
    bool? isLoading2Arg,
    List<CategoryModel>? catList2Arg,
    String? catError2Arg,
  }) {
    return HomeState(
      catOneStates: CatOneStates(
        isLoading: isLoading1Arg ?? catOneStates?.isLoading ?? false,
        catList: catList1Arg ?? catOneStates?.successData ?? [],
        errorMessage: catError1Arg ?? catOneStates?.errorMessage,
      ),

      isLoading2: isLoading2Arg ?? isLoading2,
      catList2: catList2Arg ?? catList2,
      catError2: catError2Arg,
    );
  }
}

class CatOneStates extends BaseState<List<CategoryModel>> {
  CatOneStates({
    required bool isLoading,
    required List<CategoryModel> catList,
    String? errorMessage,
  }) : super(
         isLoading: isLoading,
         successData: catList,
         errorMessage: errorMessage,
       );
}
//
// import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';

// sealed class HomeState {}

// class HomeInitialState extends HomeState {}

// class HomeLoadingState extends HomeState {}

// class HomeSuccessState extends HomeState {
//   List<CategoryModel> catList;
//   HomeSuccessState({required this.catList});
// }

// class HomeErrorState extends HomeState {
//   String errorMessage;
//   HomeErrorState({required this.errorMessage});
// }
