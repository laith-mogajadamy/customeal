import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Black10text extends StatelessWidget {
  final String? text;
  const Black10text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: 10.sp, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
