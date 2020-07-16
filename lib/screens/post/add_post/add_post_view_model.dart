import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_category_content.dart';


class StepData {
  StepData({
    this.content,
    this.title,
    this.description,
    this.onNext,
  });

  final Widget content;
  final String title;
  final String description;
  final Function onNext;
}

class AddPostViewModel with ChangeNotifier {
  AddPostStep currentStep;

  void updateWith({
    AddPostStep currentStep,
  }) {
    this.currentStep = currentStep ?? this.currentStep;
    notifyListeners();
  }

  void nextStep() {
    if (this.currentStep.index < AddPostStep.values.length - 1) {
      goToStep(AddPostStep.values[this.currentStep.index + 1]);
    }
  }

  void previousStep() {
    if (this.currentStep.index > 0) {
      goToStep(AddPostStep.values[this.currentStep.index - 1]);
    }
  }

  void goToStep(AddPostStep step) {
    updateWith(currentStep: step);
  }
}
