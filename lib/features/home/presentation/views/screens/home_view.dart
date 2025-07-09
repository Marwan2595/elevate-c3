import 'package:elevate_c3_sunday/config/di/di.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
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
      create: (context) => homeViewModel..getCategories(),
      child: Scaffold(
        appBar: AppBar(title: Text("Home Screen")),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Home Screen"),
              BlocBuilder<HomeViewModel, HomeState>(
                builder: (context, state) {
                  switch (state) {
                    case HomeInitialState():
                    case HomeLoadingState():
                      return Center(child: CircularProgressIndicator());
                    case HomeSuccessState():
                      return SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.catList.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(catModel: state.catList[index]);
                          },
                        ),
                      );
                    case HomeErrorState():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
            ],
          ),
        ),
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
