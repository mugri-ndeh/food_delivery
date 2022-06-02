import 'package:delivery_app/auth/screens/login.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:delivery_app/util/theme.dart';
import 'package:delivery_app/util/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeprov;
  getTheme() {
    themeprov = Provider.of<ThemeProvider>(context, listen: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeprov;
      },
      child: Consumer<ThemeProvider>(builder: (_, prov, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: prov.darktheme ? customDarkTheme() : customLightTheme(),
          // darkTheme: customDarkTheme(),
          home: LoginScreen(),
        );
      }),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ThemeProvider>(context)
        .init()
        .then((value) => push(context, LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
