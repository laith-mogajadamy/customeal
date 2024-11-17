import 'package:customeal/core/utils/appcolors.dart';
import 'package:customeal/core/utils/formstatus.dart';
import 'package:customeal/screens/pages/pages.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:customeal/screens/welcome/login.dart';
import 'package:customeal/screens/widgets/black16text.dart';
import 'package:customeal/screens/widgets/black18text.dart';
import 'package:customeal/screens/widgets/info_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {
  bool bottom = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController city = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    number.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          InfoInput(
                              name: "Name",
                              hint: "Client name",
                              validator: (value) => state.isValidName
                                  ? null
                                  : "Name is not Valid",
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginNameChanged(name: value),
                                      ),
                              controller: name),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            height: 20.h,
                          ),
                          InfoInput(
                              name: "Number",
                              hint: "0900000000",
                              validator: (value) {
                                return state.isValidnumber
                                    ? null
                                    : "Number is not Valid";
                              },
                              onchange: (value) {
                                return context.read<EnterBloc>().add(
                                      LoginNumberChanged(number: value),
                                    );
                              },
                              controller: number),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: "City",
                              hint: "Aleppo",
                              validator: null,
                              onchange: (value) {
                                return context.read<EnterBloc>().add(
                                      CityChanged(city: value),
                                    );
                              },
                              controller: number),
                          SizedBox(
                            height: 20.h,
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
                            height: 20.h,
                          ),
                          InfoInput(
                              name: "Retype Password",
                              hint: "*******",
                              validator: (value) => state.isValidPassword
                                  ? null
                                  : "Password is not Valid",
                              onchange: (value) =>
                                  context.read<EnterBloc>().add(
                                        LoginReTypePasswordChanged(
                                            retypePassword: value),
                                      ),
                              controller: retypePassword),
                          SizedBox(
                            height: 20.h,
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
                                if (formKey.currentState!.validate()) {
                                  if ((state.formStatus is FormSubmitting)) {
                                  } else {
                                    context
                                        .read<EnterBloc>()
                                        .add(ClientRegisterSubmitted());
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
                                backgroundColor:
                                    const Color.fromARGB(255, 68, 68, 68),
                                shape: const BeveledRectangleBorder(),
                              ),
                              child: (state.formStatus is FormSubmitting)
                                  ? CircularProgressIndicator(
                                      color: AppColor.whiteColor,
                                      strokeWidth: 4.w,
                                    )
                                  : Text(
                                      "SignUp",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Black16text(text: "Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: const Black18text(text: "LogIn"))
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
