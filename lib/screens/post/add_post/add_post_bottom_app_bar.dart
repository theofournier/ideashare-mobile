import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/util_widgets/stepper_circular_progress.dart';
import 'package:ideashare/generated/l10n.dart';

class AddPostBottomAppBar extends StatelessWidget {
  AddPostBottomAppBar({
    this.onPrevious,
    this.onNext,
    this.totalStep,
    this.currentStep,
    this.saveButton = false,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final int totalStep;
  final int currentStep;
  final bool saveButton;

  double getProgressValue() {
    double progressPercent =
        (((currentStep + 1) / totalStep).clamp(0.0, 1.0) * 100);
    return progressPercent.round() / 100;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildButton(
              context: context,
              onTap: onPrevious,
              icon: Icons.arrow_back_ios,
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: StepperCircularProgress(
                      foregroundColor: Theme.of(context).accentColor,
                      backgroundColor:
                          Theme.of(context).accentColor.withOpacity(0.1),
                      value: getProgressValue(),
                      title: Text(
                        "${currentStep + 1} ${S.of(context).addPostBottomProgressOf} $totalStep",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            buildButton(
              context: context,
              onTap: onNext,
              icon: saveButton ? Icons.check : Icons.arrow_forward_ios,
              color: saveButton ? Theme.of(context).accentColor : null,
              iconColor: saveButton ? Colors.white : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    BuildContext context,
    VoidCallback onTap,
    IconData icon,
    Color iconColor,
    Color color,
  }) {
    if (onTap == null) {
      return SizedBox(
        width: 53,
      );
    }
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 1.0,
            ),
            shape: BoxShape.circle,
            color: color,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(1000.0),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 35,
                color: iconColor ?? Theme.of(context).accentColor,
              ),
            ),
          ),
        ));
  }
}
