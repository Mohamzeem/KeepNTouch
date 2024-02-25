part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

//~ login states
class LoginLoadingState extends AuthState {
  const LoginLoadingState();
}

class LoginSuccessState extends AuthState {
  final UserCredential userCredential;
  const LoginSuccessState({required this.userCredential});
  @override
  List<Object> get props => [userCredential];
}

class LoginFailureState extends AuthState {
  final String errMessage;
  const LoginFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//~ register
class RegisterloadingState extends AuthState {
  const RegisterloadingState();
}

class RegisterSuccessState extends AuthState {
  final UserCredential userCredential;
  const RegisterSuccessState({required this.userCredential});
  @override
  List<Object> get props => [userCredential];
}

class RegisterFailureState extends AuthState {
  final String errMessage;
  const RegisterFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

// //~ saver user data
class AccountloadingState extends AuthState {
  const AccountloadingState();
}

class AccountSuccessState extends AuthState {
  const AccountSuccessState();
}

class AccountFailureState extends AuthState {
  final String errMessage;
  const AccountFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//~ get profile
class GetProfileLoadingState extends AuthState {
  const GetProfileLoadingState();
}

class GetProfileSuccessState extends AuthState {
  final UserModel userModel;
  const GetProfileSuccessState({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class GetProfileFailureState extends AuthState {
  final String errMessage;
  const GetProfileFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//~ logOut states
class LogOutLoadingState extends AuthState {
  const LogOutLoadingState();
}

class LogoutSuccessState extends AuthState {
  const LogoutSuccessState();
}

class LogoutFailureState extends AuthState {
  final String errMessage;
  const LogoutFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//~ forgot password states
class ForgotPasswordLoadingState extends AuthState {
  const ForgotPasswordLoadingState();
}

class ForgotPasswordSuccessState extends AuthState {
  const ForgotPasswordSuccessState();
}

class ForgotPasswordFailureState extends AuthState {
  final String errMessage;
  const ForgotPasswordFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
