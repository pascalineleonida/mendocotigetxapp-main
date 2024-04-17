import 'package:internet_connection_checker/internet_connection_checker.dart';

class Connexioncheck{
  static checkconnection()async{
    bool result = false;
    result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      print('YAY! Free cute dog pics!');
      result = true;
      return result;
    } else {

      return result;
    }
  }
}