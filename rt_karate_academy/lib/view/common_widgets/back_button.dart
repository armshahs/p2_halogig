import 'package:flutter/material.dart';

class BackCommonButton extends StatelessWidget {
  const BackCommonButton({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
          ),
        ),
      ),
    );
  }
}
