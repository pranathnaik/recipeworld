import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/screens/postDetails.dart';
import 'package:recipeworld/screens/profileEdit.dart';
import 'package:recipeworld/screens/rootApp.dart';
import 'package:recipeworld/screens/searchPage.dart';
import 'package:recipeworld/screens/signIn.dart';
import 'package:recipeworld/screens/signUp.dart';
import 'package:recipeworld/screens/profilePage.dart';
import 'package:recipeworld/screens/trendingPage.dart';
import 'package:recipeworld/screens/verifyScreen.dart';
import 'screens/HomePage.dart';
import 'package:recipeworld/screens/createPost.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        AppRoutes.profilePage: (context) => ProfilePage(),
        AppRoutes.searchPage: (context) => SearchPage(),
        AppRoutes.trendingPage: (context) => TrendingPage(),
        AppRoutes.createPost: (context) => CreatePost(),
        AppRoutes.profileEdit: (context) => ProfileEdit(),
        AppRoutes.verifyScreen: (context) => VerifyScreen()
      },
    );
  }
}
