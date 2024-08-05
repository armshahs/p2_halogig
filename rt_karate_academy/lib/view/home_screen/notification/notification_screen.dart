import 'package:flutter/material.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Navigator.of(context).pop();
                      }),
                      const Text(
                        'Notifications',
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
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (contex, index) => const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaUUIi7CsS7g9YpcgxhbEsgX_jGlk15uGvUQIitxoc&s'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jan 1, 2024',
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Great news! A new course has been added',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Digital Marketing Strategies',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Expanded(
                                        //   child: Text(
                                        //     'This comprehensive course dives into the world of digital marketing',
                                        //     overflow: TextOverflow.ellipsis,
                                        //     style: TextStyle(
                                        //         color: Colors.grey,
                                        //         fontStyle: FontStyle.italic,
                                        //         fontWeight: FontWeight.bold),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          )),
                ))
              ]))),
    );
  }
}
