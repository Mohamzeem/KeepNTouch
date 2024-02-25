import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/repo/auth_repo_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl repo;
  AuthCubit({required this.repo}) : super(const AuthInitialState());

  bool isFirstTime = true;
  // UserModel? model;
  //User user = FirebaseAuth.instance.currentUser!;

//~ login get UserCredential
  Future login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoadingState());
    final result = await repo.login(
      email: email,
      password: password,
    );
    result.fold(
        (failure) => emit(LoginFailureState(errMessage: failure.toString())),
        (userCredential) async {
      //~ refresh tokenFcm
      //  await refreshTokenFcmAndRoomId(user.user!.uid);
      // await getProfile();
      emit(LoginSuccessState(userCredential: userCredential));
    });
  }

  Future getProfile() async {
    emit(const GetProfileLoadingState());
    final result =
        await repo.getProfile(id: FirebaseAuth.instance.currentUser!.uid);
    result.fold(
        (failure) =>
            emit(GetProfileFailureState(errMessage: failure.toString())),
        (profile) {
      emit(GetProfileSuccessState(userModel: profile));
    });
  }

  Future register({
    required String email,
    required String password,
  }) async {
    emit(const RegisterloadingState());
    final result = await repo.register(email: email, password: password);
    result.fold(
        (failure) => emit(RegisterFailureState(errMessage: failure.toString())),
        (user) {
      emit(RegisterSuccessState(userCredential: user));
    });
  }

  Future saveUserData({
    required String name,
  }) async {
    emit(const AccountloadingState());
    final result = await repo.saveUserData(name: name);
    result.fold((failure) => emit(AccountFailureState(errMessage: failure)),
        (unit) {
      emit(const AccountSuccessState());
    });
  }

//~ forgot password
  Future forgotPassword({required String email}) async {
    emit(const ForgotPasswordLoadingState());
    final result = await repo.forgotPassword(email: email);
    result.fold(
        (failure) =>
            emit(ForgotPasswordFailureState(errMessage: failure.toString())),
        (unit) => emit(const ForgotPasswordSuccessState()));
  }

//~ log out
  Future logOut() async {
    emit(const LogOutLoadingState());
    await FirebaseAuth.instance.signOut();
    emit(const LogoutSuccessState());
  }

//~ app connection checker
  void checkInternet(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (isFirstTime) {
            isFirstTime = false;
            return;
          }
          CustomSnackBar.showSuccessSnackBar(
              context: context, message: 'Internet connection is active');
          break;
        case InternetConnectionStatus.disconnected:
          CustomSnackBar.showErrorSnackBar(
              context: context, message: 'Internet connection is disconnected');
          break;
      }
    });
  }

  // Future refreshTokenFcmAndRoomId(String userId) async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   int roomId = userId.hashCode;
  //   final result = await FirebaseFirestore.instance
  //       .collection(AppStrings.usersCollection)
  //       .doc(userId)
  //       .get();
  //   var userProfile = UserModel.fromJson(result.data()!);
  //   //~ save role in shared pref
  //   // SharedPref().setString(PrefKeys.role, userProfile.role!);
  //   // AppStrings.role = SharedPref().getString(PrefKeys.role);
  //   await FirebaseFirestore.instance
  //       .collection(AppStrings.usersCollection)
  //       .doc(userId)
  //       .update({'tokenFcm': token, 'roomId': roomId, 'isLogged': true});
  // }
}
