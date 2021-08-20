import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/widgets/PostCards.dart';
import 'package:recipeworld/config/size.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "It's Cooking Time!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.add_box,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: PostCards(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedIconTheme: IconThemeData(
          color: AppColors.primaryGrey,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
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
