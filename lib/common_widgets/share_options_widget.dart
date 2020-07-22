import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_dropdown_button.dart';
import 'package:ideashare/common_widgets/custom_flat_button.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/line.dart';
import 'package:ideashare/common_widgets/section_title.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/share_option.dart';
import 'package:ideashare/services/models/common/share_options_data.dart';
import 'package:ideashare/utils/enum_string.dart';
import 'package:ideashare/utils/share_options_utils.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class ShareOptionsWidget extends StatelessWidget {
  const ShareOptionsWidget({
    Key key,
    this.shareOptions,
  }) : super(key: key);

  final List<ShareOptionsData> shareOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: shareOptions
          .asMap()
          .entries
          .map((shareOption) => Container(
                margin: EdgeInsets.only(
                    bottom: shareOption.key < shareOptions.length - 1 ? 32 : 0),
                child: buildShareOption(
                  context: context,
                  shareOptionData: shareOption.value,
                ),
              ))
          .toList(),
    );
  }

  Widget buildShareOption({
    BuildContext context,
    ShareOptionsData shareOptionData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (shareOptionData.title != null) ...[
          Text(
            shareOptionData.title,
            style: Theme.of(context).textTheme.headline5.toMedium(),
          ),
          if (shareOptionData.description != null) ...[
            Text(
              shareOptionData.description,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
          SizedBox(
            height: 4,
          ),
          Line(
            borderRadius: 6,
            height: 1,
          ),
          SizedBox(
            height: 16,
          ),
        ],
        ...shareOptionData.shareOptions
            .asMap()
            .entries
            .map(
              (shareOption) => Container(
                margin: EdgeInsets.only(
                    bottom:
                    shareOption.key < shareOptionData.shareOptions.length - 1
                            ? 8
                            : 0),
                child: buildOption(
                  context: context,
                  shareOption: shareOption.value,
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget buildOption({
    BuildContext context,
    ShareOption shareOption,
  }) {
    if (shareOption.visiblenessOptions != null &&
        shareOption.visiblenessOptions.isNotEmpty) {
      return DropdownOption(
        key: Key(shareOption.id),
        shareOption: shareOption,
      );
    } else if (shareOption.boolValue != null) {
      return SwitchOption(
        key: Key(shareOption.id),
        shareOption: shareOption,
      );
    }
    return Container();
  }
}

class SwitchOption extends StatelessWidget {
  const SwitchOption({
    Key key,
    this.shareOption,
  }) : super(key: key);

  final ShareOption<bool> shareOption;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => shareOption.onTap(!shareOption.boolValue),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SectionTitle(
              title: shareOption.title,
              description: shareOption.description,
            ),
          ),
          Switch(
            value: shareOption.boolValue,
            onChanged: (value) => shareOption.onTap(value),
          ),
        ],
      ),
    );
  }
}

class ButtonOption extends StatelessWidget {
  const ButtonOption({
    Key key,
    this.shareOption,
  }) : super(key: key);

  final ShareOption<Visibleness> shareOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(
          title: shareOption.title,
          description: shareOption.description,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          children: shareOption.visiblenessOptions
              .map((visiblenessOption) => buildButton(
                    context: context,
                    visibleness: visiblenessOption,
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget buildButton({
    BuildContext context,
    Visibleness visibleness,
  }) {
    if (visibleness == shareOption.visiblenessValue) {
      return CustomRaisedButton(
        text: ShareOptionsUtils.getVisiblenessTitle(context)[visibleness],
        icon: Icons.check,
        iconSize: 30,
        iconPosition: IconPosition.right,
        borderRadius: 100,
        upperCase: false,
        textSize: 16,
        onPressed: () => shareOption.onTap(visibleness),
      );
    }
    return CustomFlatButton(
      text: ShareOptionsUtils.getVisiblenessTitle(context)[visibleness],
      upperCase: false,
      onPressed: () => shareOption.onTap(visibleness),
      textColor: Theme.of(context).accentColor,
      textSize: 18,
    );
  }
}

class DropdownOption extends StatelessWidget {
  const DropdownOption({
    Key key,
    this.shareOption,
  }) : super(key: key);

  final ShareOption<Visibleness> shareOption;

  @override
  Widget build(BuildContext context) {
    List<CustomDropdownData> items = shareOption.visiblenessOptions
        .map((visiblenessOption) => CustomDropdownData(
              id: EnumString.string(visiblenessOption),
              text: ShareOptionsUtils.getVisiblenessTitle(
                  context)[visiblenessOption],
            ))
        .toList();
    CustomDropdownData value = shareOption.visiblenessValue != null
        ? items.firstWhere((element) =>
            element.id == EnumString.string(shareOption.visiblenessValue))
        : null;

    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: SectionTitle(
            title: shareOption.title,
            description: shareOption.description,
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomDropdownButton(
            isExpanded: true,
            underline: true,
            value: value,
            items: items,
            onChanged: (customDropdownData) => shareOption.onTap(
                EnumString.fromString(
                    Visibleness.values, customDropdownData.id)),
          ),
        ),
      ],
    );
  }
}
