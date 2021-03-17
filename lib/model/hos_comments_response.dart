
// import 'package:tis/model/hos_comments.dart';

// class HosCommentsResponse {
//   final List<CommentsModel> comments;
//   final String error;

//   HosCommentsResponse(this.comments, this.error);

//   HosCommentsResponse.fromJson(List<dynamic> cmts)
//   : comments = cmts.map((e) => CommentsModel.fromJson(e)).toList(),
//     error = "";

//   HosCommentsResponse.withError(String errorValue)
//       : comments = List(),
//         error = errorValue;

// }

import 'package:tis/model/hos_comments.dart';

class HosCommentsResponse {
  final List<CommentsModel> comments;
  final String error;

  HosCommentsResponse(this.comments, this.error);

  HosCommentsResponse.fromJson(List<dynamic> cmt)
      : comments = cmt.map((e) => CommentsModel.fromJson(e)).toList(),
        error = "";

  HosCommentsResponse.withError(String errorValue)
      : comments = List(),
        error = errorValue;

}