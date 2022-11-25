
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/register/cubit/register_states.dart';

import '../../../shared/conestantes/conestantes.dart';


class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit():super(RegisterinitialState());

  static RegisterCubit get(context)=>BlocProvider.of(context);


  void userRegister({
    @required String userName,
    @required String userEmail,
    @required String password,
    @required String phone,
}){
    emit(RegisterLodingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: password
    ).then((value) {
      print(value.user.email);
      print(value.user.uid);
      createNewUser(userName: userName, userEmail: userEmail, uId: value.user.uid, phone: phone);
      //emit(RegisterSaccessState());
    }).catchError((erorr){
      print(erorr.toString()+'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      emit(RegisterErorrState(erorr.toString()));
    });
  }

  void createNewUser({
    @required String userName,
    @required String userEmail,
    @required String uId,
    @required String phone,
    String profile_image='https://img.freepik.com/free-photo/photo-puzzled-unshaven-man-points-sideways-crosses-arms-chest-doubts-two-choices-variants-has-bewildered-look-wears-spectacles-rosy-sweater-isolated-yellow-wall_273609-42220.jpg',
    String cover_image='https://as1.ftcdn.net/v2/jpg/03/17/72/96/1000_F_317729652_qRDHovRXHTxoVrUCbtvY4ce1V8GVzKvf.jpg',
    String bio='Write your bio...',
  }){
    UserModel userdata=UserModel(
      name: userName,
      email: userEmail,
      phone: phone,
      uId: uId,
      isEmailVirefied: false,
      bio: bio,
      cover_image: cover_image,
      profile_image: profile_image,
    );
    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId)
        .set(userdata.toMap())
    .then((value) {
      emit(CreatUserSaccessState());
    }).catchError((erorr){
      emit(CreatUserErorrState(erorr.toString()));
    });
  }

  IconData suffixIcon=Icons.visibility;
  bool isPassword=true;

  void changeRegisterPasswordVisibilty(){
    isPassword=!isPassword;
    isPassword? suffixIcon=Icons.visibility:suffixIcon=Icons.visibility_off;
    emit(ChangePasswordVisibltyState());
  }

}

