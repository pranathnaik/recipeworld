import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.secondaryGreen,
                ),
              ),
            )
            // Container(
            //   margin: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     color: AppColors.secondaryGreen,
            //   ),
            //   height: height / 15,
            //   width: width,
            //   child: Padding(
            //     padding: const EdgeInsets.all(15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Icon(Icons.search),
            //         Expanded(
            //           child: TextField(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
