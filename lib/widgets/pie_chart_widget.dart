// import 'package:flutter/material.dart';
// import 'package:fast_charts/fast_charts.dart';

// import '../models/charts_data.dart';

// class PieChartWidget extends StatelessWidget {
//   final String title;
//   final List<PieChartData> data;

//   const PieChartWidget({super.key, required this.title, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         SizedBox(
//           height: 200,
//           child: PieChart(
//             sections: data.map((e) => PieChartSection(value: e.value, color: e.color)).toList(), data: null,
//           ),
//         ),
//       ],
//     );
//   }
// }
// class BarChartWidget extends StatelessWidget {
//   final String title;
//   final List<BarChartData> data;

//   const BarChartWidget({super.key, required this.title, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         SizedBox(
//           height: 200,
//           child: BarChart(
//             bars: data.map((e) => BarChartBar(x: e.x, values: e.values)).toList(),
//             config: const BarChartConfig(
//               showGrid: true,
//               showAxis: true,
//               barSpacing: 10,
//               groupSpacing: 20,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
