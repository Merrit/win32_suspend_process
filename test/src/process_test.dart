import 'dart:io' as io;
import 'package:test/test.dart';
import 'package:win32_suspend_process/src/process.dart';

void main() {
  test('Can instantiate Win32Process', () {
    var pid = io.pid;
    var process = Win32Process(pid: pid);
    expect(process, isA<Win32Process>());
  });
}
