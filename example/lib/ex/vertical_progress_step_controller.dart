import 'package:get/get.dart';
import '../stepper_data.dart';

class VerticalProgressStepController extends GetxController {
  var currentStep = 1.obs;
  var totalSteps = 0;
  var hasError = false;

  int get totals => stepsData.length;

  final stepsData = [
    StepperData(
      label: 'eContractFillData' + ' cá nhân',
      description: 'Đây là nội dung description, không giới hạn số dòng, recommend tối đa 311 dòng',
    ),
    StepperData(
      label: 'confirm',
      // description: 'Đây là nội dung description, không giới hạn số dòng, recommend tối đa 311 dòng',
    ),
    StepperData(
      label: 'eContractSignContract',
      description: 'Đây là nội dung description, không giới hạn số dòng, recommend tối đa 311 dòng',
    ),
    StepperData(
      label: 'Hoàn tất',
      description: 'Đây là nội dung description, không giới hạn số dòng, recommend tối đa 311 dòng',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    totalSteps = stepsData.length;
  }

  nextStep() {
    if (hasError) return;
    if (currentStep.value == totals + 1) {
      currentStep.value = 1;
      return;
    }
    currentStep.value++;
    _fakeError();
  }

  _fakeError() {
    if (currentStep.value == totals && !hasError) {
      hasError = true;
      stepsData[totals - 2].state = StepperState.error;
      currentStep.value--;
    }
  }

  fixError() {
    if (!hasError) return;
    hasError = false;
    stepsData[totals - 2].state = StepperState.normal;
    if (currentStep.value == totals + 1) {
      stepsData[totals - 2].state = StepperState.normal;
      currentStep.value = 1;
      return;
    }
    currentStep.value++;
  }
}
