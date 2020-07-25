class FirestorePath {
  static String user(String uid) => 'users/$uid';
  static String userSettings(String uid) => 'usersSettings/$uid';
  static String defaultPictures() => 'defaultPictures';
  static String labels() => 'labels';
  static String posts() => 'posts';
  static String post(String postId) => 'posts/$postId';
  static String postNotes(String postId) => 'posts/$postId/notes';
  static String postStatus(String postId) => 'postStatus/$postId';

}