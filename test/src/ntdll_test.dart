import 'dart:ffi';

import 'package:test/test.dart';
import 'package:win32_suspend_process/src/process.dart';

void main() {
  test('Can instantiate NtResumeProcess', () {
    final ntdll = DynamicLibrary.open('ntdll.dll');
    final NtResumeProcess = ntdll.lookupFunction<Void Function(IntPtr hWnd),
        void Function(int hWnd)>('NtResumeProcess');
    expect(NtResumeProcess, isA<Function>());
  });

  test('Can instantiate NtSuspendProcess', () {
    final ntdll = DynamicLibrary.open('ntdll.dll');
    final NtSuspendProcess = ntdll.lookupFunction<Void Function(IntPtr hWnd),
        void Function(int hWnd)>('NtSuspendProcess');
    expect(NtSuspendProcess, isA<Function>());
  });

  test('Can instantiate Win32Process', () {
    final process = Win32Process(pid: 0000);
    expect(process.runtimeType, Win32Process);
  });
}
