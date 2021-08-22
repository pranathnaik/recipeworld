import "package:flutter/material.dart";
import 'package:recipeworld/config/colors.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _input = TextEditingController();
  String valueChoose;
  List listItem = [
    "Item 1",
    "Item 1",
    "Item 1",
    "Item 1",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
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
                    fontSize: 25,
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
              Container(
                color: Colors.grey,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.camera_enhance),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Recipe Title",
                      fillColor: AppColors.secondaryOrange,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Preparation",
                      fillColor: AppColors.secondaryOrange,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                            color: AppColors.secondaryOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: DropdownButton(
                          underline: Container(color: Colors.transparent),
                          hint: Text("Select Categories"),
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
                          decoration: InputDecoration(
                            hintText: "Time",
                            fillColor: AppColors.secondaryOrange,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
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
                    decoration: InputDecoration(
                      hintText: "Add Ingredients",
                      fillColor: AppColors.secondaryOrange,
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
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.clear,
            color: Colors.red,
            size: 20,
          ),
        ),
      ],
    ),
  );
}
