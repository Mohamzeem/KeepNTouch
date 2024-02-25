// // ignore_for_file: use_build_context_synchronously
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:keep_n_touch/Core/Utils/app_strings.dart';
// import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
// import 'package:keep_n_touch/Core/Widgets/loading.dart';
// import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
// import 'package:keep_n_touch/Presentation/Control/view/control_view.dart';

// class AuthData {
//   static final FirebaseAuth auth = FirebaseAuth.instance;
//   User? user;
//   static final currentUser = FirebaseAuth.instance.currentUser;

//   static Future logIn(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     try {
//       CustomLoading.show();

//       await auth
//           .signInWithEmailAndPassword(
//         email: '${email.trim()}${AppStrings.defaultEmail}',
//         password: password,
//       )
//           .then(
//         (value) {
//           return CustomSnackBar.showSuccessSnackBar(
//                   context: context, message: 'Logged in Successfully')
//               .then((value) => Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ControlView(),
//                   ),
//                   (route) => false));
//         },
//       ).onError(
//         (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
//             context: context, message: error.toString()),
//       );
//       CustomLoading.dismiss();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         CustomSnackBar.showSuccessSnackBar(
//             context: context, message: 'No user found for that email');
//       } else if (e.code == 'wrong-password') {
//         CustomSnackBar.showSuccessSnackBar(
//             context: context, message: 'Wrong password provided for that user');
//       }
//     }
//   }

//   static Future register(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//             email: '${email.trim()}${AppStrings.defaultEmail}',
//             password: password,
//           )
//           .then(
//             (value) => CustomSnackBar.showSuccessSnackBar(
//                 context: context, message: 'Account Created Successfully'),
//           )
//           .onError((error, stackTrace) => CustomSnackBar.showErrorSnackBar(
//               context: context, message: error.toString()));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         CustomSnackBar.showErrorSnackBar(
//             context: context, message: 'The password provided is too weak');
//       } else if (e.code == 'email-already-in-use') {
//         CustomSnackBar.showErrorSnackBar(
//             context: context,
//             message: 'The account already exists for that email');
//       }
//     } catch (e) {
//       CustomSnackBar.showErrorSnackBar(context: context, message: e.toString());
//     }
//   }

//   static Future signOut({required BuildContext context}) async {
//     await auth.signOut().then(
//       (value) {
//         return CustomSnackBar.showSuccessSnackBar(
//                 context: context, message: 'Logged Out Successfully')
//             .then((value) => Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const LoginView(),
//                 ),
//                 (route) => false));
//       },
//     ).onError(
//       (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
//           context: context, message: error.toString()),
//     );
//   }

//   static Future resetPassword(
//       {required String email, required BuildContext context}) async {
//     await FirebaseAuth.instance
//         .sendPasswordResetEmail(
//             email: '${email.trim()}${AppStrings.defaultEmail}')
//         .then(
//           (value) => CustomSnackBar.showSuccessSnackBar(
//                   context: context,
//                   message: 'Email sent Successfully, Check your email')
//               .then((value) => Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginView(),
//                   ),
//                   (route) => false)),
//         )
//         .onError(
//           (error, stackTrace) => CustomSnackBar.showErrorSnackBar(
//               context: context, message: error.toString()),
//         );
//   }
// }
