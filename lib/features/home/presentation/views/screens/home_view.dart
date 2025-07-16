import 'package:elevate_c3_sunday/config/di/di.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    homeViewModel.getCategories();
    return Scaffold(
      body: Column(
        children: [
          Text("Text 1"),
          Text("Text 2"),
          Text("Text 3"),
          Text("Text 4"),
          Text("25565554")
        ],
      ),
    );
  }
}
