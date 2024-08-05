import 'package:flutter/material.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackCommonButton(onTap: () {
                      Navigator.pop(context, true);
                    }),
                    const Text(
                      'Support',
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
                child: Column(
                  children: [
                    const Spacer(
                      flex: 4,
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/support_image.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Text(
                      'Get Support',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'For any support request regards your orders or deliveries please feel free to speak with us at below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    const Text(
                      'Call us - +91 7838XXXXXX',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const Text(
                      'Mail us - infokaratekids@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
