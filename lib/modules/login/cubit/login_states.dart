

abstract class LoginStates{}

class LogininitialState extends LoginStates{}

class LoginLodingState extends LoginStates{}

class LoginSaccessState extends LoginStates{
 final String uId;
  LoginSaccessState(this.uId);

}

class LoginErorrState extends LoginStates{
  final String erorr;
  LoginErorrState(this.erorr);

}


class LogoutLodingState extends LoginStates{}

class LogoutSaccessState extends LoginStates{}

class LogoutErorrState extends LoginStates{
  final String erorr;
  LogoutErorrState(this.erorr);

}

class ChangePasswordVisibltyState extends LoginStates{}