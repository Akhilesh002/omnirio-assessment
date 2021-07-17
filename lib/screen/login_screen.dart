import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:omnirio_assessment/screen/signup_screen.dart';
import 'package:omnirio_assessment/util/constant.dart';
import 'package:omnirio_assessment/util/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? rememberMe = false;
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? _preferences;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  getSharedPref() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey(Constant.email)) {
      emailController.text = _preferences!.getString(Constant.email)!;
      passwordController.text = _preferences!.getString(Constant.password)!;
      setState(() {
        rememberMe = _preferences!.getBool(Constant.rememberMe);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
              minWidth: 240,
              minHeight: 400,
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Username or Email',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter Username or Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        splashRadius: 20.0,
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (isChecked) {
                          setState(() {
                            rememberMe = isChecked;
                          });
                        },
                      ),
                      Text('Remember Me')
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Both fields are mandatory')));
                          } else {
                            if (!Utility.isValidEmail(emailController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter valid email')));
                              return;
                            }
                            if (!Utility.isValidPassword(passwordController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Password should contains 1 uppercase, 1 lowercase, 1 digit, 1 special character and at least 6 chracters')));
                              return;
                            }
                            if (rememberMe!) {
                              _preferences!.setString(Constant.email, emailController.text);
                              _preferences!.setString(Constant.password, emailController.text);
                              _preferences!.setBool(Constant.rememberMe, rememberMe!);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Congrats, all fields are valid')));
                          }
                        },
                        child: Text('Login'),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Didn\'t have an account ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
