import "package:flutter/material.dart";
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _input = TextEditingController();
  String valueChoose,recipeTitle,preparation,category,time,ingredients;
  var selectedCurrency;
  List listItem = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
  ];
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
    this.preparation = preparation;
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
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("userspost")
        .doc(getCurrentUID().toString());
    Map<String, dynamic> users = {
      "UserId": getCurrentUID.toString(),
      "ProfileImage": imgUrl,
      "RecipeTitle": recipeTitle,
      "Preparation": preparation,
      "Category": category,
      "Time": time,
      "Indredients": ingredients

    };

    documentReference.set(users).whenComplete(() {
      Navigator.pushNamed(context, AppRoutes.rootApp);
    }).catchError((e) => print(e));
  }

  getCurrentUID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String uid = user.uid;
    print(uid);
    return uid;
  }

  //image
  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('recipecategories').snapshots();
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
          Row(
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              //   height: 200,
              //   width: MediaQuery.of(context).size.width,
              //   child: Icon(Icons.camera_enhance),
              // ),
              // InkWell(
              //   onTap: () => getImage(),
              //   child: GFAvatar(
              //     radius: 100,
              //     shape: GFAvatarShape.standard,
              //     backgroundImage: image != null
              //         ? FileImage(image)
              //         : NetworkImage("null"),
              //   ),
              // ),
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
                    onChanged: (String recipeTitle){
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
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: DropdownButton(
                          underline: Container(color: Colors.transparent),
                          hint: Text(
                            "Select Categories",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          dropdownColor: AppColors.secondaryOrange,
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                              child: Text(valueItem),
                              value: valueItem,
                            );
                          }).toList(),
                        ),
                      ),

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
                          intrests.add(_input.text);
                          _input.clear();
                        });
                      }
                      print(intrests);
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
                      children: List.from(intrests.map((e) => chipBuilder(
                            onTap: () {
                              setState(() {
                                intrests.remove(e);
                              });
                            },
                            title: e,
                          ))),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: _usersStream,
                      builder: (context, snapshot){
                        if (!snapshot.hasData)
                          const Text("Loading.....");
                        else {
                          List<DropdownMenuItem> currencyItems = [];
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            DocumentSnapshot snap = snapshot.data.docs[i];
                            currencyItems.add(
                              DropdownMenuItem(
                                child: Text(
                                  snap.id,
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),
                                value: "${snap.id}",
                              ),
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add,
                                  size: 25.0, color: Color(0xff11b719)),
                              SizedBox(width: 50.0),
                              DropdownButton(
                                items: currencyItems,
                                onChanged: (currencyValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Currency value is $currencyValue',
                                      style: TextStyle(color: Color(0xff11b719)),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCurrency = currencyValue;
                                  });
                                },
                                value: selectedCurrency,
                                isExpanded: false,
                                hint: new Text(
                                  "Choose Currency Type",
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),
                              ),
                            ],
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> intrests = [];
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
