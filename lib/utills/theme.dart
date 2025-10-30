// import 'package:flutter/material.dart';
// import 'app_colors.dart';

// class AppTheme {
//   static ThemeData get lightTheme => ThemeData(
//         brightness: Brightness.light,
//         primaryColor: AppColors.primary,
//         colorScheme: const ColorScheme.light(
//           primary: AppColors.primary,
//           secondary: AppColors.secondary,
//           surface: AppColors.white,
//           background: AppColors.scaffoldBackground,
//           error: AppColors.appRed,
//         ),
//         scaffoldBackgroundColor: AppColors.scaffoldBackground,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: AppColors.primary,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//         ),
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(color: AppColors.black),
//           bodyLarge: TextStyle(color: AppColors.black),
//         ),
//         extensions: <ThemeExtension<dynamic>>[
//           AppThemeColors(
//             challanGenerate: const Color(0xff18A2B7),
//             violatorHistory: const Color(0xff28A744),
//             profileSettings: const Color(0xffFEC107),
//           ),
//         ],
//       );

//   static ThemeData get darkTheme => ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: AppColors.darkPrimary,
//         colorScheme: const ColorScheme.dark(
//           primary: AppColors.darkPrimary,
//           secondary: AppColors.darkSecondary,
//           surface: Color(0xFF1E1E1E),
//           background: AppColors.darkScaffoldBackground,
//           error: AppColors.appRed,
//         ),
//         scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: AppColors.darkPrimary,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//         ),
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(color: AppColors.white),
//           bodyLarge: TextStyle(color: AppColors.white),
//         ),
//         extensions: <ThemeExtension<dynamic>>[
//           AppThemeColors(
//             challanGenerate: const Color(0xFF26C6DA),
//             violatorHistory: const Color(0xFF66BB6A),
//             profileSettings: const Color(0xFFFFA000),
//           ),
//         ],
//       );
// }

// class AppThemeColors extends ThemeExtension<AppThemeColors> {
//   final Color challanGenerate;
//   final Color violatorHistory;
//   final Color profileSettings;

//   const AppThemeColors({
//     required this.challanGenerate,
//     required this.violatorHistory,
//     required this.profileSettings,
//   });

//   @override
//   ThemeExtension<AppThemeColors> copyWith({
//     Color? challanGenerate,
//     Color? violatorHistory,
//     Color? profileSettings,
//   }) {
//     return AppThemeColors(
//       challanGenerate: challanGenerate ?? this.challanGenerate,
//       violatorHistory: violatorHistory ?? this.violatorHistory,
//       profileSettings: profileSettings ?? this.profileSettings,
//     );
//   }

//   @override
//   ThemeExtension<AppThemeColors> lerp(
//     ThemeExtension<AppThemeColors>? other,
//     double t,
//   ) {
//     if (other is! AppThemeColors) {
//       return this;
//     }
//     return AppThemeColors(
//       challanGenerate: Color.lerp(challanGenerate, other.challanGenerate, t)!,
//       violatorHistory: Color.lerp(violatorHistory, other.violatorHistory, t)!,
//       profileSettings: Color.lerp(profileSettings, other.profileSettings, t)!,
//     );
//   }
// }