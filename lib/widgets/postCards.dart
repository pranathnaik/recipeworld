import 'package:flutter/material.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/config/colors.dart';

class PostCards extends StatelessWidget {
  const PostCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: height / 40,
                horizontal: width / 22,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: AppColors.primaryGreen,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(children: [
                          Text(
                            'Ramesh khan',
                            style: TextStyle(),
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
                        child: Column(children: [
                          Text(
                            'Vegetables',
                          ),
                          Text(
                            'vegetable is vegetable lorem ipsum',
                          ),
                        ]),
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
                              InkWell(
                                  onTap: () {}, child: Icon(Icons.thumb_up)),
                              InkWell(
                                  onTap: () {}, child: Icon(Icons.save_alt)),
                              InkWell(onTap: () {}, child: Icon(Icons.share)),
                            ],
                          ),
                        ))
                  ]),
              height: height / 2.6,
            );
          }),
    );
  }
}
