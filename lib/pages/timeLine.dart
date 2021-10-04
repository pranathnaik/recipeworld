import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/model/Post.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/widgets/postCards.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<Post> posts;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  buildTimeLine() {
    if (posts == null) {
      return CircularProgressIndicator();
    } else if (posts.isEmpty) return Text("No Posts");
    // } else {
    //   return ListView(
    //     children: this.posts,
    //   );
    // }
  }

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
      body: PostCards(),
    );
  }
}
