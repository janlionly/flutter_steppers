import 'package:example/style.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
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
              'Horizontal Progress Step',
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
              'Vertical Progress Step',
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
