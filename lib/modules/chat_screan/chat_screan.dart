
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chat_screan/chat_details.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';
import 'package:social_app/shared/components/components.dart';

class ChatScrean extends StatelessWidget {
  const ChatScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) =>  ConditionalBuilder(
        condition:state is !GetAllUserLodingState ,
        builder: (context) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => chatListItem(context,SocialCubit.get(context).allUsers[index]),
                      separatorBuilder:(context, index) =>  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(height: 1,color: Colors.grey,),
                      ),
                      itemCount: SocialCubit.get(context).allUsers.length,
                    ),
                  ),

                ],
              ),
            )
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget chatListItem(context,UserModel model)=> InkWell(
    onTap: (){
      navigateTo(context, ChatDetails(model));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage:  NetworkImage('${model.profile_image}'),
          ),
          SizedBox(width: 10),
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ),
  );
}
