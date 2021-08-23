import 'package:flutter/material.dart';
import 'package:recipeworld/widgets/profileCards.dart';
import 'package:recipeworld/config/colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileDesign(),
    );
  }
}

class ProfileDesign extends StatefulWidget {
  @override
  _ProfileDesignState createState() => _ProfileDesignState();
}

class _ProfileDesignState extends State<ProfileDesign> {
  String profilepic = "https://picsum.photos/200/300?grayscale";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(profilepic),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Sumant Mulgaonkar",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "<caption>",
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  color: Colors.black,
                  splashColor: Colors.white10,
                  child:
                      Text("Subscribe", style: TextStyle(color: Colors.white)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                ),
                SizedBox(
                  width: 12.0,
                ),
                OutlineButton(
                  onPressed: () {},
                  child: Text("Message"),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Divider(
                height: 22.0,
                thickness: 0.6,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                child: ProfileCards(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
