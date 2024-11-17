import 'package:customeal/core/utils/appcolors.dart';
import 'package:customeal/core/utils/formstatus.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:customeal/screens/welcome/enter.dart';
import 'package:customeal/screens/widgets/black18text.dart';
import 'package:customeal/screens/widgets/graydivider.dart';
import 'package:customeal/screens/widgets/profile_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
              child: ListView(
                children: [
                  // (state.user.profile.isEmpty)
                  //     ? Icon(
                  //         size: 100.r,
                  //         Icons.person,
                  //         color: AppColor.apporange,
                  //       )
                  //     : CircleAvatar(
                  //         backgroundColor: AppColor.whiteColor,
                  //         radius: 75.r,
                  //         backgroundImage: NetworkImage(
                  //           scale: 0.5,
                  //           state.user.profile,
                  //         ),
                  //       ),
                  Center(
                    child: Text(
                      (state.user.name.isNotEmpty) ? state.user.name : "Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: AppColor.apporange),
                    ),
                  ),

                  Center(
                    child: Text(
                      (state.user.email.isNotEmpty)
                          ? state.user.email
                          : "email",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.apporange,
                        size: 10.r,
                      ),
                      Text(
                        (state.user.city != '') ? state.user.city : "city",
                        style: TextStyle(
                          color: AppColor.apporange,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Graydivider(),

                  ProfileRow(
                    text: "Profile Edit",
                    icon: Icons.edit_note_rounded,
                    ontap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ClientProfileEdit(),
                      //   ),
                      // );
                    },
                  ),

                  const Graydivider(),
                  BlocListener<EnterBloc, EnterState>(
                    listenWhen: (previous, current) {
                      return previous.logoutStatus != current.logoutStatus;
                    },
                    listener: (context, state) {
                      if (state.logoutStatus is FormSubmitting) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: AppColor.whiteColor,
                              elevation: 5,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Black18text(text: "Logging out"),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CircularProgressIndicator(
                                    color: AppColor.apporange,
                                    strokeWidth: 8.w,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state.logoutStatus is SubmissionSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              state.message,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Enter()),
                        );
                      } else if (state.logoutStatus is SubmissionFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              state.message,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: ProfileRow(
                      text: "LOGOUT",
                      icon: Icons.exit_to_app_rounded,
                      ontap: () {
                        context.read<EnterBloc>().add(
                              Logout(token: state.token),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
