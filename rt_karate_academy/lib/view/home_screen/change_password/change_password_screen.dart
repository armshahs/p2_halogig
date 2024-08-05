import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

import '../../common_widgets/back_button.dart';

var oldPasswordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmPasswordController = TextEditingController();

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackCommonButton(onTap: () {
                    Navigator.pop(context, true);
                  }),
                  const Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Old Password',
                      ),
                      TextFormField(
                        controller: oldPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your old password',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'New Password',
                      ),
                      TextFormField(
                        controller: newPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your New password',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Confirm Password',
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter New Password',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ),
                      ),
                      const Spacer(),
                      BlueCommonButton(
                          text: 'Change Password',
                          onTap: () async {
                            if (oldPasswordController.text.isNotEmpty &&
                                newPasswordController.text.isNotEmpty &&
                                confirmPasswordController.text.isNotEmpty &&
                                newPasswordController.text.toString() ==
                                    confirmPasswordController.text.toString()) {
                              await AuthServices().changePassword(
                                  oldPasswordController.text.toString(),
                                  newPasswordController.text.toString());
                              Navigator.pop(context);
                            } else {}
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
