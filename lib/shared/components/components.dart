
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context,widget){
  Navigator.push(
      context,
      MaterialPageRoute(builder:(context)=> widget)
  );
}

void navigateToAndFinish(context,widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context)=>widget),
          (route) => false);
}

void showToast({
  @required String message,
  @required Color color,
}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Widget defultFormFiled(
{
  @required TextEditingController controller,
  @required TextInputType keybordType,
  @required IconData prefixIcon,
  IconData sufixIcon,
  String lableText,
  Function onTap,
  Function onsubmit,
  Function validator,
  Function onChange,
  bool ispassword =false,
  Function suffixOnPressed
}
)=>TextFormField(
  controller: controller,
  keyboardType: keybordType,
  validator: validator,
  onTap: onTap,
  obscureText: ispassword,
  onFieldSubmitted: onsubmit,
  onChanged:onChange ,
  decoration: InputDecoration(
      border:OutlineInputBorder(),
      labelText: lableText,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: IconButton(
        icon: Icon(sufixIcon),
        onPressed: suffixOnPressed,
      )
  ),
);


