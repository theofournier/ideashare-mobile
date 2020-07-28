import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';

class StatusUtils {
  static Map<PostStatusType, String> getStatusTitle = {
    PostStatusType.open: S.current.postStatusTypeOpen,
    PostStatusType.ongoing: S.current.postStatusTypeOngoing,
    PostStatusType.completed: S.current.postStatusTypeCompleted,
  };

  static Map<PostStatusType, Color> getStatusColor = {
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