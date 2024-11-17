import 'package:customeal/core/utils/appcolors.dart';
import 'package:customeal/screens/welcome/client_register.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:customeal/screens/welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Enter extends StatelessWidget {
  const Enter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const LanguageChange(),
              //           ),
              //         );
              //       },
              //       icon: Icon(
              //         Icons.language,
              //         size: 30.r,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                  width: size.width,
                  child: Image.asset("assets/images/logo.png")),
              BlocBuilder<EnterBloc, EnterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width / 1.6, size.height / 18),
                          backgroundColor: AppColor.offblack,
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClientRegister()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width / 1.6, size.height / 18),
                          backgroundColor: AppColor.whiteColor,
                          side: BorderSide(
                            color: AppColor.offblack,
                            width: 2,
                          ),
                          shape: const BeveledRectangleBorder(),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
                },
              ),
              Text(
                "ABOUT US",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
