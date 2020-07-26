import 'package:flutter/material.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class AlertDialogListTileData<T> {
  AlertDialogListTileData({
    this.title,
    this.icon,
    this.value,
  });

  final String title;
  final IconData icon;
  final T value;
}

class AlertDialogListTile extends StatelessWidget {
  AlertDialogListTile({
    this.listTiles,
  });

  final List<AlertDialogListTileData> listTiles;

  Future<T> show<T>(BuildContext context) async {
    return await showDialog<T>(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: listTiles
            .map((data) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  title: Text(data.title, style: Theme.of(context).textTheme.bodyText1.toMedium(),),
                  leading: Icon(data.icon, color: Theme.of(context).accentColor, size: 28,),
                  onTap: () => Navigator.of(context).pop(data.value),
                ))
            .toList(),
      ),
    );
  }
}
