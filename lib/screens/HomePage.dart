import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';

import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/widgets/PostCards.dart';
import 'package:recipeworld/config/size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backColor,
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
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.createPost);
                },
                child: Icon(
                  Icons.add_circle,
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
    );
  }
}
