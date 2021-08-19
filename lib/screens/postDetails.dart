import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.network(
                "https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Container(
                color: AppColors.secondaryGreen,
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
                          Text('Ramesh',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
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
