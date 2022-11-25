

import 'dart:core';

class CommentModel{
  String name;
  String uId;
  String profile_image;
  String dateTime;
  String commentText;



  CommentModel({
    this.name,
    this.uId,
    this.profile_image,
    this.dateTime,
    this.commentText,
  });

  CommentModel.fromJson(Map<String,dynamic>json){
    this.name=json['name'];
    this.uId =json['uId'];
    this.profile_image =json['profile_image'];
    this.dateTime =json['dateTime'];
    this.commentText =json['commentText'];
  }


  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'uId':uId,
      'profile_image':profile_image,
      'dateTime':dateTime,
      'commentText':commentText,
    };
  }
}