import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../vertical_steppers.dart';
import '../stepper_style.dart';
import 'vertical_progress_step_controller.dart';

class VerticalProgressStep extends StatefulWidget {
  VerticalProgressStep({Key? key}) : super(key: key);

  @override
  State<VerticalProgressStep> createState() => _VerticalProgressStepState();
}

class _VerticalProgressStepState extends State<VerticalProgressStep> {

  final controller = Get.put(VerticalProgressStepController());

  @override
  void initState() {
    super.initState();
    _initStepData();
  }

  _isPassedStep(int step, int currentStep) => step <= currentStep || controller.currentStep.value == 3;

  _initStepData() {
    // controller.stepsData[0].child = Obx(
    //       () => Container(
    //     margin: const EdgeInsets.only(top: 8),
    //     child: DSButton(
    //       enableTracking: true,
    //       identity: 'close',
    //       title: 'Button Step 1',
    //       size: DsButtonSize.COMPACT,
    //       style: _isPassedStep(1, controller.currentStep.value) ? DsButtonStyle.SECONDARY : DsButtonStyle.DISABLED,
    //       onPressed: () {},
    //     ),
    //   ),
    // );

    // controller.stepsData[2].child = Obx(
    //       () => Container(
    //     margin: const EdgeInsets.only(top: 8),
    //     child: DSButton(
    //       enableTracking: true,
    //       identity: 'close',
    //       title: 'Button Step 3',
    //       size: DsButtonSize.COMPACT,
    //       style: _isPassedStep(3, controller.currentStep.value) ? DsButtonStyle.SECONDARY : DsButtonStyle.DISABLED,
    //       onPressed: () {},
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
              () => VerticalSteppers(
            labels: controller.stepsData,
            currentStep: controller.currentStep.value,
            stepBarStyle: StepperStyle(
              //   activeColor: DSColors.red500,
              maxLineLabel: 2,
              //   inactiveColor: DSColors.purple100
            ),
          ),
        ),
        const SizedBox(
          height: 16,
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
