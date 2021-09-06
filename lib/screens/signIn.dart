import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/screens/rootApp.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  checkAuthentication() async {
    auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.rootApp);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

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
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
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
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                  obscureText: true,
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
                    _signin(_email, _password);
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

  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      Navigator.pushNamed(context, AppRoutes.rootApp);
    } on FirebaseAuthException catch (e) {
      Toast.show(e.message, context,
          backgroundColor: Colors.redAccent, duration: 5);
      print(e.message);
    }
  }
}
