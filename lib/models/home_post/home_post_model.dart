class HomePostModel {
  final String profilePicture;
  final String name;
  final String userName;
  final String? postTitle;
  final String postImage;
  final int likeCount;
  final int commentCount;

  HomePostModel({
    required this.profilePicture,
    required this.name,
    required this.userName,
    this.postTitle,
    required this.postImage,
    required this.likeCount,
    required this.commentCount,
  });
}
