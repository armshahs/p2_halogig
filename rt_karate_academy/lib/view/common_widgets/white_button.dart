import 'package:flutter/material.dart';

class WhiteCommonButton extends StatelessWidget {
  const WhiteCommonButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xff345fb3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
