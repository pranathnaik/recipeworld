import 'package:flutter/material.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 50),
                child: Image.asset(
                  "assets/images/signinimage.png",
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
                    fillColor: Colors.white,
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
                   fillColor: Colors.white,
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
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.rootApp);
                  },
                  child: Text(
                    'Signin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height / 55),
                width: width,
                child: Text(
                  "Don't have account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signUp);
                },
                child: Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
