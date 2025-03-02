import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  // Get the root directory where Mason generated the files
  final dir = Directory.current.path;

  try {
    final result = Process.runSync('dart', ['format', dir]);
    if (result.exitCode == 0) {
      context.logger.info('✅ Dart code formatted successfully.');
    } else {
      context.logger.err('⚠️ Dart format failed: ${result.stderr}');
    }
  } catch (e) {
    context.logger.err('⚠️ Error running dart format: $e');
  }
}
