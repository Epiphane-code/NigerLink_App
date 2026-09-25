// import 'package:e_services_niger/models/media.dart';
// import 'package:flutter/material.dart';

// class AppPopup extends StatelessWidget {
//   final MediaModel info;

//   const AppPopup({super.key, required this.info});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Color(0xFFE5F4EE),
//       insetPadding: const EdgeInsets.symmetric(horizontal: 25),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           minWidth: MediaQuery.of(context).size.width * 2,
//           minHeight: MediaQuery.of(context).size.height * 1,
//         ),
//         child: Container(
//           margin: EdgeInsets.all(5),
//           width: double.infinity,
//                 decoration: BoxDecoration(color: Color(0xFFE5F4EE),border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(12)),
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(12)),
//                 child: Text(
//                   info.nomserviceVal,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.green,
//                     fontWeight: FontWeight.w900,
                  
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 15),

//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Titre: ${info.title}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                           fontSize: 16,
//                           color: const Color.fromARGB(255, 51, 71, 51),
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       Text(
//                         info.contenuVal,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           height: 1.5,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Fermer'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
