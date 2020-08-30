import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_flat_button.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    Key key,
    this.selected,
    this.iconSelected,
    this.icon,
    this.text,
    this.onPressed,
  }) : super(key: key);

  ActionButton.like({
    Key key,
    this.text,
    this.onPressed,
    this.selected,
  })  : iconSelected = Icons.thumb_up,
        icon = OMIcons.thumbUp,
        super(key: key);

  ActionButton.follow({
    Key key,
    this.text,
    this.onPressed,
    this.selected,
  })  : iconSelected = Icons.person_add,
        icon = OMIcons.personAdd,
        super(key: key);

  ActionButton.work({
    Key key,
    this.text,
    this.onPressed,
    this.selected,
  })  : iconSelected = Icons.work,
        icon = OMIcons.workOutline,
        super(key: key);


  final bool selected;
  final IconData iconSelected;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomFlatButton(
      icon: selected ? iconSelected : icon,
      iconSize: 24,
      iconColor: selected ? Theme.of(context).accentColor : AppColors.greyDark,
      textColor: selected ? Theme.of(context).accentColor : AppColors.greyDark,
      text: text,
      fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
      upperCase: false,
      textSize: 16,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      shrinkWrap: true,
      onPressed: onPressed,
    );
  }
}
