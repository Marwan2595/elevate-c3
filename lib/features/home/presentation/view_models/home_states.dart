import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  List<CategoryModel> catList;
  HomeSuccessState({required this.catList});
}

class HomeErrorState extends HomeState {
  String errorMessage;
  HomeErrorState({required this.errorMessage});
}
