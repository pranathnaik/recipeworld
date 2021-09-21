import 'package:flutter/material.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/config/colors.dart';

class PostCards extends StatelessWidget {
  const PostCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    var height = SizeConfig.getHeight(context);
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: height / 50,
                horizontal: width / 45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: AppColors.primaryGreen,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/originals/a0/e9/8e/a0e98efbf3b9e832e508f8e667caec22.jpg"),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            print('name tap');
                          },
                          child: Text(
                            'Ramesh khan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Image.network(
                        "https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    color: AppColors.secondaryGreen,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vegetables',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'vegetable is vegetable lorem ipsum hello 123 hdfjhadfjhasdkfjadhskfjhds',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      // color: AppColors.primaryGreen,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(child: Icon(Icons.thumb_up)),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.postDetails);
                            },
                            child: Text('View Recipe',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          // InkWell(
                          //     onTap: () {}, child: Icon(Icons.save_alt)),
                          // InkWell(onTap: () {}, child: Icon(Icons.share)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              height: height / 2.6,
            );
          }),
    );
  }
}