import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLifecycleProvider = Provider<AppLifecycleState>((ref) {
  final observer = AppLifecycleObserver((value) => ref.state = value);
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return AppLifecycleState.resumed;
});

class AppLifecycleObserver extends WidgetsBindingObserver {
  final ValueChanged<AppLifecycleState> _state;

  AppLifecycleObserver(this._state);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state(state);
    super.didChangeAppLifecycleState(state);
  }
}