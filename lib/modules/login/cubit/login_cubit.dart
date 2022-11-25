


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{

  LoginCubit():super(LogininitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

 // LoginModle userLoginModel;

  void userLogin({
    @required String userEmail,
    @required String password,
}){
    emit(LoginLodingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: password
    ).then((value) {
      emit(LoginSaccessState(value.user.uid));
    }).catchError((onError){
      emit(LoginErorrState(onError.toString()));
    });

  }

  IconData suffixIcon=Icons.visibility;
  bool isPassword=true;

  void changePasswordVisibilty(){
    isPassword=!isPassword;
    isPassword? suffixIcon=Icons.visibility:suffixIcon=Icons.visibility_off;
    emit(ChangePasswordVisibltyState());
  }

}

