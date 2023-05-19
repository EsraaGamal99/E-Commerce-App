 import 'package:shop_app/models/change_favorites_model.dart';

abstract class AppStates{}

 class AppInitialState extends AppStates{}

 class ChangeBottomNavBarState extends AppStates{}

 class AppLoadingHomeState extends AppStates{}

 class AppSuccessHomeState extends AppStates{}

 class AppErrorHomeState extends AppStates{}

 class AppSuccessCategoriesState extends AppStates{}

 class AppErrorCategoriesState extends AppStates{}

 class AppFavoritesState extends AppStates{}

 class AppSuccessFavoritesState extends AppStates{

 final ChangeFavoritesModel model;

  AppSuccessFavoritesState(this.model);
 }

 class AppErrorFavoritesState extends AppStates{
 final error;

  AppErrorFavoritesState(this.error);
 }
 class AppLoadingGetFavoritesState extends AppStates{}

 class AppGetFavoritesSuccessState extends AppStates{}

 class AppGetFavoritesErrorState extends AppStates{

 final error;
  AppGetFavoritesErrorState(this.error);
 }