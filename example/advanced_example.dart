// This example shows how to use the FFI wrapper directly.
//
// Using the [Win32Process] class is easier than this for most uses.

import 'dart:io';

import 'package:win32/src/kernel32.dart';
import 'package:win32/win32.dart';

import 'package:win32_suspend_process/win32_suspend_process.dart';

void main() {
  // The process id (pid) of the process you wish to suspend.
  // Try it out on something innocuous like notepad.exe
  final pid = 5588;

  // Get the handle to the process.
  final processHandle = OpenProcess(PROCESS_SUSPEND_RESUME, FALSE, pid);

  // Suspend the process.
  final suspended = NtSuspendProcess(processHandle);
  if (suspended != 0) {
    // Error handling.
  }
  print('Process suspended.\nWaiting 10 seconds.');

  // Give a chance to see the process is suspended / unresponsive.
  sleep(Duration(seconds: 10));

  // Resume the process.
  final resumed = NtResumeProcess(processHandle);
  if (resumed != 0) {
    // Error handling.
  }
  print('Process resumed.');
}
