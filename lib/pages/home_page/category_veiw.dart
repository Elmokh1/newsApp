import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/models/category_model.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/pages/home_page/Widgets/tap_item.dart';
import 'package:news_app_route/pages/home_page/category_view_model.dart';
import 'package:news_app_route/pages/home_page/tab_bar_list_view.dart';
import 'package:news_app_route/shared_componnant/network/api_Manger.dart';

import '../../bloc/my_cubit.dart';

class CategoryVeiw extends StatelessWidget {
  CategoryModel selected;

  CategoryVeiw({Key? key, required this.selected}) : super(key: key);
  @override
  var viewModel = MyCubit();

  @override
  Widget build(BuildContext context) {
    viewModel.LoadNewsSources(selected.id);
    return BlocBuilder<MyCubit, NewsViewState>(
      builder: (context, state) {
        if (state is LoadingState) {
          // show loading state
          return Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 2,
              ),
              Text(state.loadingMessage ?? ""),
            ],
          );
        }
        if (state is ErrorState) {
          // Show Error
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage ?? "",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10,),
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 50,
                    ))
              ],
            ),
          );
        }
        if (state is SuccessState) {
          List<Source> sourse = state.sources;
          return TabBarListView(sourse);
        }
        return Container();
      },
      bloc: viewModel, //بنحطله ال cubit
    );
    // return BlocBuilder<CategoryViewModel,CategoryViewState>(
    //   bloc: viewModel ,
    //   builder: (context, state){
    //     if(state is LoadingState){
    //       //Show Loading
    //       return  Column(
    //         children: [
    //
    //           CircularProgressIndicator(),
    //           SizedBox(height:2,),
    //           Text(state.lodingMessage ?? ""),
    //         ],
    //       );
    //     }
    //     if(state is ErrorState){
    //       //Show Error
    //       return Column(
    //         children: [
    //           Text(state.ErrorMessage ?? ""),
    //           IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
    //         ],
    //       );
    //
    //     }
    //     if(state is SuccessState){
    //       //Show Result
    //       List<Source> sourse = state.sources;
    //       return TabBarListView(sourse);
    //
    //     }
    //     return Container();
    //   },
    // );

    // return FutureBuilder<SourceModel>(
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError)
    //       return Text('Error...${snapshot.error}');
    //     else if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator();
    //     } else {
    //       SourceModel? sourse = snapshot.data;
    //       return TabBarListView(sourse!);
    //     }
    //   },
    //   future: ApiManger.fetchRespons(widget.selected.id),
    // );
  }
}
