import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/home/payment/payment_services.dart';
import 'package:rt_karate_academy/controller/home/uniform/uniform_services.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/fees/choose_month_screen.dart';
import 'package:rt_karate_academy/view/payment_option/approval_screen.dart';

import '../../../model/fee_model.dart';

class CashPaymentScreen extends StatefulWidget {
  final String amount;
  final String uniformAmount;
  final String examAmount;
  final String from;
  final OrderModel obj;
  final List<String> months;

  const CashPaymentScreen(
      {super.key,
      required this.amount,
      required this.from,
      required this.obj,
      required this.months,
      required this.uniformAmount,
      required this.examAmount});

  @override
  State<CashPaymentScreen> createState() => _CashPaymentScreenState();
}

var selected = -1;
var authController = Get.find<AuthServices>();

class _CashPaymentScreenState extends State<CashPaymentScreen> {
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
                        Navigator.pop(context);
                      }),
                      const Text(
                        'Cash',
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
                          "Amount paid to person",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Select any one",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                            print(selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Harsh Cash',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: selected == 1
                                              ? Colors.black
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border:
                                              Border.all(color: Colors.grey)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 2;
                            });
                            print(selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Dakshes Cash',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: selected == 2
                                              ? Colors.black
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border:
                                              Border.all(color: Colors.grey)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 3;
                            });
                            print(selected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Tanishq Cash',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: selected == 3
                                              ? Colors.black
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border:
                                              Border.all(color: Colors.grey)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        BlueCommonButton(
                            text: 'Confirm',
                            onTap: () async {
                              var paidTo = "";
                              switch (selected) {
                                case 1:
                                  {
                                    paidTo = "Harsh";
                                  }
                                case 2:
                                  {
                                    paidTo = "Dakshes";
                                  }
                                case 3:
                                  {
                                    paidTo = "Tanishq";
                                  }
                                default:
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Please select Person");
                                    return;
                                  }
                              }

                              if (widget.from == "order") {
                                var orderObj = widget.obj;
                                await UniformServices().storeOrderTransaction(
                                    OrderModel(
                                        username: orderObj.username,
                                        fitType: orderObj.fitType,
                                        size: orderObj.size,
                                        price: orderObj.price,
                                        quantity: orderObj.quantity,
                                        uniformName: orderObj.uniformName,
                                        paymentType: orderObj.paymentType,
                                        paidTo: paidTo,
                                        date: DateTime.now(),
                                        status: orderObj.status,
                                        id: '',
                                        userEmail: FirebaseAuth
                                            .instance.currentUser!.email!,
                                        paymentStatus: 'unpaid'));
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentApprovalScreen()));
                              } else {
                                print(
                                    "${authController.user.value.firstName} ${authController.user.value.lastName}");
                                await PaymentServices().storeFeeTransaction(
                                    FeeTransaction(
                                        email: FirebaseAuth
                                            .instance.currentUser!.email!,
                                        username:
                                            "${authController.user.value.firstName} ${authController.user.value.lastName}",
                                        amount: double.parse(widget.amount),
                                        type: 'cash',
                                        paidTo: paidTo,
                                        date: DateTime.now(),
                                        months: widget.months,
                                        id: ''),
                                    num.tryParse(widget.examAmount) ?? 0,
                                    num.tryParse(widget.uniformAmount) ?? 0);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentApprovalScreen()));
                              }
                            })
                      ],
                    ),
                  ),
                ))
              ]))),
    );
  }
}
