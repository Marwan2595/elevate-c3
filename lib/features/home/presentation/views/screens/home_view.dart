import 'package:elevate_c3_sunday/config/di/di.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_events.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_states.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel..doIntent(GetCategoriesAllEvent()),
      child: Scaffold(
        // appBar: AppBar(title: Text("Home Screen")),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Home Screen Edit GitHub"),
              BlocBuilder<HomeViewModel, HomeState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      CategoryListWidget(
                        isLoading: state.isLoading1,
                        catList: state.catList1,
                        errorMsg: state.catError1,
                      ),
                      const SizedBox(height: 50,),
                      CategoryListWidget(
                        isLoading: state.isLoading2,
                        catList: state.catList2,
                        errorMsg: state.catError2,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({
    super.key,
    required this.isLoading,
    required this.catList ,
    this.errorMsg,
  });
  final bool isLoading;
  final List<CategoryModel> catList;
  String? errorMsg;
  @override
  Widget build(BuildContext context) {
    if(isLoading) return Center(child:  CircularProgressIndicator(),);
    if(errorMsg != null)return Center(child:  Text(errorMsg!),);
    return       SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catList.length,
        itemBuilder: (context, index) {
          return CategoryCard(catModel: catList[index]);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.catModel});
  final CategoryModel catModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(catModel.imageUrl),
          ),
          Text(catModel.name),
        ],
      ),
    );
  }
}
