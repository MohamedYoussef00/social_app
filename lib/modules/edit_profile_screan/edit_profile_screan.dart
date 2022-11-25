



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';

import '../../shared/stayles/icon_broken.dart';

class EditProfileScrean extends StatelessWidget {
  const EditProfileScrean({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var profileNameController =TextEditingController();
    var bioController =TextEditingController();
    SocialCubit cubit =SocialCubit.get(context);


    profileNameController.text =cubit.userModel.name;
    bioController.text =cubit.userModel.bio;

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is UpdateUserLodingState||state is UploadImageLodingState)
                    LinearProgressIndicator(),
                  if(state is UpdateUserLodingState||state is UploadImageLodingState)
                    SizedBox(height: 10,),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: 230,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children:[
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight:Radius.circular(5) ,
                                  ),
                                  image: DecorationImage(
                                    image:cubit.CoverImage==null? NetworkImage(cubit.userModel.cover_image):FileImage(cubit.CoverImage),
                                    //image: NetworkImage('https://img.freepik.com/free-photo/joyful-ethnic-woman-points-both-index-fingers-gun-pistols_273609-40721.jpg'),
                                    fit: BoxFit.cover,
                                  )
                                ),


                              ),
                              CircleAvatar(
                                child: Center(
                                  child: IconButton(
                                      onPressed: (){
                                        SocialCubit.get(context).getCoverImage();
                                      },
                                      icon: Icon(IconBroken.Camera),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
                              child: CircleAvatar(
                                radius: 60,
                               backgroundImage:cubit.profileImage==null? NetworkImage(cubit.userModel.profile_image):FileImage(cubit.profileImage),
                               // backgroundImage:  NetworkImage('https://img.freepik.com/free-photo/photo-puzzled-unshaven-man-points-sideways-crosses-arms-chest-doubts-two-choices-variants-has-bewildered-look-wears-spectacles-rosy-sweater-isolated-yellow-wall_273609-42220.jpg'),
                              ),
                            ),
                            CircleAvatar(

                              child: Center(
                                child: IconButton(
                                  onPressed: (){
                                    cubit.getProfileImage();
                                  },
                                  icon: Icon(IconBroken.Camera),

                                ),
                              ),

                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //'${cubit.userModel.name}',
                        profileNameController.text==null?'${cubit.userModel.name}':profileNameController.text,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            cubit.pushLisenner(numberPushed: 1,);
                          },
                          icon: Icon(IconBroken.Edit),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //'${cubit.userModel.bio}',
                        bioController.text==null?'${cubit.userModel.bio}':bioController.text,
                        style:Theme.of(context).textTheme.caption,
                      ),
                      IconButton(
                        onPressed: (){
                          cubit.pushLisenner(numberPushed: 2,);
                        },
                        icon: Icon(IconBroken.Edit),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  SizedBox(height: 30,),

                  if(SocialCubit.get(context).num==1)
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                              controller: profileNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Profile Name',
                                prefixIcon: Icon(IconBroken.Profile),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.done),
                                  onPressed: () {
                                    cubit.pushLisenner(numberPushed: 0) ;
                                    ;
                                  },

                                ),

                              )
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  if(SocialCubit.get(context).num==2)
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                              controller: bioController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Bio',
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.done),
                                    onPressed: () {
                                      cubit.pushLisenner(numberPushed: 0) ;
                                    },)
                              )
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    //SocialCubit.get(context).changeInProName(),
                 SizedBox(height: 40,),
                  
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: (){
                            cubit.profile_nameUpdate=profileNameController.text;
                            cubit.bioUpdate=bioController.text;
                            cubit.submitUpdat();
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey[400],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Submit Changes',
                                style:TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                      ),


                    ],
                  ),
                 

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
