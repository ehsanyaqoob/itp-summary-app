// import 'package:npf/exports/exports.dart';

// class GradientCircularProgressIndicator extends StatelessWidget {
//   final double strokeWidth;
//   final double value;
//   final List<Color> colors;

//   const GradientCircularProgressIndicator({
//     Key? key,
//     this.strokeWidth = 4.0,
//     this.value = 0.0,
//     required this.colors,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (Rect bounds) {
//         return SweepGradient(
//           startAngle: 0.0,
//           endAngle: 3.14 * 2,
//           colors: colors,
//           tileMode: TileMode.clamp,
//         ).createShader(bounds);
//       },
//       child: CircularProgressIndicator(
//         strokeWidth: strokeWidth,
//         value: value, // Pass progress value here (0.0 to 1.0)
//         backgroundColor: Colors.transparent,
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Transparent base
//       ),
//     );
//   }
// }
