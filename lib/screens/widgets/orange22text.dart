import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orange22text extends StatelessWidget {
  final String text;
  const Orange22text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 22.sp, color: Colors.orange, fontWeight: FontWeight.bold),
    );
  }
}
