


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/stayles/icon_broken.dart';
import '../home_layout/cubit/home_cubit.dart';
import '../home_layout/cubit/home_states.dart';

class CreatPostScrean extends StatelessWidget {
  const CreatPostScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SocialCubit cubit=SocialCubit.get(context);
    var postText=TextEditingController();

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Creat Post',
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    if(cubit.PostImage!=null)
                      cubit.uploadePostImage(postText: postText.text);
                    else
                      cubit.CreatNewPost(postText: postText.text);
                  },
                  child: Text(
                    'Post',
                  )
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is CreatPostLodingState||state is UploadPostImageLodingState)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 10,
                    ),
                    child: LinearProgressIndicator(),
                  ),

                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:  NetworkImage(cubit.userModel.profile_image),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${cubit.userModel.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: postText,
                    decoration: InputDecoration(
                      hintText: 'Whate is in your mind ?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(cubit.PostImage!=null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image:FileImage(cubit.PostImage),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 16,
                        child: Center(
                          child: IconButton(
                            onPressed: (){
                              cubit.removePostImage();
                            },
                            icon: Icon(
                                Icons.close,
                              size: 14,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Image,
                              color: Colors.blue,
                            ),
                            TextButton(
                                onPressed: (){
                                  cubit.getPostImage();
                                },
                                child: Text(
                                  'Add Photo',
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300],
                        ),
                        child: TextButton(
                            onPressed: (){},
                            child: Text(
                              '# Add Tags',
                            )
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
