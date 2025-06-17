import 'package:themikg/models/comment_model/comment_model.dart';

class ReelModel {
  final String videoUrl;
  final String name; //user full name
  final String userName;
  final String userProfile; //user Profile
  final int likes;
  final int comments;
  List<CommentModel> commentList;

  ReelModel({
    required this.videoUrl,
    required this.name,
    required this.userName,
    required this.userProfile,
    required this.likes,
    required this.comments,
    this.commentList=const[]
  });
}

