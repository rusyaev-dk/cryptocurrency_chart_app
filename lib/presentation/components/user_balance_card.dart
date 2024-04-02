
// import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
// import 'package:flutter/material.dart'; 
 
// class CardWidget extends StatelessWidget { 
//   const CardWidget({super.key}); 
 
//   @override 
//   Widget build(BuildContext context) { 
//     return Container( 
//       height: 165, 
//       decoration: BoxDecoration( 
//         gradient: LinearGradient( 
//           colors: AppColors.cardLinearGradient, 
//           begin: Alignment.bottomLeft, 
//           end: Alignment.topRight, 
//         ), 
//         borderRadius: BorderRadius.circular(15), 
//       ), 
//       child: Padding( 
//         padding: const EdgeInsets.all(16.0), 
//         child: Column( 
//           mainAxisSize: MainAxisSize.min, 
//           children: [ 
//             Row( 
//               children: [ 
//                 const Column( 
//                   mainAxisAlignment: MainAxisAlignment.start, 
//                   crossAxisAlignment: CrossAxisAlignment.start, 
//                   mainAxisSize: MainAxisSize.min, 
//                   children: [ 
//                     const Text( 
//                       "Portfolio value", 
//                       style: TextStyle( 
//                         color: AppColors.white, 
//                       ), 
//                     ), 
//                     const SizedBox(height: 5), 
//                     const Text( 
//                       "\$47,412.65", 
//                       style: TextStyle( 
//                         fontSize: 24, 
//                         color: AppColors.white, 
//                       ), 
//                     ), 
//                     const SizedBox(height: 5), 
//                     Row( 
//                       mainAxisAlignment: MainAxisAlignment.start, 
//                       children: [ 
//                         Icon( 
//                           Icons.arrow_drop_up_rounded, 
//                           color: AppColors.green, 
//                         ), 
//                         Text( 
//                           "\$453.85(+1.6%)", 
//                           style: TextStyle( 
//                             color: AppColors.green, 
//                           ), 
//                         ), 
//                       ], 
//                     ), 
//                   ], 
//                 ), 
//                 const SizedBox(width: 100), 
//                 const SizedBox( 
//                   width: 85, 
//                   height: 35, 
//                   child: LineChartWidget(), 
//                 ), 
//               ], 
//             ), 
//             const SizedBox(height: 10), 
//             Container( 
//               height: 1, 
//               width: 300, 
//               decoration: BoxDecoration( 
//                 gradient: LinearGradient( 
//                   colors: AppColors.dividerLinearGradient, 
//                 ), 
//               ), 
//             ), 
//             const SizedBox(height: 9), 
//             // Align( 
//             //   alignment: Alignment.centerRight, 
//             //   child: TextButton( 
//             //     onPressed: () {}, 
//             //     style: TextButton.styleFrom( 
//             //       foregroundColor: Colors.grey, 
//             //       minimumSize: Size.zero, 
//             //       padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16), 
//             //     ), 
//             //     child: const Row( 
//             //       mainAxisSize: MainAxisSize.min, 
//             //       children: [ 
//             //         Text('See All'), 
//             //         Icon( 
//             //           Icons.arrow_forward_ios, 
//             //           size: 15, 
//             //         ), 
//             //       ], 
//             //     ), 
//             //   ), 
//             // ), 
//             GestureDetector( 
//               onTap: () { 
//                 // Navigator.of(context).push( 
//                 //   MaterialPageRoute( 
//                 //     builder: (ctx) => , 
//                 //   ), 
//                 // ); 
//               }, 
//               child: Container( 
//                 padding: const EdgeInsets.only(right: 10), 
//                 height: 25, 
//                 width: double.infinity, 
//                 child: Row(


// mainAxisAlignment: MainAxisAlignment.end, 
//                   children: [ 
//                     Text( 
//                       "See All", 
//                       style: TextStyle(color: AppColors.grey), 
//                     ), 
//                     const SizedBox(width: 5), 
//                     Icon( 
//                       Icons.arrow_forward_ios, 
//                       size: 12, 
//                       color: AppColors.grey, 
//                     ), 
//                   ], 
//                 ), 
//               ), 
//             ), 
//           ], 
//         ), 
//       ), 
//     ); 
//   } 
// }