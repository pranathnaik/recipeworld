import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/pages/authpages/signIn.dart';
import 'package:recipeworld/utils/userSecureStorage.dart';
import 'package:recipeworld/widgets/userPostCards.dart';

class ProfilePage extends StatefulWidget {
  String profileid;
  ProfilePage({this.profileid});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userid;
  bool isFollowing;
  buildUnfollowbutton() {
    // print("userid " + userid);
    // print("profileid" + widget.profileid);
    bool isProfileOwner = userid == widget.profileid;
    if (isProfileOwner) {
      return buildButton(text: "Edit profile", function: handleEditProfile);
    } else if (isFollowing) {
      return buildButton(text: "unfollow", function: handleUnfollowUser);
    } else if (!isFollowing) {
      return buildButton(text: "follow", function: handleFollowUser);
    }
  }

  @override
  void initState() {
    super.initState();
    // getUnfollowrs();
    // getSubscription();
    init();
    checkIfFollowd();
  }

  Future init() async {
    final id = await UserSecureStorage.getUserId();
    setState(() {
      this.userid = id;
    });
  }

  checkIfFollowd() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.profileid)
        .collection('userFollowers')
        .doc(userid)
        .get();

    print(doc.exists);
    isFollowing = doc.exists;
    buildUnfollowbutton();
    print("following status " + isFollowing.toString());
  }

  handleUnfollowUser() {
    followersRef
        .doc(widget.profileid)
        .collection('userFollowers')
        .doc(this.userid)
        .get()
        .then((value) => {
              if (value.exists) {value.reference.delete()},
            });
    followingRef
        .doc(this.userid)
        .collection("userFollowing")
        .doc(widget.profileid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  value.reference.delete().then((value) {
                    setState(() {});
                  })
                },
              checkIfFollowd()
            });
  }

  handleFollowUser() {
    followersRef
        .doc(widget.profileid)
        .collection('userFollowers')
        .doc(this.userid)
        .set({});
    followingRef
        .doc(this.userid)
        .collection("userFollowing")
        .doc(widget.profileid)
        .set({}).then((value) {
      setState(() {});
      checkIfFollowd();
    });
  }

  handleEditProfile() {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        backgroundColor: AppColors.backColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          "Your Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            offset: const Offset(0.0, 60.0),
            icon: new Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              onMenuItemSelected(context, value);
            },
            color: AppColors.backColor,
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text('Sign Out')),
            ],
          )
        ],
      ),
      body: FutureBuilder<Object>(
          future: users.doc(widget.profileid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data as DocumentSnapshot;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(data["ProfileImage"]),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Unfollowrs",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "1020",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    buildUnfollowbutton()
                                  ],
                                ),
                              ],
                            ),
                          ]),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data["UserName"],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            data["UserBio"],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ]),
                  ),
                  Divider(
                    height: 22.0,
                    thickness: 0.6,
                    color: Colors.black,
                  ),
                  UserPostCards(currentUserId: widget.profileid)
                ],
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
            ));
          }),
    );
  }

  Container buildButton({String text, Function function}) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          elevation: 0,
          primary: isFollowing ? Colors.redAccent : AppColors.primaryGreen,
        ),
        onPressed: () {
          function();
        },
        child: Text(text),
      ),
    );
  }

  void onMenuItemSelected(BuildContext context, int item) {
    switch (item) {
      case 1:
        final auth = FirebaseAuth.instance;
        auth.signOut();
        break;

      default:
    }
  }
}
