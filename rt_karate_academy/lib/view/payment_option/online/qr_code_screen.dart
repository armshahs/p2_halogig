import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rt_karate_academy/controller/auth/auth_services.dart';
import 'package:rt_karate_academy/controller/home/uniform/uniform_services.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/payment_option/approval_screen.dart';

import '../../../controller/home/payment/payment_services.dart';
import '../../../model/fee_model.dart';
import '../../common_widgets/blue_button.dart';

class QrCodeScreen extends StatefulWidget {
  final String amount;
  final String examAmount;
  final String uniformAmount;
  final String from;
  final OrderModel orderobj;
  final List<String> months;

  const QrCodeScreen(
      {super.key,
      required this.amount,
      required this.from,
      required this.orderobj,
      required this.months,
      required this.examAmount,
      required this.uniformAmount});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackCommonButton(onTap: () {}),
                  const Text(
                    'Scan & Pay',
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://staticixstatic.com/media/9b1f7f_3ee3cce48e1f479ea27e93c91893cc8a~mv2.jpg/v1/fill/w_500,h_478,al_c,q_90/file.jpg'),
                  ),
                  const Text(
                    'Druid Wensleydale',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/828088276/vector/qr-code-illustration.jpg?s=612x612&w=0&k=20&c=FnA7agr57XpFi081ZT5sEmxhLytMBlK4vzdQxt8A70M='),
                      fit: BoxFit.contain),
                ),
              ),
              const Spacer(),
              BlueCommonButton(
                  text: 'Confirm Pay',
                  onTap: () async {
                    if (widget.from == "order") {
                      var orderObj = widget.orderobj;
                      await UniformServices().storeOrderTransaction(OrderModel(
                          username: orderObj.username,
                          fitType: orderObj.fitType,
                          size: orderObj.size,
                          price: orderObj.price,
                          quantity: orderObj.quantity,
                          uniformName: orderObj.uniformName,
                          paymentType: orderObj.paymentType,
                          paidTo: "",
                          date: DateTime.now(),
                          status: orderObj.status,
                          id: '',
                          userEmail: FirebaseAuth.instance.currentUser!.email!,
                          paymentStatus: 'unpaid'));

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentApprovalScreen()));
                    } else {
                      await PaymentServices().storeFeeTransaction(
                          FeeTransaction(
                              months: widget.months,
                              email: FirebaseAuth.instance.currentUser!.email!,
                              username:
                                  "${AuthServices().user.value.firstName} ${AuthServices().user.value.lastName}",
                              amount: double.parse(widget.amount),
                              type: 'online',
                              paidTo: "",
                              date: DateTime.now(),
                              id: ''),
                          num.tryParse(widget.examAmount) ?? 0,
                          num.tryParse(widget.uniformAmount) ?? 0);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentApprovalScreen()));
                    }
                  })
            ],
          ),
        ),
      )),
    );
  }
}
