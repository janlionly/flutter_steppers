import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steppers/horizontal_steppers.dart';
import 'package:steppers/stepper_style.dart';
import 'horizontal_progress_step_controller.dart';

class HorizontalProgressStep extends StatefulWidget {
  HorizontalProgressStep({Key? key}) : super(key: key);

  @override
  State<HorizontalProgressStep> createState() => _HorizontalProgressStepState();
}

class _HorizontalProgressStepState extends State<HorizontalProgressStep> {
  final controller = Get.put(HorizontalProgressStepController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
              () => HorizontalSteppers(
            labels: controller.stepsData,
            currentStep: controller.currentStep.value,
            stepBarStyle: StepperStyle(
              //   activeColor: DSColors.red500,
              maxLineLabel: 1,
              //   inactiveColor: DSColors.purple100
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                controller.nextStep();
              },
            ),
            ElevatedButton(
              child: const Text('Fix Error'),
              onPressed: () {
                controller.fixError();
              },
            ),
          ],
        ),
      ],
    );
  }
}
