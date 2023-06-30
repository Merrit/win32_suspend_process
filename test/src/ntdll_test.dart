import 'dart:ffi';

import 'package:test/test.dart';
import 'package:win32_suspend_process/src/process.dart';

void main() {
  test('Can instantiate NtResumeProcess', () {
    final ntdll = DynamicLibrary.open('ntdll.dll');
    final ntResumeProcess = ntdll.lookupFunction<Void Function(IntPtr hWnd),
        void Function(int hWnd)>('NtResumeProcess');
    expect(ntResumeProcess, isA<Function>());
  });

  test('Can instantiate NtSuspendProcess', () {
    final ntdll = DynamicLibrary.open('ntdll.dll');
    final ntSuspendProcess = ntdll.lookupFunction<Void Function(IntPtr hWnd),
        void Function(int hWnd)>('NtSuspendProcess');
    expect(ntSuspendProcess, isA<Function>());
  });

  test('Can instantiate Win32Process', () {
    final process = Win32Process(0000);
    expect(process.runtimeType, Win32Process);
  });
}
