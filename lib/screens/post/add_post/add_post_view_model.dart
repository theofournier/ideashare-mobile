import 'package:flutter/material.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/services/models/post/post/post.dart';

class AddPostViewModel with ChangeNotifier {
  AddPostStep currentStep = AddPostStep.category;
  Post post = Post();

  void updateWith({
    AddPostStep currentStep,
    Post post,
  }) {
    this.currentStep = currentStep ?? this.currentStep;
    this.post = post ?? this.post;
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
  void reset(){
    currentStep = null;
    post = Post();
    notifyListeners();
  }
}
