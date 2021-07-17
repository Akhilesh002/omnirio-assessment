import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omnirio_assessment/screen/login_screen.dart';
import 'package:omnirio_assessment/util/utility.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? referalCode = false;
  bool? terms_condition = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool nameError = false;
  bool emailError = false;
  bool passwordError = false;
  bool mobileError = false;

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
                    'Sign Up',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Full Name*',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    onChanged: (name) {
                      setState(() {
                        nameError = Utility.isValidName(name);
                      });
                    },
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter Name',
                      suffix: nameError ? null : Icon(Icons.error, size: 20.0),
                      errorText: nameError ? null : 'Enter valid name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Email*',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {
                      setState(() {
                        emailError = Utility.isValidEmail(email);
                      });
                    },
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter Email',
                      suffix: emailError ? null : Icon(Icons.error, size: 20.0),
                      errorText: emailError ? null : 'Enter valid email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Password*',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (password) {
                      setState(() {
                        passwordError = Utility.isValidPassword(password);
                      });
                    },
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter Password',
                      suffix: passwordError ? null : Icon(Icons.error, size: 20.0),
                      errorText: passwordError ? null : 'Enter valid password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Mobile Number*',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: InternationalPhoneNumberInput(
                    textFieldController: mobileController,
                    onInputChanged: (number) {},
                    onInputValidated: (value) {
                      mobileError = value;
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    autoValidateMode: AutovalidateMode.always,
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: referalCode,
                      onChanged: (isChecked) {
                        setState(() {
                          referalCode = isChecked;
                        });
                      },
                    ),
                    Text('Do you have a referal code')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: terms_condition,
                      onChanged: (isChecked) {
                        setState(() {
                          terms_condition = isChecked;
                        });
                      },
                    ),
                    Text('I agree with the terms and conditions')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        validateField(
                          isNameValid: nameError,
                          isEmailValid: emailError,
                          isPasswordValid: passwordError,
                          isMobileValid: mobileError,
                          isTermsAndConditionsAgreed: terms_condition,
                          hasReferalCode: referalCode,
                        );
                      },
                      child: Text('Signup'),
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
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Already have an account ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateField(
      {@required bool? isNameValid,
      @required bool? isEmailValid,
      @required bool? isPasswordValid,
      @required bool? isMobileValid,
      @required bool? isTermsAndConditionsAgreed,
      @required bool? hasReferalCode}) {
    if (!isNameValid! || !isEmailValid! || !isPasswordValid! || !isMobileValid! || !isTermsAndConditionsAgreed!) {
      setState(() {
        nameError = isNameValid;
        emailError = isNameValid;
        passwordError = isNameValid;
        mobileError = isNameValid;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter valid input')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Congrats, all fields are valid')));
    }
  }
}
