import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';

class StatusUtils {
  static Map<PostStatusType, String> getStatusTitle(BuildContext context) => {
    PostStatusType.open: S.of(context).postStatusTypeOpen,
    PostStatusType.ongoing: S.of(context).postStatusTypeOngoing,
    PostStatusType.completed: S.of(context).postStatusTypeCompleted,
  };

  static Map<PostStatusType, Color> getStatusColor(BuildContext context) => {
    PostStatusType.open: AppColors.statusOpenColor,
    PostStatusType.ongoing: AppColors.statusOngoingColor,
    PostStatusType.completed: AppColors.statusCompletedColor,
  };

  static Map<PostStatusType, Color> getStatusTextColor(BuildContext context) => {
    PostStatusType.open: Theme.of(context).primaryColor,
    PostStatusType.ongoing: Colors.white,
    PostStatusType.completed: Colors.white,
  };
  
}