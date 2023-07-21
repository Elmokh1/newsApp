part of 'my_cubit.dart';

abstract class NewsViewState {}

class LoadingState extends NewsViewState {
  String ? loadingMessage;

  LoadingState({this.loadingMessage});
}
class ErrorState extends NewsViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}
class SuccessState extends NewsViewState {
  List<Source> sources ;

  SuccessState(this.sources);
}
