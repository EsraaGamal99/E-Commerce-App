// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop_app/models/search_model.dart';
// import 'package:shop_app/modules/search/search_cubit/states.dart';
// import 'package:shop_app/shared/components/constants.dart';
// import 'package:shop_app/shared/network/remote/dio_helper.dart';
//
// import '../../../shared/network/end_points.dart';
//
// class SearchCubit extends Cubit<SearchStates> {
//   SearchCubit() : super(InitialState());
//   static SearchCubit get(context)=> BlocProvider.of(context);
//
//   SearchModel searchModel;
//
//   void search(String text) {
//     emit(SearchLoadingState());
//
//     DioHelper.postData(
//       url: SEARCH,
//       token: tokenID,
//       data: {'text': text},
//     ).then((value) {
//       searchModel = SearchModel.fromJson(value.data);
//       emit(SearchSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(SearchErrorState());
//     });
//   }
// }
