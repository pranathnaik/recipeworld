import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/widgets/userPostCards.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      appBar: AppBar(
        backgroundColor: AppColors.backColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          "Your Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileEdit);
              },
              child: Icon(
                Icons.edit_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Sumant Mulgaonkar",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "i am bhumant bhutar",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Subscribers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("1020")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: AppColors.primaryGreen,
                shape: StadiumBorder(),
              ),
              onPressed: () {},
              child: Text('Subscribe'),
            ),
            Divider(
              height: 22.0,
              thickness: 0.6,
              color: Colors.black,
            ),
            UserPostCards()
          ],
        ),
      ),
    );
  }
}
