
import 'dart:core';

class PostModel{
  String name;
  String uId;
  String profile_image;
  String dateTime;
  String postText;
  String postImage;



  PostModel({
    this.name,
    this.uId,
    this.profile_image,
    this.dateTime,
    this.postText,
    this.postImage
  });

  PostModel.fromJson(Map<String,dynamic>json){
    this.name=json['name'];
    this.uId =json['uId'];
    this.profile_image =json['profile_image'];
    this.dateTime =json['dateTime'];
    this.postText =json['postText'];
    this.postImage =json['postImage'];
  }


  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'uId':uId,
      'profile_image':profile_image,
      'dateTime':dateTime,
      'postText':postText,
      'postImage':postImage
    };
  }
}