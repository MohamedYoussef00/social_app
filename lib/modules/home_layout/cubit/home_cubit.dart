






import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/comment_model.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chat_screan/chat_screan.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';
import 'package:social_app/modules/setting_screan/setting_screan.dart';
import 'package:social_app/modules/users_screan/users_screan.dart';

import '../../../models/post_model.dart';
import '../../../shared/conestantes/conestantes.dart';
import '../../../shared/stayles/icon_broken.dart';
import '../../news_feed_screan/news_feed_screan.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screans = [
    NewsFeedScrean(),
    ChatScrean(),
    UsersScrean(),
    SettingScrean()
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeButNavBarState());
  }

  bool emptyComment=true;
  void changeSendIcon(bool value) {
    emptyComment = value;
    emit(ChangeSendIconState());
  }

  UserModel userModel;
  void getUserData() {
    emit(GetUserLodingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      print(userModel.cover_image);
      print('ggggggggggggggggggggggggggggggggggggggggggggg');
      emit(GetUserSaccesseState());
    }).catchError((error) {
      emit(GetUserErerrState(error.toString()));
    });
  }
  ///////////////////////////////////////////////////////////////////////


  String profileImageURL='';
  String CoverImageURL='';
  bool updata=false;

  void submitUpdat({
    @required String name,
    @required String bio,
}){
    if(profileImage!=null){
      uploadeImage(imagePath: profileImage,num: 1);
    }
    if(CoverImage!=null){
      uploadeImage(imagePath: CoverImage,num: 2);
    }
    if(CoverImage==null&&profileImage==null)
      updateUserData();
  }

  String profile_nameUpdate='';
  String bioUpdate='';
  void updateUserData() {
    UserModel userupdateModel=UserModel(
      name: profile_nameUpdate,
      email: userModel.email,
      phone: userModel.phone,
      bio: bioUpdate,
      cover_image:CoverImageURL.length==0?userModel.cover_image : CoverImageURL ,
      profile_image:profileImageURL.length==0?userModel.profile_image : profileImageURL ,
      uId: uId,
      isEmailVirefied: false,
    );
    emit(UpdateUserLodingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId).update(userupdateModel.toMap())
        .then((value) {
          getUserData();
    }).catchError((error) {
      emit(UpdateUserErerrState(error.toString()));
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////

  void uploadeImage({
  @required File imagePath,
    int num
}){
    emit(UploadImageLodingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imagePath.path).pathSegments.last}')
        .putFile(imagePath)
        .then((value){
          value.ref.getDownloadURL().then((value) {
            if(num==1)
              profileImageURL=value;
            else if(num==2)
              CoverImageURL=value;
            emit(UploadImageSaccesseState());
            updateUserData();
          }).catchError((error){
            emit(UploadImageerrorState(error));
          });
    } ).catchError((error){
      emit(UploadImageerrorState(error));
    });
  }

  /////////////////////////////////////////////////////////////////////////////////////////
  int num = 0;
  void pushLisenner({
    int numberPushed,
  }) {
    num = numberPushed;
    emit(ChangeInProfileSaccesseState());
  }

/////////////////////////////////////////////////////////////////////////////
  File profileImage;
  var piker =ImagePicker();
  Future getProfileImage()async{
    final pikedFile =await piker.getImage(source: ImageSource.gallery);
    if(pikedFile !=null){
      profileImage=File( pikedFile.path);
      emit(ProfileImagePikedSaccesseState());
    }else{
      print('No Image Selected');
      emit(ProfileImagePikederrorState());
    }
  }

  File CoverImage;
  Future getCoverImage()async{
    final pikedFile =await piker.getImage(source: ImageSource.gallery);
    if(pikedFile !=null){
      CoverImage=File( pikedFile.path);
      emit(CoverImagePikedSaccesseState());
    }else{
      print('No Image Selected');
      emit(CoverImagePikederrorState());
    }
  }

  File PostImage;
  Future getPostImage()async{
    final pikedFile =await piker.getImage(source: ImageSource.gallery);
    if(pikedFile !=null){
      PostImage=File( pikedFile.path);
      emit(PostImagePikedSaccesseState());
    }else{
      print('No Image Selected');
      emit(PostImagePikederrorState());
    }
  }

  File messageImage;
  Future getMessageImage()async{
    final pikedFile =await piker.getImage(source: ImageSource.gallery);
    if(pikedFile !=null){
      messageImage=File( pikedFile.path);
      emit(MessageImagePikedSaccesseState());
    }else{
      print('No Image Selected');
      emit(MessageImagePikederrorState());
    }
  }

  String postImageURL;
  void uploadePostImage({
    @required String postText,
  }){
    emit(UploadPostImageLodingState());
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(PostImage.path).pathSegments.last}')
        .putFile(PostImage)
        .then((value){
      value.ref.getDownloadURL().then((value) {
          postImageURL=value;
        emit(UploadPostImageSaccesseState());
          CreatNewPost(postText: postText);
      }).catchError((error){
        emit(UploadPostImageerrorState(error));
      });
    } ).catchError((error){
      emit(UploadPostImageerrorState(error));
    });
  }


  void CreatNewPost({
    @required String postText,
  }){
    emit(CreatPostLodingState());
    PostModel postdata=PostModel(
      name: userModel.name,
      uId: userModel.uId,
      profile_image: userModel.profile_image,
      dateTime: DateTime.now().toString(),
      postImage: postImageURL,
      postText: postText,
    );
    FirebaseFirestore
        .instance
        .collection('posts')
        .add(postdata.toMap())
        .then((value) {
      emit(CreatPostSaccesseState());
    }).catchError((error){
      emit(CreatPosterrorState(error.toString()));
    });
  }


  void removePostImage(){
    PostImage=null;
    postImageURL=null;
    emit(RemovePostImageState());
  }

  List<UserModel>allUsers=[];

  void getAllUsers(){
    allUsers=[];
      emit(GetAllUserLodingState());
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['uId']!=uId)
            allUsers.add(UserModel.fromJson(element.data()));
        });
        print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
        emit(GetAllUserSaccesseState());
      }).catchError((error) {
        emit(GetAllUserErerrState(error.toString()));
      });


  }

  List<PostModel> posts=[];
  List<String> postsId=[];
  List<int>postsLikesNum=[];
  List<int>postsCommentNum=[];
  void getPosts(){
    posts=[];
    postsId=[];
    postsLikesNum=[];
    postsCommentNum=[];

    emit(GetPostLodingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            element.reference.collection('likes')
                .get()
                .then((value) {
                  postsLikesNum.add(value.docs.length);
                 // postsCommentNum.add(value),
                  element.reference.collection('comments').get().then((value) {
                    postsCommentNum.add(value.docs.length);
                    postsId.add(element.id);
                    posts.add(PostModel.fromJson(element.data()));
                    print('ttttttttttttttttttttttttttttttttttttttttttttttt');
                    emit(GetPostSaccesseState());
                  });

                }).catchError((error){
              emit(GetPosterrorState(error.toString()));
            });
          });
        }).catchError((error) {
          emit(GetPosterrorState(error.toString()));
        });
  }

  String postCommentId ='';

  void commentInPost( String CommentText){
    print(postCommentId);
    print(CommentText);
    CommentModel model=CommentModel(
      name: userModel.name,
      profile_image: userModel.profile_image,
      commentText: CommentText,
      uId: userModel.uId,
      dateTime: DateTime.now().toString(),
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postCommentId)
        .collection('comments')
        .add( model.toMap())
        .then((value) {
      emit(CommentInPostSaccesseState());
    }).catchError((error){
      emit(CommentInPostErerrState(error.toString()));
    });
  }


  List<CommentModel> comments=[];

  void getComments(){
    print(postCommentId);
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postCommentId)
        .collection('comments')
        .snapshots()
        .listen((event) {
          comments=[];
          event.docs.forEach((element) { 
            comments.add(CommentModel.fromJson(element.data()));
          });
          emit(GetCommentsSaccesseState());
    });
  }

  void likePost(String postId){
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc('${userModel.uId}')
        .set({
      'like':true
        }).then((value) {
      emit(LikePostSaccesseState());
    }).catchError((error){
      emit(LikePostErerrState(error.toString()));
    });
  }
  void SendMessage({
    String messageText,
    String receiverId,
}){
    print(postCommentId);
    MessageModel model=MessageModel(
      messageText: messageText,
      receiverId: receiverId,
      senderId: userModel.uId,
      image: 'https://img.freepik.com/free-photo/young-man-pointing-different-side-with-crossed-arms-shirt-sleeveless-jacket-looking-grateful-front-view_176474-58109.jpg',
      dateTime: DateTime.now().toString(),
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add( model.toMap())
        .then((value) {
          emit(SendMessageSaccesseState());
        }).catchError((error){
          emit(SendMessageErerrState(error.toString()));
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add( model.toMap())
        .then((value) {
      emit(SendMessageSaccesseState());
    }).catchError((error){
      emit(SendMessageErerrState(error.toString()));
    });
  }

  List<MessageModel>messages=[];

  void getMessages({
    String receiverId,
  }){
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
          messages=[];
          event.docs.forEach((element) {
            messages.add(MessageModel.fromJson(element.data()));
          });
          emit(GetMessageSaccesseState());
    });


  }



}


