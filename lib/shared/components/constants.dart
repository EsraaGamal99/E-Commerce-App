import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

String tokenID ;

void signOut(context){
  defaultTextButton(
    onPressed: ()
  {
    CacheHelper.removeData(key: 'token');
    navigateAndFinish(context, LoginScreen());
  }, text: 'Sign Out',);
}