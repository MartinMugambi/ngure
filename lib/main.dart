import 'package:book_app/screens/add_image.dart';
import 'package:book_app/screens/book_info.dart';
import 'package:book_app/screens/further_cat.dart';
import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/screens/login.dart';
import 'package:book_app/screens/map_screen.dart';
import 'package:book_app/screens/price.dart';
import 'package:book_app/screens/signup.dart';
import 'package:book_app/screens/splash.dart';
import 'package:book_app/tabs_screen.dart/home_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        FurtherCat.routeName: (context) => FurtherCat(),
        BookInfoOne.routeName: (context) => BookInfoOne(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddingImageScreen.id: (context) => AddingImageScreen(),
        Price.id: (context) => Price(),
        MapView.id: (context) => MapView(),
        HomeTab.id: (context) => HomeTab(),
      },
    );
  }
}
