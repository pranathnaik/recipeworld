import 'package:flutter/material.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/screens/postDetails.dart';
import 'package:recipeworld/screens/signIn.dart';
import 'package:recipeworld/screens/signUp.dart';
import 'config/colors.dart';
import 'screens/HomePage.dart';
import 'package:recipeworld/screens/createPost.dart';

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
      initialRoute: AppRoutes.createPost,
      routes: {
        AppRoutes.signIn: (context) => SignIn(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.postDetails: (context) => PostDetails(),
        AppRoutes.signUp: (context) => SignUp(),
        AppRoutes.createPost: (context) => CreatePost()
      },
    );
  }
}
