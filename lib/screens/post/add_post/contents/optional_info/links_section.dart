import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialog_text_field.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/common/add_post_section_title.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/helpers.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class LinksSection extends StatelessWidget {
  LinksSection({
    this.links,
    this.spaceTitle,
    this.controller,
    this.onAddLink,
    this.onEditLink,
    this.onDeleteLink,
  });

  final List<String> links;
  final double spaceTitle;
  final TextEditingController controller;
  final Function(String link) onAddLink;
  final Function(int index, String link) onEditLink;
  final Function(int index) onDeleteLink;

  Future<String> onLink(BuildContext context, [String initialLink]) async {
    if (initialLink != null && initialLink.isNotEmpty) {
      controller.text = initialLink;
    }
    return await AlertDialogTextField(
      title: S.of(context).addPostOptionalInfoLinksAlertTitle,
      message: S.of(context).addPostOptionalInfoLinksDescription,
      hintText: S.of(context).addPostOptionalInfoLinksUrl,
      keyboardType: TextInputType.url,
      controller: controller,
      autoFocus: true,
      maxLines: 4,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AddPostSectionTitle(
          title: S.of(context).addPostOptionalInfoLinksTitle,
          description: S.of(context).addPostOptionalInfoLinksDescription,
          onAdd: () async {
            String link = await onLink(context);
            if (link != null && link.isNotEmpty) {
              onAddLink(link.trim());
            }
          },
        ),
        if (links != null && links.isNotEmpty) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: links
                .asMap()
                .entries
                .map(
                  (link) => Container(
                    margin: EdgeInsets.only(bottom: link.key < links.length - 1 ? 8 : 0),
                    child: buildLinkItem(
                      context,
                      link.value,
                      link.key,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget buildLinkItem(BuildContext context, String link, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: InkWell(
            onTap: () {},
            child: SelectableText.rich(
              TextSpan(
                text: link,
                style: Theme.of(context).textTheme.bodyText1.underline(),
              ),
              maxLines: 4,
              minLines: 1,
              onTap: () => Helpers.launchURL(context, link),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () async {
                String resultLink = await onLink(context, link);
                if (resultLink != null && resultLink.isNotEmpty) {
                  onEditLink(index, resultLink.trim());
                }
              },
              icon: Icon(OMIcons.edit),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: () => onDeleteLink(index),
              icon: Icon(Icons.clear),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ],
    );
  }
}
