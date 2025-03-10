import 'package:flutter/material.dart';
import 'package:progress_bar_steppers/steppers.dart';

class HorizontalProgressStep extends StatefulWidget {
  const HorizontalProgressStep({Key? key}) : super(key: key);

  @override
  State<HorizontalProgressStep> createState() => _HorizontalProgressStepState();
}

class _HorizontalProgressStepState extends State<HorizontalProgressStep> {
  var currentStep = 1;
  var totalSteps = 0;
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
            // inactiveColor: StepperColors.ink200s
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
    if (currentStep > totalSteps) return;
    // check if current step has no error, then move to the next step
    if (stepsData[currentStep - 1].state != StepperState.error) {
      currentStep++;
    }
  }

  _doWork() {
    if (currentStep == 3) {
      // fake error happens at step 3 when do work
      stepsData[2].state = StepperState.error;
    }
  }

  _fixError() {
    // fix error at the step 3 to continue to step 4
    if (stepsData[2].state == StepperState.error) {
      stepsData[2].state = StepperState.normal;
      currentStep++;
    }
  }
}
