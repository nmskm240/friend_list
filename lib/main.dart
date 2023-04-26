import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/app.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.loadOrDefault();
  runApp(const ProviderScope(child: App()));
}