import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/home/screens/favourites/favourites_provider.dart';
import 'package:delivery_app/root.dart/root.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/theme.dart';
import 'package:delivery_app/util/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(create: (context) => Authentication()),
      ChangeNotifierProvider(create: (context) => FavouritesHelper()),
    ],
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(),
      // darkTheme: customDarkTheme(),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Provider.of<Authentication>(context, listen: false)
          .init()
          .then((value) => pushReplacement(context, const AuthRoot()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primaryGreen,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Logo.png'),
        ],
      )),
    );
  }
}
