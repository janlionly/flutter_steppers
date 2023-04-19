import 'package:flutter/material.dart';
import 'package:steppers/colors.dart';
import 'package:steppers/style.dart';
import 'horizontal_progress_step_w.dart';
import 'vertical_progress_step_w.dart';

class StepBarPage extends StatefulWidget {
  StepBarPage({Key? key}) : super(key: key);

  @override
  State<StepBarPage> createState() => _StepBarPageState();
}

class _StepBarPageState extends State<StepBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Horizontal Steppers',
              style: StepperStyles.t16SB.copyWith(color: StepperColors.grey500s),
            ),
            const SizedBox(
              height: 16,
            ),
            HorizontalProgressStep(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Vertical Steppers',
              style: StepperStyles.t16SB.copyWith(color: StepperColors.grey500s),
            ),
            const SizedBox(
              height: 16,
            ),
            VerticalProgressStep(),
          ],
        ),
      ),
    );
  }
}
