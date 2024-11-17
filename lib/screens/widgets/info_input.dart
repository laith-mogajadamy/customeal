import 'package:customeal/screens/widgets/black18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InfoInput extends StatelessWidget {
  final String name;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onchange;
  final TextEditingController controller;

  const InfoInput({
    super.key,
    required this.name,
    required this.hint,
    required this.validator,
    required this.onchange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(child: Black18text(text: name)),
        SizedBox(
          height: size.height / 18,
          width: size.width / 2.2,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onchange,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black45, fontSize: 16.sp),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3.h, color: Colors.black))
                // border: UnderlineInputBorder(),
                ),
          ),
        )
      ],
    );
  }
}
