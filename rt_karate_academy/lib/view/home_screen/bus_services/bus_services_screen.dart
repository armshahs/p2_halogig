import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rt_karate_academy/controller/home/bus/bus_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

import '../../../controller/auth/auth_services.dart';

class BusServicesScreen extends StatefulWidget {
  const BusServicesScreen({super.key});

  @override
  State<BusServicesScreen> createState() => _BusServicesScreenState();
}

String pickupLocation = "";
String dropLocation = "";

var authController = Get.find<AuthServices>();

class _BusServicesScreenState extends State<BusServicesScreen> {
  var areaList = [];
  ValueNotifier<int> pickup = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    getBusLocations();
  }

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
                    'Bus Service',
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
                    BlueCommonButton(
                        text: 'Opt for bus services',
                        onTap: () async {
                          if (dropLocation.isNotEmpty) {
                            await BusServices()
                                .insertBusRouteData({"drop": dropLocation});
                            Fluttertoast.showToast(msg: "Locations Updated");
                          } else {
                            Fluttertoast.showToast(
                                msg: "please select Location");
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 181, 180, 180),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.green,
                                  ),
                                  Expanded(
                                    child: VerticalDivider(
                                      indent: 5,
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pickup.value = 1;
                                          });
                                        },
                                        child: Text(
                                          'Pickup: ${authController.user.value.dojo}',
                                        )),
                                    const Expanded(
                                        child: Divider(
                                      thickness: 2,
                                    )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pickup.value = 2;
                                          });
                                        },
                                        child: Text(
                                          'Drop: $dropLocation',
                                          style: pickup.value == 2
                                              ? const TextStyle(
                                                  fontWeight: FontWeight.bold)
                                              : null,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    pickup.value != -1
                        ? Expanded(
                            child: ListView.separated(
                                itemCount: areaList.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(indent: 50, height: 25),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (pickup.value == 1) {
                                          pickupLocation = areaList[index];
                                        } else if (pickup.value == 2) {
                                          dropLocation = areaList[index];
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color.fromARGB(
                                                255, 45, 208, 51),
                                            child: Center(
                                              child: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  areaList[index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }))
                        : Container(),
                    const Divider(
                      height: 40,
                      thickness: 2,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await BusServices().optOutRouteData();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Opt out for bus services',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }

  void getBusLocations() {
    BusServices().getLocations().then((value) {
      setState(() {
        areaList = value;
      });
    });
  }
}
