import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  final int statusIndex ;
  const StepperWidget(this.statusIndex, {super.key});


  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
        iconWidget: statusIndex >= 1
            ? const Icon(
                Icons.check_circle_outline_sharp,
                size: 30,
                color: Colors.green,
              )
            : const Icon(
                Icons.circle_outlined,
                size: 30,
                color: Colors.grey,
              ),
        title: StepperText("Order given to Supplier",
            textStyle: const TextStyle(fontSize: 18)),
      ),
      StepperData(
        iconWidget: statusIndex >= 2
            ? const Icon(
                Icons.check_circle_outline_sharp,
                size: 30,
                color: Colors.green,
              )
            : const Icon(
                Icons.circle_outlined,
                size: 30,
                color: Colors.grey,
              ),
        title: StepperText("Order Recieved at Supplier",
            textStyle: const TextStyle(fontSize: 18)),
      ),
      StepperData(
        iconWidget: statusIndex >= 3
            ? const Icon(
                Icons.check_circle_outline_sharp,
                size: 30,
                color: Colors.green,
              )
            : const Icon(
                Icons.circle_outlined,
                size: 30,
                color: Colors.grey,
              ),
        title: StepperText("Order received at Instructor",
            textStyle: const TextStyle(fontSize: 18)),
      ),
      StepperData(
        iconWidget: statusIndex >= 4
            ? const Icon(
                Icons.check_circle_outline_sharp,
                size: 30,
                color: Colors.green,
              )
            : const Icon(
                Icons.circle_outlined,
                size: 30,
                color: Colors.grey,
              ),
        title: StepperText("Order Delivered",
            textStyle: const TextStyle(fontSize: 18)),
      )
    ];

    return AnotherStepper(
      iconHeight: 30,
      iconWidth: 30,
      verticalGap: 30,
      stepperList: stepperData,
      stepperDirection: Axis.vertical,
      activeBarColor: Colors.green,
      inActiveBarColor: Colors.grey,
      activeIndex: statusIndex,
      barThickness: 4,
    );
  }
}
