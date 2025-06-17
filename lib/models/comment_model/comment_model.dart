class CommentModel {
  final String profileImage;
  final String userName;
  final String name;
  final String comment;
  final int likeCount;
  DateTime commentTime;

  CommentModel({
    required this.profileImage,
    required this.userName,
    required this.name,
    required this.comment,
    required this.likeCount,
    required this.commentTime,
  });
}
