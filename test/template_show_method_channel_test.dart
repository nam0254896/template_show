import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_show/template_show_method_channel.dart';

void main() {
  MethodChannelTemplateShow platform = MethodChannelTemplateShow();
  const MethodChannel channel = MethodChannel('template_show');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
