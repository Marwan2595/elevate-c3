import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';

class HomeState {
  bool isLoading1;
  List<CategoryModel> catList1;
  String? catError1;

  bool isLoading2;
  List<CategoryModel> catList2;
  String? catError2;

  HomeState({
    this.isLoading1 = true,
    this.catList1 = const [],
    this.catError1,
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
      isLoading1: isLoading1Arg ?? isLoading1,
      catList1: catList1Arg ?? catList1,
      catError1: catError1Arg,


      isLoading2: isLoading2Arg ?? isLoading2,
      catList2: catList2Arg ?? catList2,
      catError2: catError2Arg,

    );


  }
}
//
// import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
//
// sealed class HomeState {}
//
// class HomeInitialState extends HomeState {}
//
// class HomeLoadingState extends HomeState {}
//
// class HomeSuccessState extends HomeState {
//   List<CategoryModel> catList;
//   HomeSuccessState({required this.catList});
// }
//
// class HomeErrorState extends HomeState {
//   String errorMessage;
//   HomeErrorState({required this.errorMessage});
// }

