// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:sharecipe/core/utils/constants.dart';
// import 'package:sharecipe/feature/new/domain/entities/recipe_step_entity.dart';

// class StepListItem extends StatelessWidget {
//   final RecipeStepEntity step;
//   const StepListItem({super.key, required this.step});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 150,
//       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Constants.MAIN_COLOR,
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)))),
//         child: Row(
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 height: 30,
//                 width: 30,
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 margin: const EdgeInsets.only(top: 15),
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                     color: Constants.MAIN_COLOR),
//                 child: Center(
//                   child: Text(
//                     "${step.stepNumber}",
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
//               // height: 150,
//               width: MediaQuery.of(context).size.width / 3.5,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: step.mediaLink.isNotEmpty
//                     ? Image.file(File(step.mediaLink))
//                     : Image.asset("assets/Images/no-photo.png"),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       step.title,
//                       style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Constants.MAIN_COLOR),
//                       maxLines: 1,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       getDuration(step.duration),
//                       style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       maxLines: 1,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       step.description,
//                       style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold),
//                       maxLines: 4,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   String getDuration(int duration) {
//     int hour = duration ~/ 60;
//     int minute = duration % 60;
//     return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
//   }
// }
