import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class White15text extends StatelessWidget {
  final String text;
  const White15text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
