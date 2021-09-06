import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/screens/HomePage.dart';
import 'package:recipeworld/screens/profilePage.dart';
import 'package:recipeworld/screens/searchPage.dart';
import 'package:recipeworld/screens/trendingPage.dart';

class RootApp extends StatefulWidget {
  RootApp({Key key}) : super(key: key);

  @override
  RootAppState createState() => RootAppState();
}

class RootAppState extends State<RootApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  int currentIndex = 0;
  final screens = [
    HomePage(),
    SearchPage(),
    TrendingPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(
          color: AppColors.primaryGrey,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.backColor,
            icon: Icon(
              Icons.home_rounded,
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: '.',
          ),
        ],
        showUnselectedLabels: false,
      ),
    );
  }
}
