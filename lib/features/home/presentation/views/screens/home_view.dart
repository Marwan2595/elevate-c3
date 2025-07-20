import 'package:elevate_c3_sunday/config/di/di.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_events.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_state.dart';
import 'package:elevate_c3_sunday/features/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel..doIntent(GetHomeData()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Home Screen"),
              SizedBox(
                height: 250,
                width: double.infinity,

                child: BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.isLoadingCategories == true) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.errorCategories != null) {
                      return Center(child: Text(state.errorCategories!));
                    }
                    return ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.categories[index].name),
                        );
                      },
                    );
                  },
                ),
              ),
              const Divider(height: 50),
              const Text("Home Screen Products"),
              SizedBox(
                height: 250,
                width: double.infinity,

                child: BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.isLoadingProducts == true) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.errorProducts != null) {
                      return Center(child: Text(state.errorProducts!));
                    }
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.products[index].name),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//BlocProvider ==> provide object of viewModel to the ui


//BlocBuilder ==> build(context, state){
                                  //return widget
                                  //}

//BlocListener ==>  listen(context, state){
                         //call functions depending on state
                         //}

//BlocConsumer ==>  listen(context, state){
                         //call functions depending on state
                         //return widget
                         //}
             // ==>build(context, state){
                                  //return widget
                                  //}