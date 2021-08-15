import 'package:flutter/material.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';

class HelpListItem extends StatefulWidget {
  const HelpListItem({
    Key key,
    @required this.help,
  }) : super(key: key);

  final PostHelp help;

  @override
  _HelpListItemState createState() => _HelpListItemState();
}

class _HelpListItemState extends State<HelpListItem> {
  PostHelp get help => widget.help;

  bool _showResume = false;

  int get resumeMaxLines => _showResume
      ? 100
      : help.info.images != null && help.info.images.isNotEmpty ? 5 : 10;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
}
