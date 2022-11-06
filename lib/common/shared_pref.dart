import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreManager {
  SharedPreferences? _preferences;

  Future<SharedPreferences> get getPreferences async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future write<T>(String key, dynamic value) async {
    SharedPreferences sp = await getPreferences;
    switch (T) {
      case String:
        return await sp.setString(key, value);
      case bool:
        return await sp.setBool(key, value);
      case double:
        return await sp.setDouble(key, value);
      case int:
        return await sp.setInt(key, value);
      case Map:
        final stringFromMap = jsonEncode(value);
        return await sp.setString(key, stringFromMap);
      default:
        throw "SharedPreManager.write<T>: missing T";
    }
  }

  Future read<T>(String key) async {
    try {
      SharedPreferences sp = await getPreferences;
      switch (T) {
        case String:
          return sp.getString(key);
        case bool:
          return sp.getBool(key);
        case double:
          return sp.getDouble(key);
        case int:
          return sp.getInt(key);
        case Map:
          final mapString = sp.getString(key);
          var result = mapString != null ? jsonDecode(mapString) : null;
          return result;
        default:
          return sp.get(key);
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future remove(String key) async {
    SharedPreferences sp = await getPreferences;
    return sp.remove(key);
  }

  Future removeAll(String key) async {
    SharedPreferences sp = await getPreferences;
    return sp.clear();
  }
}