import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../models/categories_model.dart';
import '../../models/search_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> appScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeNavBarIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  HomeModel homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(AppLoadingHomeState());

    DioHelper.getData(url: HOME, token: tokenID).then((value) {
      homeModel = HomeModel.FromJson(value.data);
      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());
      emit(AppSuccessHomeState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorHomeState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: Categories,
      lang: 'en',
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(AppSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCategoriesState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorite(int productId) {
    favorites[productId] = !favorites[productId];
    emit(AppFavoritesState());
    if(favorites[productId]==null)
      emit(AppFavoritesLoadingState());

    DioHelper.postData(url: Favorites, token: tokenID, data: {
      'product_id': productId,
    }).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
        emit(AppSuccessFavoritesState(changeFavoritesModel));
      } else {
        getFavorites();
        emit(AppSuccessFavoritesState(changeFavoritesModel));
      }
    }).catchError((error) {
      print(error.toString());
      favorites[productId] = !favorites[productId];
      emit(AppErrorFavoritesState(error.toString()));
    });
  }

  FavoritesModel favoritesModel;

  void getFavorites() {
    emit(AppLoadingGetFavoritesState());

    DioHelper.getData(
      url: Favorites,
      token: tokenID,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(AppGetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetFavoritesErrorState(error.toString()));
    });
  }

  LoginModel userDataModel;

  void getUserData() {
    emit(AppLoadingGetUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: tokenID,
    ).then((value) {
      userDataModel = LoginModel.fromJson(value.data);

      emit(AppGetUserDataSuccessState(userDataModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserDataErrorState(error.toString()));
    });
  }

  //LoginModel userDataModel;
  void putUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(AppLoadingUpdateUserDataState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: tokenID,
      data:{
        'name':name,
        'email':email,
        'phone':phone,
      },
    ).then((value) {
      userDataModel = LoginModel.fromJson(value.data);
      emit(AppUpdateUserDataSuccessState(userDataModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppUpdateUserDataErrorState(error.toString()));
    });
  }

  SearchModel searchModel;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: tokenID,
      data: {'text': text},
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
