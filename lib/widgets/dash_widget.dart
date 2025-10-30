// import 'package:flutter/material.dart';

// import '../models/dash_model.dart';

// class DashboardCardWidget extends StatelessWidget {
//   final DashboardCardModel card;

//   const DashboardCardWidget({super.key, required this.card});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(card.color),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               card.value,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               card.title,
//               style: const TextStyle(fontSize: 14, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
