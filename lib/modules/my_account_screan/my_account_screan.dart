
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';
import 'package:social_app/shared/components/components.dart';

import '../../shared/stayles/icon_broken.dart';
import '../edit_profile_screan/edit_profile_screan.dart';

class MyAccountScrean extends StatelessWidget {
  const MyAccountScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SocialCubit cubit =SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 230,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children:[
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight:Radius.circular(5) ,
                            ),
                            image: DecorationImage(
                              image:NetworkImage(cubit.userModel.cover_image),
                              //image: NetworkImage('https://img.freepik.com/free-photo/joyful-ethnic-woman-points-both-index-fingers-gun-pistols_273609-40721.jpg'),
                              fit: BoxFit.cover,
                            )
                          ),


                        ),
                      ),
                      CircleAvatar(
                        radius: 62,
                        backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
                        child: CircleAvatar(
                          radius: 60,
                         backgroundImage: NetworkImage(cubit.userModel.profile_image),
                         // backgroundImage:  NetworkImage('https://img.freepik.com/free-photo/photo-puzzled-unshaven-man-points-sideways-crosses-arms-chest-doubts-two-choices-variants-has-bewildered-look-wears-spectacles-rosy-sweater-isolated-yellow-wall_273609-42220.jpg'),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '${cubit.userModel.name}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 18
                  ),
                ),
                Text(
                  '${cubit.userModel.bio}',
                  style:Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '120',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],

                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '170',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              'Following',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],

                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '652',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              'Images',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],

                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '112',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],

                        ),
                      ),
                    ),
                  ],
                ),

               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(3.0),
                 child: Row(
                   children: [
                     Expanded(
                       child: InkWell(
                           onTap: (){
                             navigateTo(context, EditProfileScrean());
                           },
                           child: Container(
                             height: 40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6),
                               color: Colors.grey[200],
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   'Edit Profile',
                                   style:TextStyle(
                                     color: Colors.blue,
                                   ),
                                 ),
                                 SizedBox(width: 5,),
                                 Icon(
                                   IconBroken.Edit,
                                   color: Colors.blue,
                                 ),
                               ],

                             ),
                           )
                       ),
                     ),
                     SizedBox(width: 8,),
                     InkWell(
                           onTap: (){},
                           child: Container(
                             height: 40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6),
                               color: Colors.grey[200],
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   '   Add Photos   ',
                                   style:TextStyle(
                                     color: Colors.blue,
                                   ),
                                 ),

                               ],

                             ),
                           )
                       ),

                   ],
                 ),
               ),
              ],
            ),
          ),
        );
      },

    );
  }
}
