import 'package:cloud_firestore/cloud_firestore.dart';

class Userapp {
  final String userName, userProfileImage, userId, userBio;
  Userapp({
    this.userId,
    this.userName,
    this.userBio,
    this.userProfileImage,
  });

  factory Userapp.fromDocument(DocumentSnapshot doc) {
    return Userapp(
        userId: doc['UserId'],
        userName: doc['UserName'],
        userProfileImage: doc["ProfileImage"],
        userBio: doc["UserBio"]);
  }
}
