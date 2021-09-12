import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:recipeworld/services/firebaseservice.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final String uid = FirebaseService.getCurrentUID();
  String uname, ubio;
  File image;
  String imgUrl;

  getUserName(name) {
    this.uname = name;
    print(this.uname);
  }

  getUserBio(bio) {
    this.ubio = bio;
  }

  saveUser() async {
    var storageImage = FirebaseStorage.instance
        .ref()
        .child("users")
        .child("profile")
        .child(image.path);
    var task = storageImage.putFile(image);
    imgUrl = await (await task).ref.getDownloadURL();
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(uid);
    Map<String, dynamic> users = {
      "UserId": uid,
      "UserName": uname,
      "UserBio": ubio,
      "ProfileImage": imgUrl
    };

    documentReference.set(users).whenComplete(() {
      Navigator.pushNamed(context, AppRoutes.rootApp);
    }).catchError((e) => print(e));
  }

  //image
  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

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
                onTap: () {
                  saveUser();
                },
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
                  InkWell(
                    onTap: () => getImage(),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: image != null
                          ? FileImage(image)
                          : NetworkImage("null"),
                    ),
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
                      onChanged: (String uname) {
                        getUserName(uname);
                      },
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
                      onChanged: (String ubio) {
                        getUserBio(ubio);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
