import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/auth/login_screen.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/auth/register_screen.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/auth/forgot_password.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/dashboard_screen.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/editor/editor_main.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String editor = '/editor';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    dashboard: (context) => const DashboardScreen(),
    editor: (context) => const EditorMainScreen(),
  };
}