
import 'dart:core';

class UserModel{
   String name;
   String email;
   String phone;
   String uId;
   String profile_image;
   String cover_image;
   String bio;
   bool isEmailVirefied;


   UserModel({
     this.name,
     this.email,
     this.phone,
     this.uId,
     this.profile_image,
     this. cover_image,
     this. bio,
     this.isEmailVirefied
});

   UserModel.fromJson(Map<String,dynamic>json){
     this.name=json['name'];
     this.email=json['email'];
     this.phone=json['phone'];
     this.uId =json['uId'];
     this.profile_image =json['profile_image'];
     this.cover_image =json['cover_image'];
     this.bio =json['bio'];
     this.isEmailVirefied =json['isEmailVirefied'];
   }


   Map<String,dynamic>toMap(){
     return{
       'name':name,
       'email':email,
       'phone':phone,
       'uId':uId,
       'profile_image':profile_image,
       'cover_image':cover_image,
       'bio':bio,
       'isEmailVirefied':isEmailVirefied
     };
   }
}