import 'package:flutter/material.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/fees/fees_screen.dart';

import '../../../model/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> list = [
    CartItem(productName: "Regular Uniform", price: "120", count: "1", id: "1"),
    CartItem(productName: "Canvas Uniform", price: "180", count: "1", id: "2")
  ];

  @override
  Widget build(BuildContext context) {
    var totalAmount = 0;
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: backgroundGradient,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackCommonButton(onTap: () {
                              Navigator.pop(context);
                            }),
                            const Text(
                              'Cart',
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
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: list.length,
                                      itemBuilder: (context, index) => Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Container(
                                              width: double.infinity,
                                              // height: 120,

                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey[50],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          image:
                                                              const DecorationImage(
                                                            image: NetworkImage(
                                                              'https://5.imimg.com/data5/KD/HJ/AS/SELLER-48020536/black-belt-karate-uniform-500x500.jpg',
                                                            ),
                                                          )),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          list[index]
                                                              .productName,
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5),
                                                          child: Text(
                                                            "₹ ${list[index].price}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  if (!(int.parse(
                                                                          list[index]
                                                                              .count) ==
                                                                      0)) {
                                                                    list[index]
                                                                        .count = (int.parse(list[index].count) -
                                                                            1)
                                                                        .toString();
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 30,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7)),
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Icon(
                                                                  Icons.remove,
                                                                  size: 20,
                                                                )),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Text(
                                                                "${list[index].count ?? "1"}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  list[index]
                                                                          .count =
                                                                      (int.parse(list[index].count) +
                                                                              1)
                                                                          .toString();
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 30,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7)),
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Icon(
                                                                  Icons.add,
                                                                  size: 20,
                                                                )),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))),
                              const Divider(
                                height: 30,
                              ),
                              Text(
                                  'Total Amount :₹ ${list.map((e) => int.parse(e.price) * int.parse(e.count)).fold(0, (p, e) => p + e)}'),
                              const SizedBox(
                                height: 10,
                              ),
                              BlueCommonButton(
                                  text: 'Confirm',
                                  onTap: () {
                                    Navigator.pop(context, [
                                      {
                                        "amount": list
                                            .map((e) =>
                                                int.parse(e.price) *
                                                int.parse(e.count))
                                            .fold(0, (p, e) => p + e)
                                      }
                                    ]);
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             FeesScreen()));
                                  })
                            ],
                          ),
                        ),
                      )),
                    ]))));
  }
}
