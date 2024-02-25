// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:keep_n_touch/Core/App/app_info.dart';
// import 'package:keep_n_touch/Core/Utils/app_colors.dart';
// import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
// import 'package:keep_n_touch/Core/routes/app_routes.dart';
// import 'package:keep_n_touch/Presentation/Authentication/view_model/auth_cubit/auth_cubit.dart';
// import 'package:keep_n_touch/Presentation/Chat/view/chat_view.dart';
// import 'package:keep_n_touch/Presentation/Contacts/contacts_view.dart';
// import 'package:keep_n_touch/Presentation/Groups/groups_view.dart';
// import 'package:keep_n_touch/Presentation/Settings/settings_view.dart';

// class ControlBody extends StatefulWidget {
//   const ControlBody({
//     super.key,
//   });

//   @override
//   State<ControlBody> createState() => _ControlBodyState();
// }

// class _ControlBodyState extends State<ControlBody> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<AuthCubit>(context).getProfile();
//   }

//   List screens = [
//     const ChatView(),
//     const GroupsView(),
//     const ContactsView(),
//     const SettingsView()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<AuthCubit>(context);
//     final model = BlocProvider.of<AuthCubit>(context).model;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: Column(
//         children: [
//           const SizedBox(height: 50),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const CustomText(
//                 text: 'Control View',
//                 fontSize: 25,
//                 color: AppColors.mainColor,
//               ),
//               IconButton(
//                 onPressed: () async {
//                   cubit.logOut();
//                   MyApp.navigation.navigateAndFinish(AppRouter.loginView);
//                 },
//                 icon: const Icon(
//                   Icons.logout,
//                   color: AppColors.mainColor,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
