/// Map undocumented win32 API for suspend and resume process to dart code.

// ignore_for_file: non_constant_identifier_names

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
  final ntResumeProcessNativeFunction = _ntdll.lookupFunction<
      Int32 Function(IntPtr hWnd), int Function(int hWnd)>('NtResumeProcess');
  return ntResumeProcessNativeFunction(hWnd);
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
  final ntSuspendProcessNativeFunction = _ntdll.lookupFunction<
      Int32 Function(IntPtr hWnd), int Function(int hWnd)>('NtSuspendProcess');
  return ntSuspendProcessNativeFunction(hWnd);
}
