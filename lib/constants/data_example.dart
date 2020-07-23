import 'dart:io';

import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';

Post postExample = Post(
  category: PostType.idea,
  info: postInfoExample,
  labels: postLabelsExample,
);

PostInfo postInfoExample = PostInfo(
  title: "Title",
  resume: "Resume\nResume",
  description: "Description\nDescription\nDescription\nDescription",
  language: "en",
  urlLinks: ["https://facebook.com", "https://google.com"],
  linkedIssue: "issue1",
);

List<PostLabel> postLabelsExample = [
  PostLabel(id: "app", title: "App"),
  PostLabel(id: "mobile", title: "Mobile"),
  PostLabel(id: "web", title: "Web"),
];

PostNote postNoteExample = PostNote(text: "Note\nNote");

List<File> imagesExample = [
  File(
      "/data/user/0/com.theofournier.ideashare.dev/cache/image_cropper_1595437779487.jpg"),
  File(
      "/data/user/0/com.theofournier.ideashare.dev/cache/image_cropper_1595437807491.jpg"),
];

Post linkedIssueExample;