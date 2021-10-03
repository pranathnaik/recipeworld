import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeworld/model/Post.dart';
import 'package:recipeworld/model/User.dart';
import 'package:recipeworld/pages/profilepages/profilePage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Container buildNoContent() {
    return Container(
        child: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "search",
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }

  Future<QuerySnapshot> searchResultFuture;

  handleSearch(String query) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    Future<QuerySnapshot> users = collectionReference
        .where("UserName", isGreaterThanOrEqualTo: query)
        .get();

    setState(() {
      searchResultFuture = users;
    });
  }

  Future<QuerySnapshot> searchPostResultFuture;
  handlePostSearch(String query) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("posts");
    Future<QuerySnapshot> posts = collectionReference
        .where("RecipeTitle", isGreaterThanOrEqualTo: query)
        .get();

    setState(() {
      searchPostResultFuture = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: CupertinoSearchTextField(
            suffixIcon: Icon(Icons.cancel_outlined),
            onSubmitted: (s) {
              handleSearch(s);
              handlePostSearch(s);
            },
          ),
          backgroundColor: AppColors.backColor,
          elevation: 0,
          bottom: TabBar(labelPadding: EdgeInsets.only(bottom: 20), tabs: [
            Text('post', style: TextStyle(color: Colors.black)),
            Text('accounts', style: TextStyle(color: Colors.black))
          ]),
        ),
        backgroundColor: AppColors.backColor,
        body: searchResultFuture == null
            ? buildNoContent()
            : TabBarView(children: [postcontainer(), usercontainer()]),
      ),
    );
  }

  FutureBuilder postcontainer() {
    return FutureBuilder(
      future: searchPostResultFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          List<PostResult> searchResults = [];
          snapshot.data.docs.forEach((doc) {
            Post post = Post.fromDocument(doc);
            PostResult searchResult = PostResult(post);
            searchResults.add(searchResult);
          });
          return ListView(children: searchResults);
        }
      },
    );
  }

  FutureBuilder usercontainer() {
    return FutureBuilder(
      future: searchResultFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          List<UserResult> searchResults = [];
          snapshot.data.docs.forEach((doc) {
            Userapp user = Userapp.fromDocument(doc);
            UserResult searchResult = UserResult(user);
            searchResults.add(searchResult);
          });
          return ListView(children: searchResults);
        }
      },
    );
  }
}

//
class UserResult extends StatelessWidget {
  final Userapp user;
  UserResult(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryGreen,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    profileid: user.userId,
                  ),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.userProfileImage),
                ),
                title: Text(
                  user.userName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            )
          ],
        ));
  }
}

class PostResult extends StatelessWidget {
  final Post post;
  PostResult(this.post);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryGreen,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => print("tapped"),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.postImage),
                ),
                title: Text(
                  post.reciepeTitle,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              height: 2.0,
            )
          ],
        ));
  }
}
