import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserCredential>> login(
      {required String email, required String password});
  Future<Either<String, UserCredential>> register(
      {required String email, required String password});
  Future<Either<String, Unit>> saveUserData({
    required String name,
  });
  Future<Either<String, UserModel>> getProfile({required String id});
  Future<Either<String, UserCredential>> loginWithGoogle();
  Future<Either<String, Unit>> updateUserStatus();
  Future<Either<String, Unit>> forgotPassword({required String email});
}
