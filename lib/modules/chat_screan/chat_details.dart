
import 'dart:ui';


import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/shared/conestantes/conestantes.dart';

import '../../shared/stayles/icon_broken.dart';
import '../home_layout/cubit/home_states.dart';

class ImageContainer {
  double hight;
  double width;

  ImageContainer(this.hight, this.width);
}

class ChatDetails extends StatelessWidget {
  final UserModel frinedmodel;

  ChatDetails(this.frinedmodel);

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    SocialCubit cubit = SocialCubit.get(context);

    return Builder(
      builder: (context) {
        cubit.getMessages(receiverId: frinedmodel.uId);
        print(cubit.messages.length);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage('${frinedmodel.profile_image}'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${frinedmodel.name}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 2
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.messages.length > 0,
                      builder: (context) => ListView.separated(
                          itemBuilder: (context, index) {
                            MessageModel message = cubit.messages[index];
                            if (message.senderId == uId) {
                              print(uId);
                              print(message.senderId);
                              return messageFromMe(context, message);
                            } else {
                              return messageFromSender(context, message);
                            }
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          itemCount: cubit.messages.length),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 25
                          )
                        ],
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,

                      child: SafeArea(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'type your message... ',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.blue.withOpacity(0.8),
                              child: IconButton(
                                color: Colors.white,
                                disabledColor: Colors.grey,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cubit.SendMessage(
                                      messageText: messageController.text,
                                      receiverId: frinedmodel.uId);
                                  messageController.text = '';
                                },
                                icon: Icon(
                                  IconBroken.Send,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget messageFromSender(context, MessageModel message){
    bool conainImage=false;
    if(message.image!=null)
      conainImage=true;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: [

          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  ),
                  color: conainImage? Colors.grey.withOpacity(0.25):Theme.of(context).scaffoldBackgroundColor
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(conainImage)
                    SizedBox(
                      child: Image(
                        image: NetworkImage(
                            '${message.image}'),

                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.only(
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10),
                          topEnd: Radius.circular(10),
                          topStart: Radius.circular(10),
                        ),

                        color:conainImage? Colors.grey.withOpacity(0):Colors.grey.withOpacity(0.25),
                      ),
                      child: Text(
                          '${message.messageText}',
                          style: Theme.of(context).textTheme.bodyText1
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: conainImage?MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width*0.25,
          ),

        ],
      ),
    );
  }

  Widget messageFromMe(context, MessageModel message) {
    bool conainImage=false;
    if(message.image!=null)
      conainImage=true;
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(

        children: [
          Container(
            width: conainImage?MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width*0.25,
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    topEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  ),
                  color: conainImage? Colors.blue.withOpacity(0.25):Theme.of(context).scaffoldBackgroundColor
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if(conainImage)
                    SizedBox(
                    child: Image(
                      image: NetworkImage(
                          '${message.image}'),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(10),
                            topEnd: Radius.circular(10),
                            topStart: Radius.circular(10),
                          ),

                          color:conainImage? Colors.blue.withOpacity(0):Colors.blue.withOpacity(0.25),
                      ),
                      child: Text(
                        '${message.messageText}',
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
