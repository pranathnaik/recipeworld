import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/model/User.dart';
import 'package:recipeworld/pages/HomePage.dart';
import 'package:recipeworld/pages/authpages/signIn.dart';
import 'package:recipeworld/pages/profilepages/profilePage.dart';
import 'package:recipeworld/pages/searchpages/searchPage.dart';
import 'package:recipeworld/pages/trendingPage.dart';
import 'package:recipeworld/services/firebaseservice.dart';
import 'package:recipeworld/utils/userSecureStorage.dart';

class RootApp extends StatefulWidget {
  final String currentuserid;
  RootApp({this.currentuserid});

  @override
  RootAppState createState() => RootAppState();
}

class RootAppState extends State<RootApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> pages;
  checkAuthentification() async {
    print(widget.currentuserid);
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
    pages = [
      HomePage(),
      SearchPage(),
      TrendingPage(),
      ProfilePage(
        profileid: FirebaseService.getCurrentUID().toString(),
      ),
    ];

    print(UserSecureStorage.getUserId().toString());
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
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
