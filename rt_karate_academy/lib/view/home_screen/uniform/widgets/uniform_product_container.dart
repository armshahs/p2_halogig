import 'package:flutter/material.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/product_checkout_screen.dart';

class UniformProductContainer extends StatefulWidget {
  final int index;
  final bool showButton;

  const UniformProductContainer(
    this.index,
    this.showButton, {
    super.key,
  });

  @override
  State<UniformProductContainer> createState() =>
      _UniformProductContainerState();
}

var height = "";

class _UniformProductContainerState extends State<UniformProductContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 130,
                child: Image.network(
                  'https://5.imimg.com/data5/KD/HJ/AS/SELLER-48020536/black-belt-karate-uniform-500x500.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.index == 0
                            ? 'Exported Quality Uniform'
                            : 'Canvas Uniform',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Recycle Boucle Knit Cardigan Pink',
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.index == 0 ? '₹1200' : '₹2750',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          const Text(
                            ' 4.8 Rating',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Height:',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextField(
                            onChanged: (v) {
                              height = v;
                            },
                            style: const TextStyle(),
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: "in Inches"),
                          )),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       size = "small";
                          //     });
                          //   },
                          //   child: Container(
                          //     width: 25,
                          //     height: 25,
                          //     decoration: BoxDecoration(
                          //         color: size == "small" ? Colors.grey : null,
                          //         borderRadius: BorderRadius.circular(100),
                          //         border: Border.all(color: Colors.grey)),
                          //     child: Center(
                          //       child: Text(
                          //         'S',
                          //         style: size == "small"
                          //             ? TextStyle(color: Colors.white)
                          //             : null,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       size = "medium";
                          //     });
                          //   },
                          //   child: Container(
                          //     width: 25,
                          //     height: 25,
                          //     decoration: BoxDecoration(
                          //         color: size == "medium" ? Colors.grey : null,
                          //         borderRadius: BorderRadius.circular(100),
                          //         border: Border.all(color: Colors.grey)),
                          //     child: Center(
                          //       child: Text(
                          //         'M',
                          //         style: size == "medium"
                          //             ? TextStyle(color: Colors.white)
                          //             : null,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       size = "large";
                          //     });
                          //   },
                          //   child: Container(
                          //     width: 25,
                          //     height: 25,
                          //     decoration: BoxDecoration(
                          //         color: size == "large" ? Colors.grey : null,
                          //         borderRadius: BorderRadius.circular(100),
                          //         border: Border.all(color: Colors.grey)),
                          //     child: Center(
                          //       child: Text(
                          //         'L',
                          //         style: size == "large"
                          //             ? TextStyle(color: Colors.white)
                          //             : null,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          widget.showButton
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BlueCommonButton(
                      text: 'Add to Cart',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductCheckoutScreen(
                                price: widget.index == 0 ? "1200" : "2750",
                                size: height,
                                type: widget.index + 1)));
                      }),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
