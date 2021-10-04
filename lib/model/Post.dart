import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String userId, reciepeTitle, preparation, category, time, postImage;
  Timestamp timeStamp;
  List<dynamic> ingredients;
  List<dynamic> userIds;
  Post(
      {this.userId,
      this.reciepeTitle,
      this.preparation,
      this.category,
      this.time,
      this.postImage,
      this.ingredients,
      this.timeStamp,
      this.userIds});

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
        userId: doc['UserId'],
        reciepeTitle: doc['RecipeTitle'],
        preparation: doc["Preparation"],
        category: doc["Category"],
        time: doc["Time"],
        postImage: doc["PostImage"],
        ingredients: doc["Indredients"],
        timeStamp: doc['TimeStamp'],
        userIds: doc['UserIds']);
  }
}
