import 'package:flutter/material.dart';
import 'package:rt_karate_academy/model/order_model.dart';
import 'package:rt_karate_academy/view/common_widgets/blue_button.dart';
import 'package:rt_karate_academy/view/home_screen/uniform/product_checkout_screen.dart';

class UniformProductContainer2 extends StatefulWidget {
  final int index;
  final bool showButton;
  final OrderModel data;

  const UniformProductContainer2(
    this.index,
    this.showButton,
    this.data, {
    super.key,
  });

  @override
  State<UniformProductContainer2> createState() =>
      _UniformProductContainerState();
}

var size = "";
var uniform = "";

class _UniformProductContainerState extends State<UniformProductContainer2> {
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
                      const Text(
                        'Regular Uniform',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Recucle Bouncle Knit Cardian Pink',
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '₹${widget.data.price}',
                        style: TextStyle(
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
                            'Size:',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = "small";
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: size == "small" ? Colors.grey : null,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  'S',
                                  style: size == "small"
                                      ? TextStyle(color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = "medium";
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: size == "medium" ? Colors.grey : null,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  'M',
                                  style: size == "medium"
                                      ? TextStyle(color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                size = "large";
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: size == "large" ? Colors.grey : null,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  'L',
                                  style: size == "large"
                                      ? TextStyle(color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                          )
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
                                price: "120",
                                size: size,
                                type: widget.index + 1)));
                      }),
                )
              : SizedBox()
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    size = widget.data.size;
  }
}
