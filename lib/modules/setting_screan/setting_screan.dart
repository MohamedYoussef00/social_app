

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/modules/my_account_screan/my_account_screan.dart';
import 'package:social_app/shared/components/components.dart';

import '../creat_post_screan/creat_post_screan.dart';

class SettingScrean extends StatelessWidget {
  const SettingScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            onPressed: (){navigateTo(context, MyAccountScrean());},
          child: Text('Click'),
          color: Colors.red,

        ),
        SizedBox(height: 30,),
        MaterialButton(
          onPressed: (){navigateTo(context, CreatPostScrean());},
          child: Text('post'),
          color: Colors.red,

        )
      ],
    );
  }

}