import 'package:flutter/material.dart';
import 'package:progress_bar_steppers/steppers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steppers Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepBarPage(),
    );
  }
}

class StepBarPage extends StatefulWidget {
  StepBarPage({Key? key}) : super(key: key);

  @override
  State<StepBarPage> createState() => _StepBarPageState();
}

class _StepBarPageState extends State<StepBarPage> {
  var currentStep = 1;
  var totalSteps = 0;
  late List<StepperData> stepsData;

  @override
  void initState() {
    super.initState();
    stepsData = [
      StepperData(
        label: 'Step 1',
        state: StepperState.hidden,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur risus est, sed consequat libero luctus vitae. Duis ultrices magna quis risus porttitor luctus. Nulla vel tempus nisl, ultricies congue lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
        child: ElevatedButton(
          child: const Text('Button 1'),
          onPressed: () {},
        ),
      ),
      StepperData(
        label: 'Step 2',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur risus est, sed consequat libero luctus vitae. Duis ultrices magna quis risus porttitor luctus. Nulla vel tempus nisl, ultricies congue lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
      ),
      StepperData(
        label: 'Step 3',
      ),
      StepperData(
        label: 'Step 4',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur risus est, sed consequat libero luctus vitae. Duis ultrices magna quis risus porttitor luctus. Nulla vel tempus nisl, ultricies congue lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
      ),
    ];
    totalSteps = stepsData.length;
  }

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
              style:
                  StepperStyles.t16SB.copyWith(color: StepperColors.grey500s),
            ),
            const SizedBox(
              height: 16,
            ),
            Steppers(
              direction: StepperDirection.horizontal,
              labels: stepsData,
              currentStep: currentStep,
              stepBarStyle: StepperStyle(
                // activeColor: StepperColors.red500,
                maxLineLabel: 2,
                // inactiveColor: StepperColors.grey400
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Vertical Steppers',
              style:
                  StepperStyles.t16SB.copyWith(color: StepperColors.grey500s),
            ),
            const SizedBox(
              height: 16,
            ),
            Steppers(
              direction: StepperDirection.vertical,
              labels: stepsData,
              currentStep: currentStep,
              stepBarStyle: StepperStyle(
                //   activeColor: DSColors.red500,
                maxLineLabel: 2,
                //   inactiveColor: DSColors.grey400
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
        ),
      ),
    );
  }

  _nextStep() {
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
