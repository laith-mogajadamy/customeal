import 'package:customeal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Graydivider extends StatelessWidget {
  const Graydivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Divider(
        color: AppColor.appgray,
      ),
    );
  }
}
