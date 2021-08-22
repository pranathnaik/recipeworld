import 'package:flutter/material.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/screens/postDetails.dart';
import 'package:recipeworld/screens/rootApp.dart';
import 'package:recipeworld/screens/signIn.dart';
import 'package:recipeworld/screens/signUp.dart';
import 'package:recipeworld/screens/trendingPage.dart';

import 'screens/HomePage.dart';
import 'package:recipeworld/screens/searchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      initialRoute: AppRoutes.signIn,
      routes: {
        AppRoutes.rootApp: (context) => RootApp(),
        AppRoutes.signIn: (context) => SignIn(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.postDetails: (context) => PostDetails(),
        AppRoutes.signUp: (context) => SignUp(),
        AppRoutes.searchPage: (context) => SearchPage(),
        AppRoutes.trendingPage: (context) => TrendingPage()
      },
    );
  }
}
