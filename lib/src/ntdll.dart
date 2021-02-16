/// Map undocumented win32 API for suspend and resume process to dart code.

import 'dart:ffi';

final _ntdll = DynamicLibrary.open('ntdll.dll');

/// The undocumented NtResumeProcess function accepts a process handle and
/// resumes that process.
///
/// ```c
/// void NtResumeProcess(
///  HWND hWnd
/// );
/// ```
void NtResumeProcess(int hWnd) {
  final _NtResumeProcess = _ntdll.lookupFunction<Void Function(IntPtr hWnd),
      void Function(int hWnd)>('NtResumeProcess');
  return _NtResumeProcess(hWnd);
}

/// The undocumented NtSuspendProcess function accepts a process handle and
/// suspends that process.
///
/// ```c
/// void NtSuspendProcess(
///  HWND hWnd
/// );
/// ```
void NtSuspendProcess(int hWnd) {
  final _NtSuspendProcess = _ntdll.lookupFunction<Void Function(IntPtr hWnd),
      void Function(int hWnd)>('NtSuspendProcess');
  return _NtSuspendProcess(hWnd);
}
