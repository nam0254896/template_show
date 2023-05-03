
import 'template_show_platform_interface.dart';

class TemplateShow {
  Future<String?> getPlatformVersion() {
    return TemplateShowPlatform.instance.getPlatformVersion();
  }
}
