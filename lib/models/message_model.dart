

import 'dart:core';

class MessageModel{
  String senderId;
  String receiverId;
  String messageText;
  String dateTime;
  String image;



  MessageModel({
    this.senderId,
    this.receiverId,
    this.messageText,
    this.dateTime,
    this.image
  });

  MessageModel.fromJson(Map<String,dynamic>json){
    this.senderId=json['senderId'];
    this.receiverId=json['receiverId'];
    this.messageText=json['messageText'];
    this.dateTime =json['dateTime'];
    this.image =json['image'];
  }


  Map<String,dynamic>toMap(){
    return{
      'senderId':senderId,
      'receiverId':receiverId,
      'messageText':messageText,
      'dateTime':dateTime,
      'image':image,
    };
  }
}