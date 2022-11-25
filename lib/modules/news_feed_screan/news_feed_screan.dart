

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/news_feed_screan/comments_scraen.dart';
import 'package:social_app/shared/components/components.dart';

import 'package:social_app/shared/stayles/icon_broken.dart';

import '../../models/post_model.dart';
import '../home_layout/cubit/home_cubit.dart';
import '../home_layout/cubit/home_states.dart';

class NewsFeedScrean extends StatelessWidget {
  const NewsFeedScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit=SocialCubit.get(context);
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:cubit.posts.length>0,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage('https://img.freepik.com/free-photo/joyful-ethnic-woman-points-both-index-fingers-gun-pistols_273609-40721.jpg'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Container(
                          child: Text(
                              'Comunicate with your Frindes',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context,cubit.posts[index],index),
                    separatorBuilder:(context, index) =>  Container(
                      height: 8,
                    ),
                    itemCount: cubit.posts.length
                ),
                SizedBox(height: 8,),
              ],
            ),
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );


  }
  Widget buildPostItem(BuildContext context,PostModel model,int index){
    return Card(
      elevation: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:  NetworkImage('${model.profile_image}'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model.name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(width: 5,),
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          height: 1.3
                      ),

                    )
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(

                '${model.postText}',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  height: 1.5,
                ),

              ),
            ),
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end:5),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        onPressed: (){},
                        height: 15,
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#Software',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           // SizedBox(height: 15,),
            if(model.postImage!=null)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 15
                ),
                child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image:DecorationImage(
                        image:NetworkImage('${model.postImage}'),
                        fit: BoxFit.cover
                    )

                ),
            ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 20,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5,),
                          Text(
                              '${SocialCubit.get(context).postsLikesNum[index]}',
                              style: Theme.of(context).textTheme.caption
                          ),
                        ],
                      )
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 20,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(width: 5,),
                          Text(
                              '${SocialCubit.get(context).postsCommentNum[index]}',
                              style: Theme.of(context).textTheme.caption
                          ),
                          SizedBox(width: 2,),
                          Text(
                              'Comments',
                              style: Theme.of(context).textTheme.caption
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            SizedBox(height: 10,),
            Row(

              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      SocialCubit.get(context).postCommentId=SocialCubit.get(context).postsId[index];
                      SocialCubit.get(context).getComments();
                      navigateTo(context, CommentsScrean());
                    },
                    child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:  NetworkImage('${SocialCubit.get(context).userModel.profile_image}'),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Write your Comment...',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]

                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                  },
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption.copyWith(),
                      ),
                    ],
                  ),
                ),

                /*Row(
                        children: [
                          Icon(
                            IconBroken.Send,
                            color: defulteColor,
                            size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            'Share',
                            style: Theme.of(context).textTheme.caption.copyWith(),
                          ),
                        ],
                      ),*/




              ],
            ),


          ],
        ),
      ),
    );
  }
}