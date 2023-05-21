import 'package:flutter/material.dart';
import 'package:shop_app/layout/app_cubit/cubit.dart';
import 'package:shop_app/layout/app_cubit/states.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/themes.dart';

import 'layout/home_layout.dart';
import 'modules/login/login_screen.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  tokenID = CacheHelper.getData(key: 'token');
if(tokenID != null)
  print('THE TOKEN ////////////'+ tokenID);
else print('////////////// THE TOKEN IS NULL //////////////');
  if(onBoarding != null)
  {
    if(tokenID != null) widget = HomeScreen();
    else widget = LoginScreen();
  } else
  {
    widget = OnBoardingScreen();
  }

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData()..getCategoriesData()..getFavorites()..getUserData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) => {},
        builder: (context, state) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,

          home: startWidget,

        ),

      ),
    );
  }
}

