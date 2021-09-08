import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:recipeworld/config/colors.dart';
import 'package:recipeworld/config/routes.dart';
import 'package:recipeworld/config/size.dart';
import 'package:recipeworld/screens/rootApp.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  checkAuthentication() async {
    auth.authStateChanges().listen((user) async {
      if (user != null) {}
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  GlobalKey<FormState> _signupformkey = GlobalKey<FormState>();
  final emailvalidator = MultiValidator([
    RequiredValidator(errorText: "email is required"),
    EmailValidator(errorText: "enter a valid email address")
  ]);

  final passwordvalidator = MultiValidator([
    RequiredValidator(errorText: "password is required"),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
    //     errorText: "passwords must have at least one special character")
  ]);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _signupformkey,
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
                  child: TextFormField(
                    validator: emailvalidator,
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
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
                  child: TextFormField(
                    validator: passwordvalidator,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
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
                      if (_signupformkey.currentState.validate()) {
                        _signup(_email, _password);
                      }
                    },
                    child: Text(
                      'Signup',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height / 55),
                  width: width,
                  child: Text(
                    "Already have an Account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signIn);
                  },
                  child: Text(
                    'Sign In',
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
      ),
    );
  }

  _signup(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.pushNamed(context, AppRoutes.verifyScreen);
    } on FirebaseAuthException catch (e) {
      Toast.show(e.message, context,
          duration: 3, backgroundColor: Colors.redAccent);
    }
  }
}
