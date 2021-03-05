/// Map undocumented win32 API for suspend and resume process to dart code.

import 'dart:ffi';

final _ntdll = DynamicLibrary.open('ntdll.dll');

/// The undocumented NtResumeProcess function accepts a process handle and
/// resumes that process. Return value is 0 for success, non-zero for failure.
///
/// ```c
/// BOOL NtResumeProcess(
///  HWND hWnd
/// );
/// ```
int NtResumeProcess(int hWnd) {
  final _NtResumeProcess = _ntdll.lookupFunction<Int32 Function(IntPtr hWnd),
      int Function(int hWnd)>('NtResumeProcess');
  return _NtResumeProcess(hWnd);
}

/// The undocumented NtSuspendProcess function accepts a process handle and
/// suspends that process. Return value is 0 for success, non-zero for failure.
///
/// ```c
/// BOOL NtSuspendProcess(
///  HWND hWnd
/// );
/// ```
int NtSuspendProcess(int hWnd) {
  final _NtSuspendProcess = _ntdll.lookupFunction<Int32 Function(IntPtr hWnd),
      int Function(int hWnd)>('NtSuspendProcess');
  return _NtSuspendProcess(hWnd);
}
