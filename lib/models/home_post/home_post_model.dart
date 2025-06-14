class HomePostModel {
  final String profilePicture;
  final String name;
  final String userName;
  final String? postTitle;
  final String postImage;
  final String likeCount;
  final String commentCount;

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
