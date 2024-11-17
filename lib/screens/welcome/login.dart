import 'package:customeal/core/utils/appcolors.dart';
import 'package:customeal/core/utils/formstatus.dart';
import 'package:customeal/screens/pages/pages.dart';
import 'package:customeal/screens/welcome/client_register.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:customeal/screens/widgets/black16text.dart';
import 'package:customeal/screens/widgets/black18text.dart';
import 'package:customeal/screens/widgets/info_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     opacity: 0.5,
            //     image: AssetImage(
            //       "assets/images/screen.jpg",
            //     ),
            //   ),
            // ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(
                  //   height: size.height / 6,
                  //   child: Image.asset(
                  //     "assets/images/logo.png",
                  //   ),
                  // ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Column(
                        children: [
                          InfoInput(
                              name: "Email",
                              hint: "Client@gmail.com",
                              validator: (value) => state.isValidEmail
                                  ? null
                                  : "Email is not Valid",
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginEmailChanged(email: value),
                                      ),
                              controller: email),
                          SizedBox(
                            height: 30.h,
                          ),
                          InfoInput(
                              name: "Password",
                              hint: "*******",
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : "Password is not Valid",
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginPasswordChanged(password: value),
                                      ),
                              controller: password),
                          SizedBox(
                            height: 30.h,
                          ),
                          BlocListener<EnterBloc, EnterState>(
                            listener: (context, state) {
                              if (state.formStatus is SubmissionSuccess) {
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
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyPages(),
                                  ),
                                  (route) => false,
                                );
                              } else if (state.formStatus is SubmissionFailed) {
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
                            child: ElevatedButton(
                              onPressed: () {
                                print(state.email);
                                print(state.password);
                                if (formKey.currentState!.validate()) {
                                  if ((state.formStatus is FormSubmitting)) {
                                  } else {
                                    context
                                        .read<EnterBloc>()
                                        .add(LoginSubmitted());
                                  }
                                }

                                print(state.email);
                                print("=============");
                                print(state.name);
                                print("=============");
                                print(state.phone);
                                print("=============");
                                print(state.password);
                                print("=============");
                                print("=============");
                                print(state.formStatus);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(size.width / 1.2, size.height / 18),
                                backgroundColor: AppColor.offblack,
                                shape: const BeveledRectangleBorder(),
                              ),
                              child: (state.formStatus is FormSubmitting)
                                  ? CircularProgressIndicator(
                                      color: AppColor.whiteColor,
                                      strokeWidth: 4.w,
                                    )
                                  : Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Black16text(text: "don`t have an anaccount?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ClientRegister(),
                              ),
                            );
                          },
                          child: const Black18text(text: "SignUp"))
                    ],
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
