import 'package:flutter_test/flutter_test.dart';
import 'package:template_show/template_show.dart';
import 'package:template_show/template_show_platform_interface.dart';
import 'package:template_show/template_show_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTemplateShowPlatform
    with MockPlatformInterfaceMixin
    implements TemplateShowPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TemplateShowPlatform initialPlatform = TemplateShowPlatform.instance;

  test('$MethodChannelTemplateShow is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTemplateShow>());
  });

  test('getPlatformVersion', () async {
    TemplateShow templateShowPlugin = TemplateShow();
    MockTemplateShowPlatform fakePlatform = MockTemplateShowPlatform();
    TemplateShowPlatform.instance = fakePlatform;

    expect(await templateShowPlugin.getPlatformVersion(), '42');
  });
}
