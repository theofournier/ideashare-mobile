class ImageName {
  static final String dir = "assets/images/";

  static final logo = dir + "logo.png";
  static final logoBlue = dir + "logo_blue.png";
  static final logoWhite = dir + "logo_white.png";
  static final signIn = dir + "sign_in_image.png";
  static final signUp = dir + "sign_up_image.png";
  static final forgotPassword = dir + "forgot_password_image.png";
  static final selectPicture = dir + "select_picture_image.png";
  static final googleLogo = dir + "google_logo.png";
  static final facebookLogo = dir + "facebook_logo.png";
  static final addPostStart = dir + "add_post_start.png";
  static final addPostLinkedIssue = dir + "add_post_linked_issue.png";
  static final addPostLabels = dir + "add_post_labels.png";
  static final addPostSaveLoading = dir + "add_post_save_loading.png";
}

class StorageKeys {
  static final defaultPictures = "default-pictures";
  static final userPictures = "user-pictures";
  static final postImages = "post-images";
}

class AlertKeys {
  static const String alertDefault = 'alertDefault';
  static const String alertCancel = 'alertCancel';
}

enum PostType {
  idea,
  issue,
}

enum UserRole {
  user,
  admin,
}

enum Privacy {
  public,
  private,
}

enum Visibleness {
  everyone,
  follow,
  approval,
  work,
  none,
}

enum NotificationMethod {
  push,
  email,
}

enum NotificationType {
  postNew,
  postLike,
  postFollow,
  postWork,
  postWorkApproval,
  postWorkApproved,
  postWorkDisapproved,
  commentNew,
  commentLike,
  helpNew,
  helpLike,
  helpCommentNew,
  helpCommentLike,
  helpApproval,
  helpApproved,
  helpDisapproved,
  newsNew,
  newsLike,
  newsCommentNew,
  linkedPostNew,
  linkedPostApproval,
  linkedPostApproved,
  linkedPostDisapproved,
  userFollow,
}

enum ApprovalType {
  work,
  help,
  linkedPost,
}

enum PostStatusType {
  open,
  ongoing,
  completed,
}
