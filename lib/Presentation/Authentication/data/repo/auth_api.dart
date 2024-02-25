import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';

class AuthApi {
  static final fireStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static User? get user => auth.currentUser;
  static Stream<User?> get userStream => auth.userChanges();

//~ login in with email and password
  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: "${email.trim()}${AppStrings.defaultEmail}",
      password: password.trim(),
    );
    //await auth.currentUser!.reload();
    return userCredential;
  }

//~ register
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "${email.trim()}${AppStrings.defaultEmail}",
      password: password.trim(),
    );
    return userCredential;
  }

//~ add user data to Firebase
  Future<void> saveUserData({
    required String name,
  }) async {
    await auth.currentUser!.updateDisplayName(name);
    //String? token = await FirebaseMessaging.instance.getToken();
    UserModel userModel = UserModel(
      name: name,
      id: auth.currentUser!.uid,
      email: auth.currentUser!.email,
    );
    await fireStore
        .collection(AppStrings.usersCollection)
        .doc(auth.currentUser!.uid)
        .set(userModel.toJson());
  }

//~ login in with google
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

//~ forgot password
  Future<void> forgotPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: "$email.trim()");
  }

  //~ get user peofile
  Future<UserModel> getProfile({required String id}) async {
    final result =
        await fireStore.collection(AppStrings.usersCollection).doc(id).get();
    return UserModel.fromJson(result.data()!);
  } //~ update user status in firebase

  Future<void> updateUserStatus() async {
    final id = auth.currentUser!.uid;
    await fireStore
        .collection(AppStrings.usersCollection)
        .doc(id)
        .update({'isLoged': true, 'isOnline': true});
  }
//~ Get User Profile To get Role And Refresh TokeFmc
}
