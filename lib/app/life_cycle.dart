import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Represents different lifecycle states of the app.
enum AppLifecycleStatus { resumed, inactive, paused, detached, hidden }

/// A GetX Controller that listens to and exposes app lifecycle events globally.
class AppLifecycleController extends GetxController with WidgetsBindingObserver {
  static AppLifecycleController get instance => Get.find<AppLifecycleController>();
  final Rx<AppLifecycleStatus> _status = AppLifecycleStatus.resumed.obs;
  AppLifecycleStatus get status => _status.value;
  Rx<AppLifecycleStatus> get statusRx => _status;
  bool get isForeground => _status.value == AppLifecycleStatus.resumed;
  bool get isPaused => _status.value == AppLifecycleStatus.paused;
  bool get isInactive => _status.value == AppLifecycleStatus.inactive;
  bool get isDetached => _status.value == AppLifecycleStatus.detached;
  bool get isHidden => _status.value == AppLifecycleStatus.hidden;
  // Reactive callbacks that can be listened to from anywhere
  final Rx<VoidCallback?> _onResumeCallback = Rx<VoidCallback?>(null);
  final Rx<VoidCallback?> _onPauseCallback = Rx<VoidCallback?>(null);
  final Rx<VoidCallback?> _onInactiveCallback = Rx<VoidCallback?>(null);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    debugPrint('🔄 AppLifecycleController initialized');
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    debugPrint('🔴 AppLifecycleController disposed');
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _status.value = AppLifecycleStatus.resumed;
        _onAppResumed();
        break;
      case AppLifecycleState.inactive:
        _status.value = AppLifecycleStatus.inactive;
        _onAppInactive();
        break;
      case AppLifecycleState.paused:
        _status.value = AppLifecycleStatus.paused;
        _onAppPaused();
        break;
      case AppLifecycleState.detached:
        _status.value = AppLifecycleStatus.detached;
        _onAppDetached();
        break;
      case AppLifecycleState.hidden:
        _status.value = AppLifecycleStatus.hidden;
        _onAppHidden();
        break;
    }
  }

  /// Custom callbacks — you can perform actions here that should
  /// happen across the app lifecycle (save data, restore, etc.)
  void _onAppResumed() {
    debugPrint('🔄 App resumed - restoring state');
    _onResumeCallback.value?.call();
  }

  void _onAppInactive() {
    debugPrint('⏸️ App inactive - temporary save');
    _onInactiveCallback.value?.call();
  }

  void _onAppPaused() {
    debugPrint('🚫 App paused - persist important data');
    _onPauseCallback.value?.call();
  }

  void _onAppDetached() {
    debugPrint('💀 App detached - final cleanup');
  }

  void _onAppHidden() {
    debugPrint('👻 App hidden - background mode');
  }

  /// Set callbacks for lifecycle events
  void setCallbacks({
    VoidCallback? onResume,
    VoidCallback? onPause,
    VoidCallback? onInactive,
  }) {
    _onResumeCallback.value = onResume;
    _onPauseCallback.value = onPause;
    _onInactiveCallback.value = onInactive;
  }

  /// Clear all callbacks
  void clearCallbacks() {
    _onResumeCallback.value = null;
    _onPauseCallback.value = null;
    _onInactiveCallback.value = null;
  }

  /// Force manual save if needed
  void forceSaveState() {
    debugPrint('💾 Force saving app state');
  }

  /// Listen to specific lifecycle states
  void listenToLifecycle(AppLifecycleStatus status, VoidCallback callback) {
    ever(_status, (AppLifecycleStatus currentStatus) {
      if (currentStatus == status) {
        callback();
      }
    });
  }
}
class ReactiveStateAwareWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onResume;
  final VoidCallback? onPause;
  final VoidCallback? onInactive;

  const ReactiveStateAwareWidget({
    super.key,
    required this.child,
    this.onResume,
    this.onPause,
    this.onInactive,
  });

  @override
  Widget build(BuildContext context) {
    final lifecycleController = Get.find<AppLifecycleController>();
    
    return Obx(() {
      // This will rebuild when lifecycle state changes
      final status = lifecycleController.status;
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (status) {
          case AppLifecycleStatus.resumed:
            onResume?.call();
            break;
          case AppLifecycleStatus.paused:
            onPause?.call();
            break;
          case AppLifecycleStatus.inactive:
            onInactive?.call();
            break;
          default:
            break;
        }
      });
      
      return child;
    });
  }
}
/// A wrapper widget that listens for lifecycle changes and triggers callbacks using GetX.
class StateAwareWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onResume;
  final VoidCallback? onPause;
  final VoidCallback? onInactive;

  const StateAwareWidget({
    super.key,
    required this.child,
    this.onResume,
    this.onPause,
    this.onInactive,
  });

  @override
  Widget build(BuildContext context) {
    // Set up lifecycle callbacks when widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lifecycleController = Get.find<AppLifecycleController>();
      lifecycleController.setCallbacks(
        onResume: onResume,
        onPause: onPause,
        onInactive: onInactive,
      );
    });

    return child;
  }
}