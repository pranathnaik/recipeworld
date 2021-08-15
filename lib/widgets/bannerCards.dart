import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';

class BannerCards extends StatelessWidget {
  const BannerCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: width / 30,
              ),
              child: Text(''),
              width: width / 1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryGreen,
              ),
            );
          }),
    );
  }
}
