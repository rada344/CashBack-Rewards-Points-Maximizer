part of '../ui.dart';

class AppColors {
  static const bg = Color(0xFF0A0A0F);
  static const bg2 = Color(0xFF13131A);
  static const bg3 = Color(0xFF1C1C27);
  static const bg4 = Color(0xFF252535);
  static const accent = Color(0xFF6C63FF);
  static const accent2 = Color(0xFFA78BFA);
  static const green = Color(0xFF22C55E);
  static const amber = Color(0xFFF59E0B);
  static const red = Color(0xFFEF4444);
  static const text = Color(0xFFF0F0FF);
  static const text2 = Color(0xFF9090B0);
  static const text3 = Color(0xFF5A5A7A);
}

class RewardCard {
  RewardCard({
    required this.name,
    required this.number,
    required this.category,
    required this.benefit,
    required this.gradient,
    required this.icon,
    required this.stores,
    required this.points,
  });

  final String name;
  final String number;
  final String category;
  final String benefit;
  final LinearGradient gradient;
  final String icon;
  final List<String> stores;
  final int points;
}

class UserProfile {
  UserProfile({required this.name, required this.email});
  String name;
  String email;
}

enum AppTab { home, cards, map, notifications, profile }

enum AuthScreen { splash, login, signup }
