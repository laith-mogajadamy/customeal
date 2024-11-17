import 'package:customeal/core/utils/appcolors.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<EnterBloc, EnterState>(
      listener: (context, state) {
        print("splash");
        print(state.message);

        print(state.islogedin);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (state.islogedin == "true") {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MyPages(),
              //   ),
              // );
            } else if (state.islogedin == "false") {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const Enter(),
              //   ),
              // );
            }
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColor.appgray,
        body: SizedBox(
          height: size.height,
          width: size.width,
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     SizedBox(
          //       height: size.height,
          //       width: size.width,
          //       child: Image.asset(
          //         "assets/images/rm222batch5-kul-10.jpg",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     Image.asset(
          //       "assets/images/splash.png",
          //       fit: BoxFit.cover,
          //       color: AppColor.appgray,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
