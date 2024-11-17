import 'package:customeal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileRow extends StatelessWidget {
  final String text;
  final IconData icon;
  Function ontap;
  ProfileRow({
    super.key,
    required this.text,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColor.apporange,
            size: size.width / 8,
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
