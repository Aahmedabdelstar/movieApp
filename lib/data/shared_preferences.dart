import 'package:shared_preferences/shared_preferences.dart';


saveString(String key, String value) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  sharedPreferences.setString(key, value) ;
}

Future<String> getString(String key, String defaultValue) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  print('value');
  return sharedPreferences.getString(key) ?? defaultValue ;
}


saveBoolean(String key, bool value) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  sharedPreferences.setBool(key, value) ;
}

Future<bool> getBoolean(String key, bool defaultValue) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  return sharedPreferences.getBool(key) ?? false;
}


saveInteger(String key, int value) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  sharedPreferences.setInt(key, value) ;
}

Future<int> getInteger(String key, int defaultValue) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  return sharedPreferences.getInt(key) ?? defaultValue ;
}

