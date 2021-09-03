import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
        backgroundColor: AppColors.backColor,
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backColor,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 17),
              child: InkWell(
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/dp1.jpg"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height / 55),
                    child: TextField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'name',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height / 55),
                    child: TextField(
                      maxLines: 5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'Bio',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
