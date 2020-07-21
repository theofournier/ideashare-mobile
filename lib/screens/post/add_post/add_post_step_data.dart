import 'package:flutter/material.dart';

enum AddPostStep {
  category,
  info,
  optionalInfo,
  linkedIssue,
  labels,
  shareOptions,
  resume,
}

class AddPostStepData {
  AddPostStepData({
    this.content,
    this.title,
    this.description,
    this.appBarButton,
    this.onPressedAppBarButton,
  });

  final Widget content;
  final String title;
  final String description;
  final String appBarButton;
  final VoidCallback onPressedAppBarButton;

}