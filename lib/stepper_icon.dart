import 'package:steppers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'stepper_data.dart';
import 'stepper_style.dart';

class StepperIcon extends StatelessWidget {
  StepperIcon({
    Key? key,
    required this.step,
    required this.currentStep,
    required this.stepBarStyle,
    required this.stepData,
  }) : super(key: key);

  final int currentStep;
  final int step;
  StepperStyle stepBarStyle;
  StepperData stepData;

  bool _isCurrentStep(int step) => currentStep >= step;

  bool _isPassedStep(int step) => currentStep <= step;

  @override
  Widget build(BuildContext context) {
    return stepData.state == StepperState.error
        ? _errorWidget
        : Container(
            alignment: Alignment.center,
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _isCurrentStep(step) ? stepBarStyle.activeColor : stepBarStyle.inactiveColor,
              shape: BoxShape.circle,
            ),
            child: _isPassedStep(step)
                ? Text(
                    '$step',
                    style: const TextStyle(color: StepperColors.white500, fontSize: 12, fontWeight: FontWeight.bold),
                  )
                : const Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
          );
  }

  get _errorWidget => Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: StepperColors.red500,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.error,
          color: Colors.white,
          size: 16,
        ),
      );
}
