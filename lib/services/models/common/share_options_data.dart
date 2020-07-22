import 'package:ideashare/services/models/common/share_option.dart';

class ShareOptionsData {
  ShareOptionsData({
    this.title,
    this.description,
    this.shareOptions,
  });

  final String title;
  final String description;
  final List<ShareOption> shareOptions;
}