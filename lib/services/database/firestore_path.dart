class FirestorePath {
  static String user(String uid) => 'users/$uid';
  static String userSettings(String uid) => 'usersSettings/$uid';
  static String defaultPictures() => 'defaultPictures';
  static String labels() => 'labels';
  static String posts() => 'posts';
  static String post(String postId) => 'posts/$postId';
  static String postNotes(String postId) => 'posts/$postId/notes';
  static String postNote(String postId, String noteId) => 'posts/$postId/notes/$noteId';
  static String postStatus(String postId) => 'postStatus/$postId';
  static String postComments(String postId) => 'posts/$postId/comments';
  static String postComment(String postId, String commentId) => 'posts/$postId/comments/$commentId';
  static String postHelps(String postId) => 'posts/$postId/helps';
  static String postHelp(String postId, String helpId) => 'posts/$postId/helps/$helpId';

}