// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';


// class Imagepicker extends StatefulWidget {
//   const Imagepicker({
//     super.key,
//   });

//   @override
//   State<Imagepicker> createState() => _ImagepickerState();
// }

// class _ImagepickerState extends State<Imagepicker> {
//   File? fimage;

//   bool bottom = false;

//   Future pickimage(ImageSource source) async {
//     try {
//       final Image =
//           await ImagePicker().pickImage(source: source, imageQuality: 50);
//       if (Image == null) {
//         return null;
//       }
//       final imagetemp = File(Image.path);
//       fimage = imagetemp;
//     } on PlatformException catch (e) {
//       print("failed to pick image $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocBuilder<EnterBloc, EnterState>(
//       builder: (context, state) {
//         return Container(
//           height: size.height / 8,
//           width: size.width,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   color: AppColor.appgray, blurRadius: 3.r, spreadRadius: 3.r)
//             ],
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20.r),
//                 topRight: Radius.circular(20.r)),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [
//                   Black18text(text: S.of(context).Gallery),
//                   GestureDetector(
//                     onTap: () {
//                       pickimage(ImageSource.gallery).then(
//                         (value) => context.read<EnterBloc>().add(
//                               ImageChange(
//                                 fimage: fimage,
//                               ),
//                             ),
//                       );
//                       bottom = !bottom;
//                       context.read<EnterBloc>().add(Bottomshow(bottom: bottom));
//                     },
//                     child: SizedBox(
//                       height: size.height / 11,
//                       width: size.width / 5,
//                       child: SvgPicture.asset(
//                         "assets/svg/gallery.svg",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Black18text(text: S.of(context).Camera),
//                   GestureDetector(
//                     onTap: () {
//                       pickimage(ImageSource.camera).then(
//                         (value) => context.read<EnterBloc>().add(
//                               ImageChange(
//                                 fimage: fimage,
//                               ),
//                             ),
//                       );
//                       bottom = !bottom;
//                       context.read<EnterBloc>().add(Bottomshow(bottom: bottom));
//                     },
//                     child: SizedBox(
//                       height: size.height / 11,
//                       width: size.width / 5,
//                       child: SvgPicture.asset(
//                         "assets/svg/camera.svg",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
