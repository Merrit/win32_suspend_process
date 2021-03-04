import 'dart:io' as io;
import 'package:test/test.dart';
import 'package:win32_suspend_process/src/process.dart';

void main() {
  test('Can instantiate Win32Process', () {
    final pid = io.pid;
    final process = Win32Process(pid);
    expect(process, isA<Win32Process>());
  });
}
