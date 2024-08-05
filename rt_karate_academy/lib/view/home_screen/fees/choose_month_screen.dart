import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/home/fee/fee_services.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/payment_option/cash/cash_payment_screen.dart';
import 'package:rt_karate_academy/view/payment_option/online/qr_code_screen.dart';

class ChooseMonthScreen extends StatefulWidget {
  const ChooseMonthScreen({super.key});

  @override
  State<ChooseMonthScreen> createState() => _ChooseMonthScreenState();
}

var authController = Get.find<AuthServices>();
var feeController = Get.find<FeeServices>();
List<List> months = [[]];

class _ChooseMonthScreenState extends State<ChooseMonthScreen> {
  ValueNotifier<bool> isCash = ValueNotifier<bool>(true);
  ValueNotifier<bool> isOnline = ValueNotifier<bool>(false);
  var examFeeController = TextEditingController();
  var uniformFeeController = TextEditingController();
  var classFeeController = TextEditingController();
  var totalFeeController = TextEditingController();

  var currentYear = DateTime.now().year;

  var baseFee = 0;

  @override
  void initState() {
    super.initState();
    months = [
      ["January", false, 1, false],
      ["February", false, 2, false],
      ["March", false, 3, false],
      ["April", false, 4, false],
      ["May", false, 5, false],
      ["June", false, 6, false],
      ["July", false, 7, false],
      ["August", false, 8, false],
      ["September", false, 9, false],
      ["October", false, 10, false],
      ["November", false, 11, false],
      ["December", false, 12, false],
    ];

    examFeeController.text = authController.user.value.examFeeDue.toString();
    uniformFeeController.text =
        authController.user.value.uniformFeeDue.toString();
    classFeeController.text = "0";
    baseFee = int.parse(authController.user.value.baseFee);
    var totalFee =
        ((double.tryParse(examFeeController.text.toString()) ?? 0.0) +
                (double.tryParse(uniformFeeController.text.toString()) ?? 0.0) +
                (double.tryParse(classFeeController.text.toString()) ?? 0.0))
            .toString();
    totalFeeController.text = totalFee.isEmpty ? "0.0" : totalFee;
    updatePaidMonths();
  }

