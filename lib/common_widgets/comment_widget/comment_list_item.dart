import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/common_widgets.dart';
import 'package:ideashare/common_widgets/user_widgets/user_avatar_name.dart';
import 'package:ideashare/common_widgets/util_widgets/action_button.dart';
import 'package:ideashare/services/models/comment/comment.dart';

class CommentListItem extends StatefulWidget {
  CommentListItem({
    Key key,
    this.isOwner = false,
    this.comment,
    this.onDelete,
  }) : super(key: key);

  final bool isOwner;
  final Comment comment;
  final Future<bool> Function() onDelete;

  @override
  _CommentListItemState createState() => _CommentListItemState();
}

class _CommentListItemState extends State<CommentListItem> {
  bool _isLoadingDelete = false;
  bool _showComment = false;

  int get commentMaxLines => _showComment ? 100 : 5;

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
      child: Card(
        clipBehavior: Clip.hardEdge,
        key: widget.key,
        color: Colors.white,
        elevation: 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: UserAvatarName(
                    key: widget.key,
                    enableTap: !_isLoadingDelete,
                    userId: widget.comment.ownerInfo.userId,
                    displayName: widget.comment.ownerInfo.displayName,
                    photoUrl: widget.comment.ownerInfo.photoUrl,
                    textSize: 14,
                    photoSize: 14,
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextDateAgo(
                      date: widget.comment.docTime.createdAt,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      iconSize: 22,
                      onPressed: !widget.isOwner || _isLoadingDelete
                          ? null
                          : onDeleteItem,
                      disabledColor: !widget.isOwner
                          ? Colors.transparent
                          : null,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () => setState(() {
                  this._showComment = !this._showComment;
                }),
                child: Text(
                  widget.comment.text,
                  maxLines: commentMaxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ActionButton.like(
              text: widget.comment.counts.likes.toString(),
              selected: false,
              onPressed: () => print("COMMENT LIKED"),
            ),
          ],
        ),
      ),
    );
  }
}
