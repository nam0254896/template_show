import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'template_show_platform_interface.dart';

/// An implementation of [TemplateShowPlatform] that uses method channels.
class MethodChannelTemplateShow extends TemplateShowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('template_show');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
