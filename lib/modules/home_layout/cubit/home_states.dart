
abstract class SocialStates{}

class SocialInitialState extends SocialStates{}

class ChangeButNavBarState extends SocialStates{}

class ChangeSendIconState extends SocialStates{}

class GetUserLodingState extends SocialStates{}
class GetUserSaccesseState extends SocialStates{}
class  GetUserErerrState extends SocialStates{
  final String error;
  GetUserErerrState(this.error);
}

class GetAllUserLodingState extends SocialStates{}
class GetAllUserSaccesseState extends SocialStates{}
class  GetAllUserErerrState extends SocialStates{
  final String error;
  GetAllUserErerrState(this.error);
}

class SendMessageSaccesseState extends SocialStates{}
class  SendMessageErerrState extends SocialStates{
  final String error;
  SendMessageErerrState(this.error);
}

class GetMessageSaccesseState extends SocialStates{}
class  GetMessageErerrState extends SocialStates{
  final String error;
  GetMessageErerrState(this.error);
}

class UpdateUserLodingState extends SocialStates{}
class UpdateUserSaccesseState extends SocialStates{}
class  UpdateUserErerrState extends SocialStates{
  final String error;
  UpdateUserErerrState(this.error);
}

class UploadImageLodingState extends SocialStates{}
class UploadImageSaccesseState extends SocialStates{}
class  UploadImageerrorState extends SocialStates{
  final String error;
  UploadImageerrorState(this.error);
}

class UploadPostImageLodingState extends SocialStates{}
class UploadPostImageSaccesseState extends SocialStates{}
class  UploadPostImageerrorState extends SocialStates{
  final String error;
  UploadPostImageerrorState(this.error);
}
class CreatPostLodingState extends SocialStates{}
class CreatPostSaccesseState extends SocialStates{}
class CreatPosterrorState extends SocialStates{
  final String error;
  CreatPosterrorState(this.error);
}

class GetPostLodingState extends SocialStates{}
class GetPostSaccesseState extends SocialStates{}
class GetPosterrorState extends SocialStates{
  final String error;
  GetPosterrorState(this.error);
}

class HomeLodingState extends SocialStates{}
class HomeSaccesseState extends SocialStates{}


class ChangeInProfileSaccesseState extends SocialStates{}
class HomeErerrState extends SocialStates{
  final String error;
  HomeErerrState(this.error);
}

class LikePostSaccesseState extends SocialStates{}
class LikePostErerrState extends SocialStates{
  final String error;
  LikePostErerrState(this.error);
}

class CommentInPostSaccesseState extends SocialStates{}
class CommentInPostErerrState extends SocialStates{
  final String error;
  CommentInPostErerrState(this.error);
}

class GetCommentsSaccesseState extends SocialStates{}


class ProfileImagePikedSaccesseState extends SocialStates{}
class ProfileImagePikederrorState extends SocialStates{}


class CoverImagePikedSaccesseState extends SocialStates{}
class CoverImagePikederrorState extends SocialStates{}


class PostImagePikedSaccesseState extends SocialStates{}
class PostImagePikederrorState extends SocialStates{}

class MessageImagePikedSaccesseState extends SocialStates{}
class MessageImagePikederrorState extends SocialStates{}


class RemovePostImageState extends SocialStates{}
