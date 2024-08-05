import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/auth/approval/approval_screen.dart';
import 'package:rt_karate_academy/view/auth/login/login_screen.dart';
import 'package:rt_karate_academy/view/auth/register/register_screen.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/common_widgets/white_button.dart';
import 'package:rt_karate_academy/view/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _checkUserStatus(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const SizedBox(
                  height: 180,
                  width: 180,
                  child: Image(
                    image: AssetImage(
                        'assets/images/27BCCA17-A364-407A-8416-DB446FBF9527-removebg-preview 1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(flex: 2),
                BlueCommonButton(
                  text: 'Login',
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                WhiteCommonButton(
                    text: 'Register',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    }),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkUserStatus(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 3));

    if (user != null) {
      bool status =
          await AuthServices.approvalChecking(email: user.email ?? '');
      print(status);

      status
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const UserApprovalScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
