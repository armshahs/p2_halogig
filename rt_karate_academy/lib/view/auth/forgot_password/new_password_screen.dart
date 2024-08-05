import 'package:flutter/material.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/common_widgets/box_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: BackCommonButton(onTap: () {}),
              ),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text('Create New Password',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Your new password must be unique from those previously used.",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[400]),
                        ),
                      ),
                      BoxTextField(
                          validateFuc: (value) {
                            return null;
                          },
                          hintText: 'New Password',
                          textEditingController: newPasswordController),
                      BoxTextField(  validateFuc: (value) {
                            return null;
                          },
                          hintText: 'Confirm Password',
                          textEditingController: confirmPasswordController),
                      const Spacer(),
                      BlueCommonButton(text: 'Send Code', onTap: () {}),
                    ],
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
