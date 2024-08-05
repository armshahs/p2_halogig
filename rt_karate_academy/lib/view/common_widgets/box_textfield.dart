import 'package:flutter/material.dart';

class BoxTextField extends StatelessWidget {
  const BoxTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.validateFuc,
    this.errorMessage,
  });
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?) validateFuc;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xffE8ECF4),
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                validator: validateFuc,
                controller: textEditingController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
