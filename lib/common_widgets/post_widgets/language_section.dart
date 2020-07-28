import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/post_widgets/section_title.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/utils/custom_locales.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class LanguageSection extends StatelessWidget {
  LanguageSection({
    this.sectionTitle,
    this.descriptionTitle,
    this.currentLanguageKey,
    this.languages,
    this.popularLanguageCodes,
    this.onSave,
  });

  final String sectionTitle;
  final String descriptionTitle;
  final String currentLanguageKey;
  final List<MapEntry<String, String>> languages;
  final List<String> popularLanguageCodes;
  final Function(String languageKey) onSave;

  Future<String> showLanguages(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      builder: (context) => buildLanguages(context: context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            right: 40,
          ),
          child: SectionTitle(
            title: sectionTitle ?? S.of(context).languageSectionTitle,
            description: descriptionTitle,
          ),
        ),
        Expanded(
          child: CustomRaisedButton(
            text: CustomLocales.getLocaleName(
                    currentLanguageKey, CustomLocales.nativeLocaleNames) ??
                "",
            height: null,
            icon: OMIcons.edit,
            iconColor: Theme.of(context).accentColor,
            textSize: 18,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            textColor: Theme.of(context).accentColor,
            borderColor: Theme.of(context).accentColor,
            upperCase: false,
            onPressed: languages != null && languages.isNotEmpty
                ? () async {
                    String languageKey = await showLanguages(context);
                    if (languageKey != null) {
                      onSave(languageKey);
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }

  Widget buildLanguages({
    BuildContext context,
  }) {
    List<Widget> languageItems = [];
    if (popularLanguageCodes != null && popularLanguageCodes.isNotEmpty) {
      languageItems.add(buildLanguageSectionTitle(
          context: context,
          title:
              S.of(context).addPostOptionalInfoLanguageSectionTitlePopulars));
      popularLanguageCodes.forEach((popularLanguageCode) {
        MapEntry<String, String> language = languages.firstWhere(
            (language) => language.key == popularLanguageCode,
            orElse: () => null);
        if (language != null) {
          languageItems.add(
            buildLanguageItem(
              context: context,
              languageKey: language.key,
              languageText: language.value,
              onTap: () => Navigator.of(context).pop(language.key),
            ),
          );
        }
      });

      languageItems.add(SizedBox(
        height: 16,
      ));
      languageItems.add(buildLanguageSectionTitle(
          context: context,
          title: S.of(context).addPostOptionalInfoLanguageSectionTitleOthers));
      languages.forEach((language) {
        if (!popularLanguageCodes.contains(language.key)) {
          languageItems.add(
            buildLanguageItem(
              context: context,
              languageKey: language.key,
              languageText: language.value,
              onTap: () => Navigator.of(context).pop(language.key),
            ),
          );
        }
      });
    } else {
      languageItems = languages
          .map(
            (language) => buildLanguageItem(
              context: context,
              languageKey: language.key,
              languageText: language.value,
              onTap: () => Navigator.of(context).pop(language.key),
            ),
          )
          .toList();
    }

    return ListView(
      children: languageItems,
    );
  }

  Widget buildLanguageSectionTitle({BuildContext context, String title}) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6.toBold(),
        ),
      ),
    );
  }

  Widget buildLanguageItem({
    BuildContext context,
    String languageKey,
    String languageText,
    VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: currentLanguageKey == languageKey
            ? Theme.of(context).accentColor.withOpacity(1)
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  languageText,
                  style: currentLanguageKey == languageKey
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1
                          .merge(TextStyle(fontSize: 20))
                          .toSemiBold()
                          .toWhite()
                      : Theme.of(context).textTheme.bodyText1,
                ),
              ),
              if (currentLanguageKey == languageKey) ...[
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
