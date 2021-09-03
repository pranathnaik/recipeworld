import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  color: Colors.grey,
                  height: height / 3.5,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1454793147212-9e7e57e89a4f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmlnfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: BackButton(color: Colors.blueAccent)),
                ),
              ],
            ),
            Container(
             
              child: Container(
                color: AppColors.primaryGreen,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/originals/a0/e9/8e/a0e98efbf3b9e832e508f8e667caec22.jpg"),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Ramesh',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () => {
                                Navigator.pushNamed(
                                    context, AppRoutes.profilePage)
                              },
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Chocolate shake",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Preparation',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'The upma recipe I share here is adapted from my mom’s recipe and continues to be a favorite in my home. The ingredients used to flavor the rava give it a deliciously satisfying taste that will make this ',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Time Required (45 Min)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ingredients',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
