
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/comment_model.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';

import '../../shared/stayles/icon_broken.dart';

class CommentsScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit=SocialCubit.get(context);
    var commentController=TextEditingController();


    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Comments',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => commentItem(context,SocialCubit.get(context).comments[index]),
                  separatorBuilder:(context, index) =>  Container(
                    height: 15,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  itemCount:SocialCubit.get(context).comments.length,
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey[100],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundImage:  NetworkImage('${SocialCubit.get(context).userModel.profile_image}'),
                  ),
                  SizedBox(width: 10,),
                  Expanded(

                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          onChanged: (value) =>commentController.text.length==0?cubit.changeSendIcon(true):cubit.changeSendIcon(false),
                          controller: commentController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                            hintText: '  Write a comment...',

                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                      onPressed: (){
                        SocialCubit.get(context).commentInPost( commentController.text);
                        commentController.text='';
                      },
                      icon: Icon(
                        IconBroken.Send,
                        color: cubit.emptyComment? Colors.grey:Colors.blue,
                      ),
                  )
                ],
              ),
            ),
           
          ],
        ),
        

      ),

    );

  }

  Widget commentItem(context,CommentModel model){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:  NetworkImage('${model.profile_image}'),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                       SizedBox(height: 5,),

                        Text(
                          '${model.commentText}',
                          style: Theme.of(context).textTheme.subtitle1,

                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
