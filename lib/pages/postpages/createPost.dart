import "package:flutter/material.dart";
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:recipeworld/services/firebaseservice.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _input = TextEditingController();
  String valueChoose, recipeTitle, preparation, category, time, ingredients;
  final String uid = FirebaseService.getCurrentUID();
  List<String> ingredientslist = [];
  var selectedCategory;
  File image;
  String imgUrl;

  getRecipeTitle(rtitle) {
    this.recipeTitle = rtitle;
    print(this.recipeTitle);
  }

  getPreparation(prepar) {
    this.preparation = prepar;
  }

  getCategory(cat) {
    this.selectedCategory = cat;
  }

  getTime(time) {
    this.time = time;
  }

  get(ingredients) {
    this.ingredients = ingredients;
  }

  createPost() async {
    var storageImage = FirebaseStorage.instance
        .ref()
        .child("users")
        .child("posts")
        .child(image.path);
    var task = storageImage.putFile(image);
    imgUrl = await (await task).ref.getDownloadURL();
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("posts")
        .doc(FirebaseService.getCurrentUID().toString())
        .collection("userposts");

    Map<String, dynamic> userpost = {
      "UserId": uid,
      "PostImage": imgUrl,
      "RecipeTitle": recipeTitle,
      "Preparation": preparation,
      "Category": selectedCategory,
      "Time": time,
      "Indredients": ingredientslist
    };

    collectionReference.add(userpost).whenComplete(() {
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

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('recipecategories').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        backgroundColor: AppColors.backColor,
        shadowColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              createPost();
            },
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.send_rounded,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image != null
                            ? FileImage(image)
                            : AssetImage("assets/images/imageicon.png")),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    getImage();
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Enter Recipe Title",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onChanged: (String recipeTitle) {
                      getRecipeTitle(recipeTitle);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Preparation",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onChanged: (String preparation) {
                      getPreparation(preparation);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: _usersStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {

                              List<DropdownMenuItem> categoryitems = [];
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                DocumentSnapshot snap = snapshot.data.docs[i];
                                categoryitems.add(
                                  DropdownMenuItem(
                                    child: Text(
                                      snap.id,
                                      style:
                                          TextStyle(color: Color(0xff11b719)),
                                    ),
                                    value: "${snap.id}",
                                  ),
                                );
                              }
                              return DropdownButton(
                                items: categoryitems,
                                onChanged: (categoryValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Currency value is $categoryValue',
                                      style:
                                          TextStyle(color: Color(0xff11b719)),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCategory = categoryValue;
                                  });
                                },
                                isExpanded: false,
                                value: selectedCategory,
                                underline: Container(color: Colors.transparent),
                                hint: new Text(
                                  "Select Categories",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                dropdownColor: AppColors.secondaryOrange,
                              );
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: "Time",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onChanged: (String time) {
                            getTime(time);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _input,
                    onSubmitted: (input) {
                      if (_input.text.isNotEmpty) {
                        setState(() {
                          ingredientslist.add(_input.text);
                          _input.clear();
                        });
                      }
                      print(ingredients);
                    },
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Add Ingredients",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: Wrap(
                      runSpacing: 6,
                      spacing: 6,
                      children:
                          List.from(ingredientslist.map((e) => chipBuilder(
                                onTap: () {
                                  setState(() {
                                    ingredientslist.remove(e);
                                  });
                                },
                                title: e,
                              ))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget chipBuilder({String title, Function onTap}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.secondaryGreen,
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title ?? "data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.clear,
            color: Colors.red,
            size: 25,
          ),
        ),
      ],
    ),
  );
}
