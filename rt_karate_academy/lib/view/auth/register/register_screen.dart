import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/util/functions.dart';
import 'package:rt_karate_academy/view/auth/login/login_screen.dart';
import 'package:rt_karate_academy/view/auth/profile_creation/profile_creation_screen.dart';
import 'package:rt_karate_academy/view/common_widgets/box_textfield.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackCommonButton(onTap: () {
                      Navigator.pop(context);
                    }),
                    Expanded(
                        child: SizedBox(
                      child: Image.asset(
                        'assets/images/27BCCA17-A364-407A-8416-DB446FBF9527-removebg-preview 1.png',
                        height: 120,
                        width: 120,
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello! Register to get started',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BoxTextField(
                            validateFuc: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Username";
                              }
                              return null;
                            },
                            hintText: 'Username',
                            textEditingController: usernameController,
                          ),
                          BoxTextField(
                            validateFuc: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                            hintText: 'Email',
                            textEditingController: emailController,
                          ),
                          BoxTextField(
                            validateFuc: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter password";
                              } else if (value.length < 8) {
                                return "Minimum 8 character";
                              }
                              return null;
                            },
                            hintText: 'Password',
                            textEditingController: passwordController,
                          ),
                          BoxTextField(
                            validateFuc: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value != passwordController.text) {
                                return "password must be same";
                              }
                              return null;
                            },
                            hintText: 'Confirm Password',
                            textEditingController: confirmPasswordController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlueCommonButton(
                              text: 'Register',
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  // try {
                                  //   await AuthServices
                                  //       .registerWithEmailAndPassword(
                                  //           emailController.text.trim(),
                                  //           confirmPasswordController.text);
                                  // } on Exception catch (_, e) {
                                  //   //show snakbar
                                  //   Functions().showSnackBar(
                                  //       context, "Something went wrong");
                                  // }

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileCreationScreen(
                                            userName:
                                                usernameController.text.trim(),
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                            from: 'register',
                                          )));
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'Login Now',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigate to the register page here
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                          );
                                        }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
