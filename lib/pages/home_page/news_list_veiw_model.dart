import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/shared_componnant/network/api_Manger.dart';

import '../../models/ArticalsModel.dart';

class NewsListVeiwModel extends Cubit<NewsListVeiwState> {
  NewsListVeiwModel() : super(LoadingState(loadingMessage: "Loading..................."));

  void loadArticles(String sourceId) async {
    try {
      var respons = await ApiManger.fetchNewsList(sourceId);
      if (respons.status == "error") {
        emit(ErrorState(errorMessage: respons.message));
        return;
      }
      if (respons.status == "ok") {
        emit(SuccessState(respons.articles!));
        return;
      }
    } on TimeoutException catch(e) {
      emit(ErrorState(errorMessage: "Coulden`t reach to server Please Check Your Internet and Try again"));
    }
    on Exception catch (e) {
      // TODO
      emit(ErrorState(errorMessage: "Please Try Again"));
    }
  }
}

abstract class NewsListVeiwState {}

class LoadingState extends NewsListVeiwState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListVeiwState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListVeiwState {
  List<Articles> articles;

  SuccessState(this.articles);
}
