import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/config/routes.dart';

class UserPostCards extends StatefulWidget {
  @override
  _UserPostCardsState createState() => _UserPostCardsState();
}

class _UserPostCardsState extends State<UserPostCards> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
              height: height / 7,
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.postDetails),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.network(
                          "https://static.toiimg.com/thumb/61050397.cms?imgsize=246859&width=800&height=800"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.more_vert)),
                            SizedBox(height: height / 60),
                            Text(
                              'Samosa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'A samosa is a South Asian fried or baked pastry with a savory filling like spiced potatoes, onions, peas, chicken and other meats, or lentils. It may take different forms, including triangular, cone, or half-moon shapes, depending on the region',
                              maxLines: 2,
                              textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
