import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rt_karate_academy/controller/home/fee/fee_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/fees/choose_month_screen.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/cart_screen.dart';

import '../../../controller/auth/auth_services.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  ValueNotifier<bool> isCash = ValueNotifier<bool>(true);
  ValueNotifier<bool> isOnline = ValueNotifier<bool>(false);
  ValueNotifier<int> uniformFees = ValueNotifier<int>(100);
  var authController = Get.find<AuthServices>();

  final List months = [
    ["January", 1, 1],
    ["February", 1, 2],
    ["March", 1, 3],
    ["April", 1, 4],
    ["May", 1, 5],
    ["June", 1, 6],
    ["July", 1, 7],
    ["August", 1, 8],
    ["September", 1, 9],
    ["October", 1, 10],
    ["November", 1, 11],
    ["December", 1, 12],
  ];
  var currentYear = "";
  var fees = {};

  @override
  initState() {
    getCurrentYear();
    fetchFees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var amount = 0;
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
                    Navigator.pop(context);
                  }),
                  const Text(
                    'Student Name',
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
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: ListView(
                  children: [

                    const Text(
                      'Tuition Fee :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                currentYear = (int.parse(currentYear) - 1).toString();
                              });
                              fetchFees();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        Text(
                          currentYear,
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                currentYear = (int.parse(currentYear) + 1).toString();
                              });
                              fetchFees();
                            },
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 4 / 2,
                        ),
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10, right: 10),
                            color: months[index][1] == 1
                                ? Colors.green
                                : months[index][1] == 2
                                ? Colors.red
                                : Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              months[index][0],
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Exam Fee :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 40,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                'Belt Level',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${authController.user.value.beltLevel}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                'Total Fees due:',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rs ${authController.user.value.examFeeDue}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Uniform Fee :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 40,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              const Text(
                                'Total Products:',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    var res = await Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CartScreen()));
                                    if (res != null) {
                                      uniformFees.value = int.parse(
                                          res[0]["amount"].toString());
                                    }
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                'Total Amount:',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "RS ${authController.user.value.uniformFeeDue}",
                                // 'RS ${uniformFees.value}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 50,
                    ),
                    // const Text('Total Amount :'),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // Row(
                    //   children: [
                    //     ValueListenableBuilder(
                    //         valueListenable: isCash,
                    //         builder: (context, value, _) {
                    //           return MSHCheckbox(
                    //             size: 25,
                    //             value: isCash.value,
                    //             colorConfig:
                    //                 MSHColorConfig.fromCheckedUncheckedDisabled(
                    //               checkedColor: Colors.green,
                    //             ),
                    //             style: MSHCheckboxStyle.stroke,
                    //             onChanged: (selected) {
                    //               isOnline.value = false;
                    //               isCash.value = true;
                    //             },
                    //           );
                    //         }),
                    //     const SizedBox(width: 5),
                    //     const Text('Cash'),
                    //     const SizedBox(width: 120),
                    //     ValueListenableBuilder(
                    //         valueListenable: isOnline,
                    //         builder: (context, value, _) {
                    //           return MSHCheckbox(
                    //             size: 25,
                    //             value: isOnline.value,
                    //             colorConfig:
                    //                 MSHColorConfig.fromCheckedUncheckedDisabled(
                    //               checkedColor: Colors.green,
                    //             ),
                    //             style: MSHCheckboxStyle.stroke,
                    //             onChanged: (selected) {
                    //               isOnline.value = true;
                    //               isCash.value = false;
                    //             },
                    //           );
                    //         }),
                    //     const SizedBox(width: 5),
                    //     const Text('Online')
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    BlueCommonButton(
                        text: 'Pay Fees',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChooseMonthScreen()));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }

  void getCurrentYear() {
    var now = DateTime.now();
    var year = now.year;
    setState(() {
      currentYear = year.toString();
    });
  }
  Future<void> fetchFees() async {
    fees = await FeeServices()
        .fetchPaidUnpaidFees(authController.user.value.email, int.parse(currentYear));
    fees.map((key, value) {
      var month = int.parse(key.split("-")[1]);
      months[month - 1][1] = value;
      return MapEntry(key, value);
    });
    setState(() {});
    print(fees);
  }
}
