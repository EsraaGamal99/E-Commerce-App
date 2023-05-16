import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../models/categories_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_points.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() :super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;

  List<Widget> appScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  void changeNavBarIndex(index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  HomeModel homeModel;

  void getHomeData(){
    emit(AppLoadingHomeState());
    DioHelper.getData(url: HOME,token: token).then((value) {
      homeModel = HomeModel.FromJson(value.data);
      emit(AppSuccessHomeState());

    }).catchError((error){
      print(error.toString());
      emit(AppErrorHomeState());
    });

  }

  CategoriesModel categoriesModel;

  void getCategoriesData(){
    DioHelper.getData(url: Categories,lang: 'en',).then((value) {
      categoriesModel =CategoriesModel.fromJson(value.data);
      emit(AppSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(AppErrorCategoriesState());
    });
  }
}