import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/pages/postpages/postDetails.dart';
import 'package:recipeworld/services/firebaseservice.dart';

class UserPostCards extends StatelessWidget {
  final Future<QuerySnapshot> _userpoststream = FirebaseFirestore.instance
      .collection('posts')
      .doc(FirebaseService.getCurrentUID().toString())
      .collection("userposts")
      .get();
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Expanded(
      child: FutureBuilder<QuerySnapshot>(
          future: _userpoststream,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            if (snapshot.connectionState == ConnectionState.done)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you dont have any post "),
                  InkWell(
                    child: Text('create post',
                        style: TextStyle(
                            color: AppColors.primaryGreen, fontSize: 18)),
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.createPost),
                  ),
                ],
              );
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            if (snapshot.hasData)
              return ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: documents
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(10)),
                          margin:
                              EdgeInsets.only(bottom: 12, left: 15, right: 15),
                          height: height / 7,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetails(
                                  postid: e,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Image.network(e["PostImage"]),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.more_vert)),
                                        SizedBox(height: height / 60),
                                        Text(
                                          e["RecipeTitle"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          e["Preparation"],
                                          maxLines: 2,
                                          textDirection: TextDirection.rtl,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
          }),
    );
  }
}
