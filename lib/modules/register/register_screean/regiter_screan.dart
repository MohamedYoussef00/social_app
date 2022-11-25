
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/login/login-Screan/login_screan.dart';

import '../../../shared/components/components.dart';
import '../../../shared/stayles/colors.dart';

import '../../home_layout/home_layout.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';

class RegisterScrean extends StatelessWidget {
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var emailController=TextEditingController();
    var passwordController = TextEditingController();
    var nameController=TextEditingController();
    var phoneController = TextEditingController();

    bool isBasswoedShown =false;

    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
          listener: (context, state) {
            if (state is CreatUserSaccessState) {
              /* CashHelper.saveData(key: 'token', value: state.model.data.token).then((value) {
                  showToast(message: state.model.message, color: Colors.green);
                  navigateToAndFinish(context, HomeLayout());
                });*/
              navigateToAndFinish(context, LoginScrean());
              showToast(message: 'Saccess', color: Colors.green);
            } else if (state is CreatUserErorrState) {
              showToast(message: state.erorr, color: Colors.redAccent);
            } else if (state is RegisterErorrState) {
              showToast(message: state.erorr, color: Colors.redAccent);
            };
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
                          'Register',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        defultFormFiled(
                          controller: nameController,
                          keybordType: TextInputType.text,
                          prefixIcon: Icons.person,
                          validator: (String value){
                            if(value.isEmpty)
                              return 'Name mustn\'t be empty';
                            else
                              return null;
                          },
                          lableText: 'User Name',
                        ),
                        SizedBox(
                          height: 20,
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
                            ispassword: RegisterCubit.get(context).isPassword,
                            lableText: 'Password',
                            validator:  (String value)=>value.length < 8 ? 'Password must be at least 8 characters.' : null,
                            sufixIcon: RegisterCubit.get(context).suffixIcon,
                            suffixOnPressed: (){
                              RegisterCubit.get(context).changeRegisterPasswordVisibilty();
                            },
                            onsubmit: (value){
                              if(formKey.currentState.validate()){
                                RegisterCubit.get(context).userRegister(
                                    userName: nameController.text.toString(),
                                    userEmail: emailController.text.toString(),
                                    password: passwordController.text.toString(),
                                  phone: phoneController.text.toString(),
                                );
                              }
                            }
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        defultFormFiled(
                          controller: phoneController,
                          keybordType: TextInputType.phone,
                          prefixIcon: Icons.phone,
                          validator: (String value){
                            if(value.isEmpty)
                              return 'Phone Number mustn\'t be empty';
                            else
                              return null;
                          },
                          lableText: 'Phone Number',
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        ConditionalBuilder(
                          condition: state is !RegisterLodingState ,
                          builder: (context){
                            return  MaterialButton(
                              color: defulteColor,
                              minWidth: double.infinity,
                              height: 50,
                              onPressed: (){
                                if(formKey.currentState.validate()){
                                  RegisterCubit.get(context).userRegister(
                                    userName: nameController.text.toString(),
                                    userEmail: emailController.text.toString(),
                                    password: passwordController.text.toString(),
                                    phone: phoneController.text.toString(),
                                  );
                                }

                              },
                              child: Text(
                                'REGISTER',
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
