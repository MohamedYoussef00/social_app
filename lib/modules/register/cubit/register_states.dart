


abstract class RegisterStates{}

class RegisterinitialState extends RegisterStates{}

class RegisterLodingState extends RegisterStates{}

class RegisterSaccessState extends RegisterStates{}

class RegisterErorrState extends RegisterStates{
  final String erorr;
  RegisterErorrState(this.erorr);
}

class CreatUserSaccessState extends RegisterStates{}

class CreatUserErorrState extends RegisterStates{
  final String erorr;
  CreatUserErorrState(this.erorr);
}


class ChangePasswordVisibltyState extends RegisterStates{}