  @override
  void dispose() {
    super.dispose();
    examFeeController.dispose();
    uniformFeeController.dispose();
    classFeeController.dispose();
  }

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
                        'Select Month',
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
                        Text(
                          "Please select the month till fees to be paid for Year : $currentYear",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            flex: 4,
                            child: ListView.builder(
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: !months[index][3]
                                      ? () {
                                          setState(() {
                                            months.map((e) => e[0] = false);
                                            months[index][1] =
                                                !months[index][1];
                                            classFeeController.text = (months
                                                        .where(
                                                            (e) => e[1] == true)
                                                        .toList()
                                                        .length *
                                                    baseFee)
                                                .toString();

                                            var totalFee = ((double.tryParse(
                                                            examFeeController
                                                                .text
                                                                .toString()) ??
                                                        0.0) +
                                                    (double.tryParse(
                                                            uniformFeeController
                                                                .text
                                                                .toString()) ??
                                                        0.0) +
                                                    (double.tryParse(
                                                            classFeeController
                                                                .text
                                                                .toString()) ??
                                                        0.0))
                                                .toString();
                                            totalFeeController.text =
                                                totalFee.isEmpty
                                                    ? "0.0"
                                                    : totalFee;
                                          });
                                        }
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: months[index][3]
                                              ? Colors.grey
                                              : Colors.white,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${months[index][0]}",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  color: months[index][1]
                                                      ? Colors.black
                                                      : null,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                        Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Exam Fee:',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextField(
                                              enabled: false,
                                              controller: examFeeController,
                                              onChanged: (value) {
                                                var totalFee = ((double.tryParse(
                                                                examFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0) +
                                                        (double.tryParse(
                                                                uniformFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0) +
                                                        (double.tryParse(
                                                                classFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0))
                                                    .toString();
                                                totalFeeController.text =
                                                    totalFee.isEmpty
                                                        ? "0.0"
                                                        : totalFee;
                                              },
                                              // 'Rs 4000',
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Uniform Fee:',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextField(
                                              enabled: false,
                                              controller: uniformFeeController,
                                              onChanged: (value) {
                                                var totalFee = ((double.tryParse(
                                                                examFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0) +
                                                        (double.tryParse(
                                                                uniformFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0) +
                                                        (double.tryParse(
                                                                classFeeController
                                                                    .text
                                                                    .toString()) ??
                                                            0.0))
                                                    .toString();
                                                totalFeeController.text =
                                                    totalFee.isEmpty
                                                        ? "0.0"
                                                        : totalFee;
                                              },
                                              // 'Rs 4000',
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Amount Paid:',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: classFeeController,
                                    onChanged: (value) {
                                      var totalFee = ((double.tryParse(
                                                      examFeeController.text
                                                          .toString()) ??
                                                  0.0) +
                                              (double.tryParse(
                                                      uniformFeeController.text
                                                          .toString()) ??
                                                  0.0) +
                                              (double.tryParse(
                                                      classFeeController.text
                                                          .toString()) ??
                                                  0.0))
                                          .toString();
                                      totalFeeController.text =
                                          totalFee.isEmpty ? "0.0" : totalFee;
                                    },
                                    // 'Rs 4000',
                                    decoration:
                                        const InputDecoration(hintText: ""),
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Total Amount:',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: totalFeeController,
                                    // 'Rs 4000',
                                    decoration:
                                        const InputDecoration(hintText: ""),
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Divider(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: isCash,
                                          builder: (context, value, _) {
                                            return MSHCheckbox(
                                              size: 25,
                                              value: isCash.value,
                                              colorConfig: MSHColorConfig
                                                  .fromCheckedUncheckedDisabled(
                                                checkedColor: Colors.green,
                                              ),
                                              style: MSHCheckboxStyle.stroke,
                                              onChanged: (selected) {
                                                isOnline.value = false;
                                                isCash.value = true;
                                              },
                                            );
                                          }),
                                      const SizedBox(width: 5),
                                      const Text('Cash'),
                                      const SizedBox(width: 120),
                                      ValueListenableBuilder(
                                          valueListenable: isOnline,
                                          builder: (context, value, _) {
                                            return MSHCheckbox(
                                              size: 25,
                                              value: isOnline.value,
                                              colorConfig: MSHColorConfig
                                                  .fromCheckedUncheckedDisabled(
                                                checkedColor: Colors.green,
                                              ),
                                              style: MSHCheckboxStyle.stroke,
                                              onChanged: (selected) {
                                                isOnline.value = true;
                                                isCash.value = false;
                                              },
                                            );
                                          }),
                                      const SizedBox(width: 5),
                                      const Text('Online')
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  BlueCommonButton(
                                      text: 'Confirm Amount & Pay',
                                      onTap: () {
                                        if (isCash.value) {
                                          navigateToCash(context);
                                        } else if (isOnline.value) {
                                          navigateToOnline(context);
                                        }
                                      })
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
              ]))),
    );
  }

  void navigateToOnline(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QrCodeScreen(
              from: "fee",
              amount: classFeeController.text.toString(),
              months: months
                  .where((e) => e[1] == true)
                  .toList()
                  .map((e) => "$currentYear-${e[2]}")
                  .toList(),
              orderobj: OrderModel(
                  username: '',
                  fitType: '',
                  size: '',
                  price: '',
                  quantity: '',
                  uniformName: '',
                  paymentType: '',
                  paidTo: '',
                  date: DateTime.now(),
                  status: '',
                  id: '',
                  userEmail: '',
                  paymentStatus: ''),
              examAmount: examFeeController.text.toString(),
              uniformAmount: uniformFeeController.text.toString(),
            )));
  }

  void navigateToCash(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CashPaymentScreen(
        amount: classFeeController.text.toString(),
        uniformAmount: uniformFeeController.text.toString(),
        examAmount: examFeeController.text.toString(),
        from: 'fee',
        months: months
            .where((e) => e[1] == true)
            .toList()
            .map((e) => "$currentYear-${e[2]}")
            .toList(),
        obj: OrderModel(
            username: '',
            fitType: '',
            size: '',
            price: '',
            quantity: '',
            uniformName: '',
            paymentType: '',
            paidTo: '',
            date: DateTime.now(),
            status: '',
            id: '',
            userEmail: '',
            paymentStatus: ''),
      ),
    ));
  }

  Future<void> updatePaidMonths() async {
    await feeController.fetchTotalFeeDues(
        authController.user.value.email, currentYear);
    var paidMonths = feeController.paidMonths;
    for (var i = 0; i < months.length; i++) {
      if (paidMonths.contains("$currentYear-${months[i][2]}")) {
        months[i][3] = true;
      } else {
        months[i][3] = false;
      }
    }
    setState(() {});
  }
}
