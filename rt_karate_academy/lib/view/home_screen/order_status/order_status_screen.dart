import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/home/uniform/uniform_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/home_screen/order_status/widgets/stepper_widget.dart';

import '../uniform/widgets/uniform_product_container2.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

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
                    'Order Status',
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
                child: FutureBuilder(
                    future: UniformServices().getUserOrders(),
                    builder: (context, snapshot) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: ListView.separated(
                              itemCount: snapshot.data?.length ?? 0,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemBuilder: (context, index) {
                                print(snapshot.data![index].status);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UniformProductContainer2(
                                        index, false, snapshot.data![index]),
                                    StepperWidget(
                                        snapshot.data![index].status == "Placed"
                                            ? 1
                                            : snapshot.data![index].status ==
                                                    "Processed"
                                                ? 2
                                                : snapshot.data![index]
                                                            .status ==
                                                        "Received"
                                                    ? 3
                                                    : snapshot.data![index]
                                                                .status ==
                                                            "Delivered"
                                                        ? 4
                                                        : 0),
                                    Divider()
                                  ],
                                );
                              }),
                        ),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
