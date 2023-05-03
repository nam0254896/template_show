import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'template_show_method_channel.dart';

abstract class TemplateShowPlatform extends PlatformInterface {
  /// Constructs a TemplateShowPlatform.
  TemplateShowPlatform() : super(token: _token);

  static final Object _token = Object();

  static TemplateShowPlatform _instance = MethodChannelTemplateShow();

  /// The default instance of [TemplateShowPlatform] to use.
  ///
  /// Defaults to [MethodChannelTemplateShow].
  static TemplateShowPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TemplateShowPlatform] when
  /// they register themselves.
  static set instance(TemplateShowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
