import 'package:steppers/colors.dart';
import 'package:flutter/material.dart';
import 'package:steppers/vertical_steppers.dart';
import 'horizontal_steppers.dart';
import 'stepper_icon.dart';
import 'stepper_data.dart';
import 'stepper_style.dart';
import 'style.dart';

enum StepperDirection { horizontal, vertical }

class Steppers extends StatelessWidget {
  Steppers({
    Key? key,
    required this.labels,
    required this.currentStep,
    this.stepBarStyle,
    this.direction = StepperDirection.horizontal,
  });

  List<StepperData> labels;
  int currentStep;
  StepperStyle? stepBarStyle;
  StepperDirection direction;

  get _totalSteps => labels.length;

  get _stepBarStyle => stepBarStyle ??= StepperStyle();

  @override
  Widget build(BuildContext context) {
    assert(1 < _totalSteps && _totalSteps < 6 && currentStep <= _totalSteps + 1, 'Invalid progress steps');
    return direction == StepperDirection.horizontal
        ? HorizontalSteppers(
            labels: labels,
            currentStep: currentStep,
            stepBarStyle: _stepBarStyle,
          )
        : VerticalSteppers(
            labels: labels,
            currentStep: currentStep,
            stepBarStyle: _stepBarStyle,
          );
  }
}
