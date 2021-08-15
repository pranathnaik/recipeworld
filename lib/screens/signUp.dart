import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/size.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 50),
                child: Image.asset(
                  "assets/images/undraw1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    filled: true,
                    fillColor: AppColors.secondaryOrange,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    filled: true,
                    fillColor: AppColors.secondaryOrange,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'password',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                width: width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: AppColors.primaryGreen,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Signup',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                width: width,
                child: Text(
                  "Already have an Account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                width: width,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
