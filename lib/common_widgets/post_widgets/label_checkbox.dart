import 'package:flutter/material.dart';
import 'package:ideashare/services/models/label/label.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class LabelCheckbox extends StatefulWidget {
  LabelCheckbox({
    Key key,
    this.label,
    this.selectedLabelKeys,
    this.onTap,
  }) : super(key: key);

  final Label label;
  final List<String> selectedLabelKeys;
  final void Function(Label label) onTap;

  @override
  _LabelCheckboxState createState() => _LabelCheckboxState();
}

class _LabelCheckboxState extends State<LabelCheckbox> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildLabel(
          context: context,
          label: widget.label,
        ),
        if (show &&
            widget.label.subLabels != null &&
            widget.label.subLabels.isNotEmpty) ...[
          SizedBox(
            height: 16,
          ),
          buildSubLabels(
            context: context,
            subLabels: widget.label.subLabels,
          ),
        ],
      ],
    );
  }

  Widget buildLabel({
    BuildContext context,
    Label label,
  }) {
    IconData icon = Icons.check_box_outline_blank;
    if (widget.selectedLabelKeys.contains(label.id)) {
      icon = Icons.check_box;
    } else if (label.subLabels != null &&
        label.subLabels.isNotEmpty &&
        label.subLabels.firstWhere(
                (element) => widget.selectedLabelKeys.contains(element.id),
                orElse: () => null) !=
            null) {
      icon = OMIcons.indeterminateCheckBox;
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: widget.label.subLabels != null &&
                    widget.label.subLabels.isNotEmpty
                ? () => setState(() {
                      this.show = !this.show;
                    })
                : null,
            child: Row(
              children: <Widget>[
                if (label.icon != null) ...[
                  Container(
                    margin: const EdgeInsets.only(right: 24),
                    child: Icon(
                      label.icon,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                  ),
                ],
                Text(
                  label.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .toSemiBold()
                      .toSize(24),
                ),
                if (widget.label.subLabels != null &&
                    widget.label.subLabels.isNotEmpty) ...[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Theme.of(context).accentColor,
                    size: 32,
                  ),
                ],
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            icon,
            color: Theme.of(context).accentColor,
            size: 32,
          ),
          onPressed: () => widget.onTap(label),
        ),
      ],
    );
  }

  Widget buildSubLabels({
    BuildContext context,
    List<Label> subLabels,
  }) {
    return Column(
      children: subLabels
          .asMap()
          .entries
          .map(
            (subLabel) => Container(
              margin: EdgeInsets.only(
                  bottom: subLabel.key < subLabels.length - 1 ? 8 : 0),
              child: InkWell(
                onTap: () => widget.onTap(subLabel.value),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: <Widget>[
                      if (subLabel.value.icon != null) ...[
                        Container(
                          margin: const EdgeInsets.only(right: 32),
                          child: Icon(
                            subLabel.value.icon,
                            color: Theme.of(context).primaryColor,
                            size: 32,
                          ),
                        ),
                      ],
                      if (subLabel.value.icon == null) ...[
                        SizedBox(
                          width: 64,
                        ),
                      ],
                      Expanded(
                        child: Text(
                          subLabel.value.title,
                          style:
                              Theme.of(context).textTheme.bodyText2.toSize(20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Icon(
                          widget.selectedLabelKeys.contains(subLabel.value.id)
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Theme.of(context).accentColor,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
