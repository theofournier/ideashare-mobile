import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/common_widgets.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';

class NoteListItem extends StatefulWidget {
  const NoteListItem({
    Key key,
    this.isOwner,
    this.note,
    this.onDelete,
    this.onTap,
  }) : super(key: key);

  final bool isOwner;
  final PostNote note;
  final Future<bool> Function() onDelete;
  final VoidCallback onTap;

  @override
  _NoteListItemState createState() => _NoteListItemState();
}

class _NoteListItemState extends State<NoteListItem> {
  bool _isLoadingDelete = false;

  Future<void> onDeleteItem() async {
    setState(() {
      _isLoadingDelete = true;
    });
    await widget.onDelete();
    setState(() {
      _isLoadingDelete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _isLoadingDelete,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          clipBehavior: Clip.hardEdge,
          key: widget.key,
          color: Colors.white,
          elevation: 1.5,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isLoadingDelete) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 1.5,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextDateAgo(
                        date: widget.note.docTime.updatedAt ??
                            widget.note.docTime.createdAt,
                        completeDate: true,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    iconSize: 22,
                    onPressed: !widget.isOwner || _isLoadingDelete
                        ? null
                        : onDeleteItem,
                    disabledColor: !widget.isOwner ? Colors.transparent : null,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 16,
                ),
                child: Text(
                  widget.note.text,
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
