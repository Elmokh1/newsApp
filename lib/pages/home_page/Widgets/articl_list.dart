import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/models/ArticalsModel.dart';
import 'package:news_app_route/pages/home_page/Widgets/artical_view.dart';
import 'package:news_app_route/pages/home_page/news_list_veiw_model.dart';
import 'package:news_app_route/shared_componnant/network/api_Manger.dart';

class ArticlList extends StatelessWidget {
  String sourceId;
  var viewModel = NewsListVeiwModel();

  ArticlList(this.sourceId);

  @override
  Widget build(BuildContext context) {
    viewModel.loadArticles(sourceId);
    return BlocBuilder<NewsListVeiwModel, NewsListVeiwState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
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
          Column(
            children: [
              Text(state.errorMessage ?? ""),
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          );
        }
        if (state is SuccessState) {
          var articList = state.articles;
          return Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => ArticlView(articList[index]),
            itemCount: articList.length,
          ));
        }
        return Container();
      },
    );
    // return FutureBuilder<ArticalsModel>(
    //     future: ApiManger.fetchNewsList(sourceId),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError)
    //         return Text('Error...${snapshot.error}');
    //       else if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const CircularProgressIndicator();
    //       } else {
    //         var articList = snapshot.data!.articles ?? [];
    //         return Expanded(
    //           child: ListView.builder(
    //             itemBuilder: (context, index) =>
    //                 ArticlView(articList[index]),
    //             itemCount: articList.length,
    //           ),
    //         );
    //       }
    //     });
  }
}
