import 'package:ideashare/constants/constants.dart';

class ShareOption<T> {
  ShareOption({
    this.id,
    this.title,
    this.description,
    this.boolValue,
    this.visiblenessOptions,
    this.visiblenessValue,
    this.onTap,
  });

  final String id;
  final String title;
  final String description;
  final bool boolValue;
  final List<Visibleness> visiblenessOptions;
  final Visibleness visiblenessValue;
  final void Function(T) onTap;
}
