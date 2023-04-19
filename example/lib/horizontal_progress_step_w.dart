import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steppers/colors.dart';
import 'package:steppers/steppers.dart';
import 'horizontal_progress_step_controller.dart';

class HorizontalProgressStep extends StatefulWidget {
  HorizontalProgressStep({Key? key}) : super(key: key);

  @override
  State<HorizontalProgressStep> createState() => _HorizontalProgressStepState();
}

class _HorizontalProgressStepState extends State<HorizontalProgressStep> {
  var currentStep = 1;
  var totalSteps = 0;
  var hasError = false;
  final stepsData = [
    StepperData(
      label: 'Step 1',
    ),
    StepperData(
      label: 'Step 2',
    ),
    StepperData(
      label: 'Step 3',
    ),
    StepperData(
      label: 'Step 4',
    ),
  ];

  @override
  void initState() {
    totalSteps = stepsData.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Steppers(
            direction: StepperDirection.horizontal,
            labels: stepsData,
            currentStep: currentStep,
            stepBarStyle: StepperStyle(
                // activeColor: StepperColors.red500,
              maxLineLabel: 2,
                // inactiveColor: StepperColors.purple100
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
                setState(() {
                  _nextStep();
                });
              },
            ),
            ElevatedButton(
              child: const Text('Fix Error'),
              onPressed: () {
                setState(() {
                  _fixError();
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  void _nextStep() {
    _doWork();
    if (currentStep > totalSteps) { // reset - test only
      currentStep = 1;
      return;
    }
    if(stepsData[currentStep-1].state != StepperState.error) {
      currentStep++;
    }
  }

  _fakeErrorOccurs() {
    hasError = true;
    stepsData[currentStep - 1].state = StepperState.error;
  }

  _doWork() {
    if(currentStep == totalSteps - 1){
      _fakeErrorOccurs();
    }
  }

  _fixError() {
    if(!hasError) return;
    hasError = false;
    stepsData[currentStep - 1].state = StepperState.normal;
    currentStep++;
  }
}
