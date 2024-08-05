import 'package:flutter/material.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var belts = [
      "Yellow Belt",
      "Orange Belt",
      "Blue Belt",
      "Dark Blue Belt",
      "Green Belt",
      "Purple Belt",
      "Brown Belt",
      "Brown 1 Belt",
      "Brown 2 Belt",
      "Black Belt",
    ];
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(gradient: backgroundGradient),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackCommonButton(onTap: () {
                        Navigator.pop(context);
                      }),
                      const Text(
                        'Certificate',
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
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              items: belts.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                // Handle dropdown value change
                              },
                              isExpanded: true,
                              hint: const Text('Select Belt'),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        BlueCommonButton(text: 'Download', onTap: () {})
                      ],
                    ),
                  ),
                ))
              ]))),
    );
  }
}
