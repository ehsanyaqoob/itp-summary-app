import 'package:flutter/material.dart';

/// Global color definitions for the entire app.
/// Always use these instead of `Colors.xyz` to keep colors consistent
/// across physical devices & emulators.
/// 
class AppColors {
  AppColors._(); // Prevent instantiation

  // ───────── Primary Colors ─────────
  static const Color primary = Color(0xFF023E8A);
  static const Color appPrimary = Color(0xFF000E75);
  static const Color secondary = Color(0xFF121212);
  static const Color appSecondary = Color(0xFF005BD2);

  // ───────── Accent Colors ─────────
  static const Color accent = Color(0xFF4A4A4A);
  static const Color orange = Color(0xFFE86C2A);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color amber = Color(0xFFFF8F00);
  static const Color lime = Color(0xFF178B19);
  static const Color appRed = Color(0xFFE33C3C);

  // ───────── Status Colors ─────────
  static const Color challanGenerate = Color(0xFF18A2B7);
  static const Color violatorHistory = Color(0xFF28A744);
  static const Color profileSettings = Color(0xFFFEC107);
  static const Color sergeantHistory = Color(0xFFDC3646);
  static const Color challanAmountColor = Color(0xFF2F4F4F);

  // ───────── Neutral Colors ─────────
  static const Color black = Color(0xFF000000);
  static const Color appBlack1 = Color(0xFF0B0E11);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E); // replaced Colors.grey
  static const Color border = Color(0xFFBFBFBF);
  static const Color text = Color(0xFF7A7A7A);
  static const Color placeholderText = Color(0xFFCCCCCC);

  // ───────── Background Colors ─────────
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color fieldColor = Color(0xFFF1EFF0);
  static const Color bgGrey = Color(0xFFDEDDE0);
  static const Color antiFlashWhite = Color(0xFFEFF0F1);
  static const Color seasalt = Color(0xFFF9F9F9);
  static const Color nyanza = Color(0xFFDFF5D8);
  static const Color platinum = Color(0xFFD4D5DB);

  // ───────── Special Use Colors ─────────
  static const Color cinereous = Color(0xFFA6877E);
  static const Color socialGrey = Color(0xFFAAAFBB);
  static const Color fieldFontColor = Color(0xFF929292);
  static const Color transparent = Color(0x00000000);
}
