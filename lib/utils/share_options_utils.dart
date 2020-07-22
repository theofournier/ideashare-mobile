import 'package:flutter/cupertino.dart';
import 'package:ideashare/common_widgets/share_options_widget.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/services/models/common/share_option.dart';
import 'package:ideashare/services/models/common/share_options_data.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';

class ShareOptionsUtils {
  static Map<Visibleness, String> getVisiblenessTitle(BuildContext context) => {
        Visibleness.everyone: S.of(context).visiblenessEveryone,
        Visibleness.approval: S.of(context).visiblenessApproval,
        Visibleness.follow: S.of(context).visiblenessFollow,
        Visibleness.work: S.of(context).visiblenessWork,
        Visibleness.none: S.of(context).visiblenessNone,
      };

  static List<ShareOptionsData> getShareOptions({
    BuildContext context,
    PostShareOptions postShareOptions,
    VoidCallback onUpdate,
    PostType category,
  }) =>
      [
        ShareOptionsData(
          shareOptions: [
            ShareOption<bool>(
              id: "private",
              title: S.of(context).shareOptionPrivate,
              description: "Description",
              boolValue: postShareOptions.privacy != null &&
                  postShareOptions.privacy == Privacy.private,
              onTap: (value) {
                postShareOptions.privacy =
                    value ? Privacy.private : Privacy.public;
                onUpdate();
              },
            ),
            ShareOption<bool>(
              id: "anonymous",
              title: S.of(context).shareOptionsAnonymous,
              description: "Description",
              boolValue: postShareOptions.anonymous != null &&
                  postShareOptions.anonymous,
              onTap: (value) {
                postShareOptions.anonymous = value == true;
                onUpdate();
              },
            ),
          ],
        ),
        ShareOptionsData(
          title: S.of(context).shareOptionsAllowActions,
          description: "Description",
          shareOptions: [
            ShareOption<Visibleness>(
              id: "like",
              title: S.of(context).shareOptionsLike,
              description: "Description",
              visiblenessValue: postShareOptions.like,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.like = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "follow",
              title: S.of(context).shareOptionsFollow,
              description: "Description",
              visiblenessValue: postShareOptions.follow,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.follow = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "work",
              title: S.of(context).shareOptionsWork,
              description: "Description",
              visiblenessValue: postShareOptions.work,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.approval,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.work = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "contact",
              title: S.of(context).shareOptionsContact,
              description: "Description",
              visiblenessValue: postShareOptions.contact,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.contact = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "createComment",
              title: S.of(context).shareOptionsComment,
              description: "Description",
              visiblenessValue: postShareOptions.createComment,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.createComment = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "createHelp",
              title: S.of(context).shareOptionsHelp,
              description: "Description",
              visiblenessValue: postShareOptions.createHelp,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.work,
                Visibleness.approval,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.createHelp = value;
                onUpdate();
              },
            ),
            if (category != null && category == PostType.issue) ...[
              ShareOption<Visibleness>(
                id: "createLinkedPost",
                title: S.of(context).shareOptionsLinkedPost,
                description: "Description",
                visiblenessValue: postShareOptions.createLinkedPost,
                visiblenessOptions: [
                  Visibleness.everyone,
                  Visibleness.work,
                  Visibleness.approval,
                  Visibleness.none,
                ],
                onTap: (value) {
                  postShareOptions.createLinkedPost = value;
                  onUpdate();
                },
              ),
            ]
          ],
        ),
        ShareOptionsData(
          title: S.of(context).shareOptionsSee,
          description: "Description",
          shareOptions: [
            ShareOption<Visibleness>(
              id: "comment",
              title: S.of(context).shareOptionsComment,
              description: "Description",
              visiblenessValue: postShareOptions.comment,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.follow,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.comment = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "help",
              title: S.of(context).shareOptionsHelp,
              description: "Description",
              visiblenessValue: postShareOptions.help,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.follow,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.help = value;
                onUpdate();
              },
            ),
            ShareOption<Visibleness>(
              id: "news",
              title: S.of(context).shareOptionsNews,
              description: "Description",
              visiblenessValue: postShareOptions.news,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.follow,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.news = value;
                onUpdate();
              },
            ),
            if (category != null && category == PostType.issue) ...[
              ShareOption<Visibleness>(
                id: "linkedPosts",
                title: S.of(context).shareOptionsLinkedPost,
                description: "Description",
                visiblenessValue: postShareOptions.linkedPosts,
                visiblenessOptions: [
                  Visibleness.everyone,
                  Visibleness.follow,
                  Visibleness.work,
                  Visibleness.none,
                ],
                onTap: (value) {
                  postShareOptions.linkedPosts = value;
                  onUpdate();
                },
              ),
            ],
            ShareOption<Visibleness>(
              id: "status",
              title: S.of(context).shareOptionsStatus,
              description: "Description",
              visiblenessValue: postShareOptions.status,
              visiblenessOptions: [
                Visibleness.everyone,
                Visibleness.follow,
                Visibleness.work,
                Visibleness.none,
              ],
              onTap: (value) {
                postShareOptions.status = value;
                onUpdate();
              },
            ),
          ],
        ),
      ];
}
