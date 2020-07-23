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
  title: "Name were we at hope",
  resume: "Remainder household direction zealously the unwilling bed sex. Lose and gay ham sake met that. Stood her place one ten spoke yet. Head case knew ever set why over. Marianne returned of peculiar replying in moderate. Roused get enable garret estate old county. Entreaties you devonshire law dissimilar terminated.",
  description: "See resolved goodness felicity shy civility domestic had but. Drawings offended yet answered jennings perceive laughing six did far.\nAm increasing at contrasted in favourable he considered astonished. As if made held in an shot. By it enough to valley desire do.\nMrs chief great maids these which are ham match she.",
  language: "en",
  urlLinks: ["https://facebook.com", "https://google.com"],
  linkedIssue: "issue1",
);

List<PostLabel> postLabelsExample = [
  PostLabel(id: "app", title: "App"),
  PostLabel(id: "mobile", title: "Mobile"),
  PostLabel(id: "web", title: "Web"),
];

PostNote postNoteExample = PostNote(text: "Admitted add peculiar get joy doubtful.\nAt ourselves direction believing do he departure.");

List<File> imagesExample = [
  File(
      "/data/user/0/com.theofournier.ideashare.dev/cache/image_cropper_1595437779487.jpg"),
  File(
      "/data/user/0/com.theofournier.ideashare.dev/cache/image_cropper_1595437807491.jpg"),
];

Post linkedIssueExample;