import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/auth/approval/approval_screen.dart';
import 'package:rt_karate_academy/view/auth/register/register_screen.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/home_screen.dart';
import 'package:rt_karate_academy/view/home_screen/examination/examination_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  ValueNotifier<bool> isPasswordSecure = ValueNotifier(true);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
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
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi Student',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Sign in to continue',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Email Address',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Enter your email address',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(fontSize: 16),
                        ),
                        ValueListenableBuilder(
                            valueListenable: isPasswordSecure,
                            builder: (context, value, _) {
                              return TextFormField(
                                controller: passwordController,
                                obscureText: isPasswordSecure.value,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          isPasswordSecure.value
                                              ? isPasswordSecure.value = false
                                              : isPasswordSecure.value = true;
                                        },
                                        icon: isPasswordSecure.value
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                    hintText: 'Enter your password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              );
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        BlueCommonButton(
                            text: 'Sign In',
                            onTap: () async {
                              try {
                                await AuthServices.login(
                                    emailController.text.trim(),
                                    passwordController.text);

                                // Navigate to the home screen or other screen upon success
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExaminationScreen()),
                                );
                              } catch (e) {
                                // Handle login error
                                print('Login failed: $e');
                              }

                              // if (FirebaseAuth.instance.currentUser != null) {}
                              // var a = await AuthServices.signin(
                              //     emailController.text.trim(),
                              //     passwordController.text);
                              // print(a);
                              // bool approvalStatus =
                              //     await AuthServices.approvalChecking(
                              //         email: emailController.text.trim());
                              // approvalStatus
                              //     ? Navigator.of(context).pushReplacement(
                              //         MaterialPageRoute(
                              //             builder: (context) => HomeScreen()))
                              //     : Navigator.of(context).pushReplacement(
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const UserApprovalScreen()));
                            }),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account?",
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Register Now',
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
                                                  RegisterScreen()),
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
