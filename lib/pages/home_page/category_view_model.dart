// import 'dart:async';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app_route/shared_componnant/network/api_Manger.dart';
//
// import '../../models/source_model.dart';
//
// class CategoryViewModel extends Cubit<CategoryViewState> {
//   CategoryViewModel() : super(LoadingState());
//
//   void loadNewsSources(String category) async {
//     try {
//       var response = await ApiManger.fetchRespons(category);
//       if (response.status == "error") {
//         emit(ErrorState(ErrorMessage: response.message));
//       }
//       if (response.status == "ok") {
//         emit(SuccessState(response.sources!));
//       }
//     } on TimeoutException catch (e) {
//       emit(ErrorState(
//           ErrorMessage:
//               "Coulden`t reach to server Please Check Your Internet and Try again"));
//     } on Exception catch (e) {
//       emit(
//           ErrorState(ErrorMessage: "Please Check Your Internet and Try again"));
//     }
//   }
// }
//
// // عندنا ٣ حاجات اللي هما (error,loading,success)
// //واحنا المفروض نباصي حاجه واحده لل cubit لانه مبيقبلش غير واحده بس
// //هنا بقا عملنا احنا abstract class علشان نحل المشكله
// //دا اسمه مبدا البوليمر فيزم
//
// abstract class CategoryViewState {}
//
// class LoadingState extends CategoryViewState {
//   String? lodingMessage;
//
//   LoadingState({this.lodingMessage});
// }
//
// class ErrorState extends CategoryViewState {
//   String? ErrorMessage;
//   Exception? exception;
//
//   ErrorState({this.ErrorMessage, this.exception});
// }
//
// class SuccessState extends CategoryViewState {
//   List<Source> sources;
//
//   SuccessState(this.sources);
// }
