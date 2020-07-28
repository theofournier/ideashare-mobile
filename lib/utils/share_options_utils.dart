import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/services/models/common/share_option.dart';
import 'package:ideashare/services/models/common/share_options_data.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';

class ShareOptionsUtils {
  static Map<Visibleness, String> getVisiblenessTitle = {
        Visibleness.everyone: S.current.visiblenessEveryone,
        Visibleness.approval: S.current.visiblenessApproval,
        Visibleness.follow: S.current.visiblenessFollow,
        Visibleness.work: S.current.visiblenessWork,
        Visibleness.none: S.current.visiblenessNone,
      };

  static List<ShareOptionsData> getShareOptions({
    PostShareOptions postShareOptions,
    VoidCallback onUpdate,
    PostType category,
  }) =>
      [
        ShareOptionsData(
          shareOptions: [
            ShareOption<bool>(
              id: "private",
              title: S.current.shareOptionPrivate,
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
              title: S.current.shareOptionsAnonymous,
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
          title: S.current.shareOptionsAllowActions,
          description: "Description",
          shareOptions: [
            ShareOption<Visibleness>(
              id: "like",
              title: S.current.shareOptionsLike,
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
              title: S.current.shareOptionsFollow,
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
              title: S.current.shareOptionsWork,
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
              title: S.current.shareOptionsContact,
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
              title: S.current.shareOptionsComment,
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
              title: S.current.shareOptionsHelp,
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
                title: S.current.shareOptionsLinkedPost,
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
          title: S.current.shareOptionsSee,
          description: "Description",
          shareOptions: [
            ShareOption<Visibleness>(
              id: "comment",
              title: S.current.shareOptionsComment,
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
              title: S.current.shareOptionsHelp,
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
              title: S.current.shareOptionsNews,
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
                title: S.current.shareOptionsLinkedPost,
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
              title: S.current.shareOptionsStatus,
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
