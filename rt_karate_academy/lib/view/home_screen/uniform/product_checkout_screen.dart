import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:rt_karate_academy/controller/home/payment/payment_services.dart';
import 'package:rt_karate_academy/controller/home/uniform/uniform_services.dart';
import 'package:rt_karate_academy/model/fee_model.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';

import '../../../controller/auth/auth_services.dart';
import '../../payment_option/approval_screen.dart';
import '../../payment_option/cash/cash_payment_screen.dart';
import '../../payment_option/online/qr_code_screen.dart';

class ProductCheckoutScreen extends StatefulWidget {
  final String price;
  final String size;
  final int type;

  ProductCheckoutScreen(
      {super.key, required this.price, required this.size, required this.type});

  @override
  State<ProductCheckoutScreen> createState() => _ProductCheckoutScreenState();
}

var authController = Get.find<AuthServices>();

class _ProductCheckoutScreenState extends State<ProductCheckoutScreen> {
  ValueNotifier<bool> isNormalFit = ValueNotifier<bool>(true);

  ValueNotifier<bool> isHealtyFit = ValueNotifier<bool>(false);

  ValueNotifier<bool> isCash = ValueNotifier<bool>(true);

  ValueNotifier<bool> isOnline = ValueNotifier<bool>(false);

  ValueNotifier<int> quantity = ValueNotifier(1);

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
                    Navigator.pop(context);
                  }),
                  const Text(
                    'Uniform',
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
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Selected Height:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.size,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Type:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(width: 5),
                            ValueListenableBuilder(
                                valueListenable: isNormalFit,
                                builder: (context, value, _) {
                                  return MSHCheckbox(
                                    size: 25,
                                    value: isNormalFit.value,
                                    colorConfig: MSHColorConfig
                                        .fromCheckedUncheckedDisabled(
                                      checkedColor: Colors.green,
                                    ),
                                    style: MSHCheckboxStyle.stroke,
                                    onChanged: (selected) {
                                      isHealtyFit.value = false;
                                      isNormalFit.value = true;
                                    },
                                  );
                                }),
                            const SizedBox(width: 5),
                            const Text('Slim Fit'),
                            const SizedBox(width: 15),
                            ValueListenableBuilder(
                                valueListenable: isHealtyFit,
                                builder: (context, value, _) {
                                  return MSHCheckbox(
                                    size: 25,
                                    value: isHealtyFit.value,
                                    colorConfig: MSHColorConfig
                                        .fromCheckedUncheckedDisabled(
                                      checkedColor: Colors.green,
                                    ),
                                    style: MSHCheckboxStyle.stroke,
                                    onChanged: (selected) {
                                      isHealtyFit.value = true;
                                      isNormalFit.value = false;
                                    },
                                  );
                                }),
                            const SizedBox(width: 5),
                            const Text('Healthy Fit')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (quantity.value > 1) {
                                        setState(() {
                                          quantity.value--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  const SizedBox(width: 5),
                                  ValueListenableBuilder(
                                      valueListenable: quantity,
                                      builder: (context, value, _) {
                                        return Text(
                                          value.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity.value++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text(
                      'Total Amount:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '₹${int.parse(widget.price) * quantity.value}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const Spacer(
                      flex: 1,
                    ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    BlueCommonButton(
                        text: "Confirm Amount & Pay",
                        onTap: () async {
                          await UniformServices().storeOrderTransaction(OrderModel(
                              username:
                                  '${authController.user.value.firstName} ${authController.user.value.lastName}',
                              fitType: isNormalFit.value ? "slim" : "healthy",
                              size: widget.size,
                              price: (int.parse(widget.price) * quantity.value)
                                  .toString(),
                              quantity: quantity.value.toString(),
                              uniformName:
                                  widget.type == 1 ? "export" : "canvas",
                              paymentType: "pending",
                              paidTo: "",
                              date: DateTime.now(),
                              status: "Placed",
                              id: '',
                              userEmail:
                                  FirebaseAuth.instance.currentUser!.email!,
                              paymentStatus: 'unpaid'));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaymentApprovalScreen()));

                          // if (isCash.value) {
                          //   await PaymentServices().storeFeeTransaction(
                          //       FeeTransaction(
                          //           email: FirebaseAuth
                          //               .instance.currentUser!.email!,
                          //           username:
                          //               "${authController.user.value.firstName} ${authController.user.value.lastName}",
                          //           amount: double.parse(
                          //               (int.parse(widget.price) *
                          //                       quantity.value)
                          //                   .toString()),
                          //           type: 'cash',
                          //           paidTo: "",
                          //           date: DateTime.now(),
                          //           months: [],
                          //           id: ''),
                          //       0,
                          //       0);
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => PaymentApprovalScreen()));
                          //
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => CashPaymentScreen(
                          //       amount: "0",
                          //       from: "order",
                          //       months: [],
                          //       obj: OrderModel(
                          //         username:
                          //             '${authController.user.value.firstName} ${authController.user.value.lastName}',
                          //         fitType:
                          //             isNormalFit.value ? "slim" : "healthy",
                          //         size: widget.size,
                          //         price:
                          //             (int.parse(widget.price) * quantity.value)
                          //                 .toString(),
                          //         quantity: quantity.value.toString(),
                          //         uniformName:
                          //             widget.type == 1 ? "export" : "canvas",
                          //         paymentType: 'cash',
                          //         paidTo: '',
                          //         date: DateTime.now(),
                          //         status: 'Placed',
                          //         id: '',
                          //         userEmail:
                          //             FirebaseAuth.instance.currentUser!.email!,
                          //         paymentStatus: 'unpaid',
                          //       ),
                          //       uniformAmount: '',
                          //       examAmount: '',
                          //     ),
                          //   ));
                          // } else if (isOnline.value) {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => QrCodeScreen(
                          //             from: "order",
                          //             amount: "0",
                          //             orderobj: OrderModel(
                          //                 username:
                          //                     '${authController.user.value.firstName} ${authController.user.value.lastName}',
                          //                 fitType: isNormalFit.value
                          //                     ? "slim"
                          //                     : "healthy",
                          //                 size: widget.size,
                          //                 price: (int.parse(widget.price) *
                          //                         quantity.value)
                          //                     .toString(),
                          //                 quantity: quantity.value.toString(),
                          //                 uniformName: widget.type == 1
                          //                     ? "export"
                          //                     : "canvas",
                          //                 paymentType: 'online',
                          //                 paidTo: '',
                          //                 date: DateTime.now(),
                          //                 status: 'Placed',
                          //                 id: '',
                          //                 userEmail: FirebaseAuth
                          //                     .instance.currentUser!.email!,
                          //                 paymentStatus: 'unpaid'),
                          //             months: [],
                          //             examAmount: '',
                          //             uniformAmount: '',
                          //           )));
                          // }
                        })
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
