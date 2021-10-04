import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/pages/authpages/signIn.dart';
import 'package:recipeworld/pages/postpages/postDetails.dart';
import 'package:recipeworld/utils/userSecureStorage.dart';

class PostCards extends StatefulWidget {
  @override
  _PostCardsState createState() => _PostCardsState();
}
<<<<<<< HEAD

class _PostCardsState extends State<PostCards> {
  String currentuserid;
  // Map likes;
  // int likeCount;
  // bool isLiked;
  List<String> followinguserid = [];
  Future<QuerySnapshot> _timelinepoststream;
  getAllFollowingId() async {
    currentuserid = await UserSecureStorage.getUserId();
    print(currentuserid);
    await followingRef
        .doc(currentuserid)
        .collection('userFollowing')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        followinguserid.add(element.id);
      });
    });
    _timelinepoststream = FirebaseFirestore.instance
        .collection('posts')
        .where('UserIds', arrayContainsAny: [...followinguserid])
        .get()
        .whenComplete(() {
          setState(() {});
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllFollowingId();
  }

=======

class _PostCardsState extends State<PostCards> {
  String currentuserid;
  // Map likes;
  // int likeCount;
  // bool isLiked;
  List<String> followinguserid = [];
  Future<QuerySnapshot> _timelinepoststream;
  getAllFollowingId() async {
    currentuserid = await UserSecureStorage.getUserId();
    print(currentuserid);
    await followingRef
        .doc(currentuserid)
        .collection('userFollowing')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        followinguserid.add(element.id);
      });
    });
    _timelinepoststream = FirebaseFirestore.instance
        .collection('posts')
        .where('UserIds', arrayContainsAny: [...followinguserid])
        .get()
        .whenComplete(() {
          setState(() {});
        });
  }
>>>>>>> 01c820f24eb2b1226cbfc4cba38da035c1c4cc11

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllFollowingId();
  }

  // handleLikePost() {
  //   bool _isLiked = likes[currentuserid] == true;
  //
  //   if(_isLiked){
  //     postsRef
  //     .document(userId)
  //     .collection()
  //     setState(() {
  //       likeCount -= 1;
  //       isLiked = false;
  //       likes[currentuserid] = false;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    var height = SizeConfig.getHeight(context);
    return FutureBuilder(
        future: _timelinepoststream,
        builder: (context, snapshot) {
          List<DocumentSnapshot> documents;
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data.docs);
            documents = snapshot.data.docs;
            return ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: documents
                    .map((e) => Container(
                          margin: EdgeInsets.symmetric(
                            vertical: height / 50,
                            horizontal: width / 45,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: AppColors.primaryGreen,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Row(children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://i.pinimg.com/originals/a0/e9/8e/a0e98efbf3b9e832e508f8e667caec22.jpg"),
                                    ),
                                    SizedBox(width: 15),
                                    InkWell(
                                      onTap: () {
                                        print('name tap');
                                      },
                                      child: Text(
                                        'Ramesh khan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Expanded(
                                child: Image.network(e['PostImage'],
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                color: AppColors.secondaryGreen,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e['RecipeTitle'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                e['Preparation'],
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  // color: AppColors.primaryGreen,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        // onTap: (){
                                        //  if ()
                                        // },
                                          child: Icon(Icons.thumb_up)),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PostDetails(
                                                postid: e,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text('View Recipe',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      // InkWell(
                                      //     onTap: () {}, child: Icon(Icons.save_alt)),
                                      // InkWell(onTap: () {}, child: Icon(Icons.share)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: height / 2.6,
                        ))
                    .toList());
          } else if (!snapshot.hasData)
            return Container(
              constraints: BoxConstraints.expand(),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you have not followed anyone "),
                  InkWell(
                    child: Text('search and follow someone',
                        style: TextStyle(
                            color: AppColors.primaryGreen, fontSize: 18)),
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.searchPage),
                  ),
                ],
              ),
            );

          return Center(child: CircularProgressIndicator());
        });
  }
}
