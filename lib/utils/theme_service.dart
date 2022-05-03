import 'package:flutter/material.dart';
import 'package:flutter_test_en_1/utils/styles.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static ThemeData lightTheme() {
    return ThemeData(
        backgroundColor: AppColor.whiteColor,
        textTheme: const TextTheme(
                subtitle1: TextStyle(fontSize: 14),
                subtitle2: TextStyle(fontSize: 18),
                bodyText1: TextStyle(fontSize: 22))
            .apply(
                bodyColor: AppColor.blackColor,
                displayColor: AppColor.blackColor),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.whiteColor,
            iconTheme: IconThemeData(color: AppColor.blackColor)),
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: AppColor.whiteColor));
  }

  static ThemeData darkTheme() {
    return ThemeData(
        backgroundColor: AppColor.greyColor,
        textTheme: const TextTheme(
                subtitle1: TextStyle(fontSize: 14),
                subtitle2: TextStyle(fontSize: 18),
                bodyText1: TextStyle(fontSize: 22))
            .apply(
                bodyColor: AppColor.whiteColor,
                displayColor: AppColor.whiteColor),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.greyColor,
            iconTheme: IconThemeData(color: AppColor.whiteColor)),
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: AppColor.blackColor));
  }
}
