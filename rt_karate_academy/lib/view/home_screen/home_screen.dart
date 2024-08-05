// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/home/fee/fee_services.dart';
import 'package:rt_karate_academy/model/user_data_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/util/functions.dart';
import 'package:rt_karate_academy/view/auth/profile_creation/profile_creation_screen.dart';
import 'package:rt_karate_academy/view/home_screen/attendance/attendance_screen.dart';
import 'package:rt_karate_academy/view/home_screen/bus_services/bus_services_screen.dart';
import 'package:rt_karate_academy/view/home_screen/change_password/change_password_screen.dart';
import 'package:rt_karate_academy/view/home_screen/event/events_screen.dart';
import 'package:rt_karate_academy/view/home_screen/examination/examination_screen.dart';
import 'package:rt_karate_academy/view/home_screen/fees/choose_month_screen.dart';
import 'package:rt_karate_academy/view/home_screen/fees/fees_screen.dart';
import 'package:rt_karate_academy/view/home_screen/gallery/gallery_screen.dart';
import 'package:rt_karate_academy/view/home_screen/holidays/holidays_screen.dart';
import 'package:rt_karate_academy/view/home_screen/notification/notification_screen.dart';
import 'package:rt_karate_academy/view/home_screen/online_revision/online_revision_screen.dart';
import 'package:rt_karate_academy/view/home_screen/order_status/order_status_screen.dart';
import 'package:rt_karate_academy/view/home_screen/support/support_screen.dart';
import 'package:rt_karate_academy/view/home_screen/switch_profile/swithc_profile.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/uniform_screen.dart';
import 'package:rt_karate_academy/view/splash/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> homeLogos = [
    'assets/home_logos/uniform.png',
    'assets/home_logos/bus_service.png',
    'assets/home_logos/online_reservation.png',
    'assets/home_logos/list_of_holiday.png',
    'assets/home_logos/gallary.png',
    // 'assets/home_logos/doubts.png',
    'assets/home_logos/attendence.png',
    'assets/home_logos/event.png',
    'assets/home_logos/order_status.png',
    'assets/home_logos/change_password.png',
    'assets/home_logos/switch_profile.png',
    'assets/home_logos/logout.png'
  ];
  final List<String> homeGridTitles = [
    'Uniform',
    'Bus Services',
    'Online Revision',
    'List Of Holidays',
    'Gallery',
    // 'Ask Doubts',
    'Attendance',
    'Events',
    'Order Status',
    'Change Password',
    'Switch Profile',
    // 'Update Profile'
    'Logout'
  ];
  var totalFees = 0.0;

  final List<Widget> homeScreens = [
    const UniformScreen(),
    const BusServicesScreen(),
    const OnlineRevisionScreen(),
    const HolidaysScreen(),
    GallaryScreen(),
    // const SupportScreen(),
    const AttendanceScreen(),
    const EventsScreen(),
    const OrderStatusScreen(),
    const ChangePasswordScreen(),
    const SwitchProfile(),
    // const ProfileCreationScreen(from: "update",userName: "", email: "", password: ),
    const SplashScreen()
  ];

  var authController = Get.find<AuthServices>();
  var feeController = Get.find<FeeServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: FutureBuilder<UserDataModel>(
            future: AuthServices.getCurrentUserData(
                email: FirebaseAuth.instance.currentUser!.email!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var user = snapshot.data as UserDataModel;
                authController.user.value = user;

                getTotalFee();
                return ListView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                'Hi ${user.firstName} ${user.lastName}!',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: GFProgressBar(
                                      lineHeight: 15,
                                      percentage: double.parse(Functions()
                                              .getBetProgress(user.beltLevel)) /
                                          100,
                                      backgroundColor: Colors.grey,
                                      progressBarColor: Colors.red,
                                    ),
                                  ),
                                  GetX<AuthServices>(
                                    builder: (controller) {
                                      return Text(
                                        '(${Functions().getBetProgress(controller.user.value.beltLevel)}%)',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 3),
                              child: Text(
                                'Black Belt Progress',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()));
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/27BCCA17-A364-407A-8416-DB446FBF9527-removebg-preview 1.png'))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            width: double.infinity,
                            height: 800,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const FeesScreen()))
                                        .then((value) =>
                                            value ? getTotalFee() : null);
                                  },
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundColor: Colors.pink[100],
                                          ),
                                          GetX<FeeServices>(
                                              builder: (controller) {
                                            return Text(
                                              '₹${controller.totalDue.value}',
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          }),
                                          const Text(
                                            'Fees Due',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const ExaminationScreen()))
                                        .then((value) =>
                                            value ? getTotalFee() : null);
                                  },
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundColor: Colors.orange[50],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Examination',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: GridView.count(
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: List.generate(
                                      11,
                                      (index) => InkWell(
                                            onTap: () async {
                                              if (index == 10) {
                                                await FirebaseAuth.instance
                                                    .signOut();
                                              }
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          homeScreens[index]))
                                                  .then((value) => value
                                                      ? getTotalFee()
                                                      : null);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                        homeLogos[index]),
                                                    Text(homeGridTitles[index])
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]);
              }
            }),
      )),
    );
  }

  Future<void> getTotalFee() async {
    feeController.totalDue.value = await FeeServices()
        .fetchTotalFeeDues(authController.user.value.email, 2024);
  }
}
