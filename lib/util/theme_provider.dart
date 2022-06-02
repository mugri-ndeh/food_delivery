import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool darktheme = false;
  late SharedPreferences prefs;
  Future init() async {
    prefs = await SharedPreferences.getInstance();
    darktheme = prefs.getBool('darkTheme') ?? false;
    return darktheme;
  }

  ThemeProvider() {
    init();
  }

  toggleDarkMode() {
    darktheme = !darktheme;
    prefs.setBool('darkTheme', darktheme);
    notifyListeners();
  }
}
