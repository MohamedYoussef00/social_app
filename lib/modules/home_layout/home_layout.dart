
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/stayles/icon_broken.dart';

import '../../shared/stayles/colors.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_states.dart';


class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SocialCubit.get(context).currentIndex=0;
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){} ,
      builder: (context,state){
        SocialCubit cubit=SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text('Social App'),
            actions: [
              IconButton(
                onPressed: (){
                  SocialCubit.get(context).getPosts();
                  print(SocialCubit.get(context).posts.length.toString());
                },
                  icon: Icon(Icons.search))
            ],
          ),
         // body: cubit.screans[cubit.currentIndex],
          body: cubit.screans[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              if(index==1)
                cubit.getAllUsers();
              cubit.changeCurrentIndex(index);
            },
            showUnselectedLabels: true,
            elevation: 10,
            unselectedItemColor: Colors.grey,
            selectedItemColor:defulteColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.User),
                  label: 'Users',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: 'Setting'
              ),
            ],
          ),
        );
      }
    );
  }
}
