import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/services/firebaseservice.dart';
import 'package:recipeworld/widgets/userPostCards.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileEdit);
              },
              child: Icon(
                Icons.edit_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<Object>(
            future: users.doc(FirebaseService.getCurrentUID().toString()).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data as DocumentSnapshot;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data["ProfileImage"]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      data["UserName"],
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      data["UserBio"],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Subscribers",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("1020")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: AppColors.primaryGreen,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: Text('Subscribe'),
                    ),
                    Divider(
                      height: 22.0,
                      thickness: 0.6,
                      color: Colors.black,
                    ),
                    UserPostCards()
                  ],
                );
              }
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryGreen,
              ));
            }),
      ),
    );
  }
}
