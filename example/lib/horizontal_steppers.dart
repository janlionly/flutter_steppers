import 'package:flutter/material.dart';
import 'horizontal_stepper_item.dart';
import 'horizontal_stepper_divider.dart';
import 'stepper_data.dart';
import 'stepper_style.dart';


class HorizontalSteppers extends StatelessWidget {
  HorizontalSteppers({
    Key? key,
    List<int>? features,
    required this.labels,
    required this.currentStep,
    this.stepBarStyle,
  });

  List<StepperData> labels;
  int currentStep;
  StepperStyle? stepBarStyle;
  get _totalSteps => labels.length;
  get _stepBarStyle => stepBarStyle ??= StepperStyle();

  @override
  Widget build(BuildContext context) {
    assert(1 < _totalSteps && _totalSteps < 6 && currentStep <= _totalSteps + 1, 'Invalid steppers');
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: _buildListDividers()
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildListStepWidgets(),
          ),
        ],
    );
  }

  _buildListDividers() {
    List<Widget> dividers = [];
    labels.asMap().forEach((index, model) {
      dividers.add(
          ProgressStepHorizotalDivider(
              step: index + 1,
              currentStep: currentStep,
              totalSteps: _totalSteps,
              stepBarStyle: _stepBarStyle,
              labels: labels,
          )
      );
    });
    return dividers;
  }

  _buildListStepWidgets() {
    List<Widget> stepWidgets = [];
    labels.asMap().forEach((index, model) {
      stepWidgets.add(HorizontalStepperItem(
        step: index + 1,
        currentStep: currentStep,
        stepData: model,
        totalSteps: _totalSteps,
        stepBarStyle: _stepBarStyle,
      ));
    });
    return stepWidgets;
  }
}
