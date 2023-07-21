import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_route/shared_componnant/network/api_Manger.dart';

import '../models/source_model.dart';

part 'my_state.dart';

class MyCubit extends Cubit<NewsViewState> {
  MyCubit() : super(LoadingState());
  static MyCubit get(context) => BlocProvider.of(context);

  void LoadNewsSources(String category) async {
    try {
      var response = await ApiManger.fetchRespons(category);
      if (response.status == "error") {
        //show Error
        emit(ErrorState());
      }
      if (response.status == "ok") {
        //show source
        emit(SuccessState(response.sources!));
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(errorMessage: "Couldn't reach Data "));
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: "Please Try again"));
    }
  }
}
