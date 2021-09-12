import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String userId, reciepeTitle, preparation, category, time, postImage;
  List<String> ingredients;
  Post(
      {this.userId,
      this.reciepeTitle,
      this.preparation,
      this.category,
      this.time,
      this.postImage,
      this.ingredients});

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      userId: doc['UserId'],
      reciepeTitle: doc['RecipeTitle'],
      preparation: doc["Preparation"],
      category: doc["Category"],
      time: doc["Category"],
      postImage: doc["PostImage"],
      ingredients: doc["Ingredients"],
    );
  }
}
