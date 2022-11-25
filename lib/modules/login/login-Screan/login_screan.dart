
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/cach_helper/cach_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/conestantes/conestantes.dart';
import '../../../shared/stayles/colors.dart';
import '../../home_layout/home_layout.dart';
import '../../register/register_screean/regiter_screan.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_states.dart';



class LoginScrean extends StatelessWidget {

  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var emailController=TextEditingController();
    var passwordController = TextEditingController();
    bool isBasswoedShown =false;

    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
        //  if(state is LoginSaccessState){
            if(state is LoginSaccessState){
              print(state.uId);
              CashHelper.saveData(key: 'uId', value: state.uId).then((value) {
                uId=state.uId;
                showToast(message:'Login saccessfully', color: Colors.green);
                navigateToAndFinish(context, HomeLayout());
              });
            }else if(state is LoginErorrState){
              showToast(message: state.erorr.toString(), color: Colors.redAccent);
            }
        //  }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login now to browse our offers',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defultFormFiled(
                        controller: emailController,
                        keybordType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        validator: (String value){
                          if(value.isEmpty)
                            return 'Email mustn\'t be empty';
                          else
                            return null;
                        },
                        lableText: 'Email Address',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defultFormFiled(
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        ispassword: LoginCubit.get(context).isPassword,
                        lableText: 'Password',
                        validator:  (String value)=>value.length < 8 ? 'Password must be at least 8 characters.' : null,
                        sufixIcon: LoginCubit.get(context).suffixIcon,
                        suffixOnPressed: (){
                          LoginCubit.get(context).changePasswordVisibilty();
                        },
                        onsubmit: (value){
                          if(formKey.currentState.validate()){
                            LoginCubit.get(context).userLogin(
                                userEmail: emailController.text.toString(),
                                password: passwordController.text.toString()
                            );
                          }
                        }
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ConditionalBuilder(
                        condition: state is !LoginLodingState ,
                        builder: (context){
                          return  MaterialButton(
                            color: defulteColor,
                            minWidth: double.infinity,
                            height: 45,
                            onPressed: (){
                              if(formKey.currentState.validate()){
                                LoginCubit.get(context).userLogin(
                                    userEmail: emailController.text.toString(),
                                    password: passwordController.text.toString()
                                );
                              }

                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          );
                        },
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: (){
                              navigateTo(context, RegisterScrean());
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: defulteColor,
                              ),
                            ),

                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        ),
      );
  }
}
