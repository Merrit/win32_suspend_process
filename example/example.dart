import 'dart:io';

import 'package:win32_suspend_process/win32_suspend_process.dart';

void main() {
  // The process id (pid) of the process we wish to suspend.
  // Try it out on something innocuous like notepad.
  final pid = 5588;

  // Instantiate the object representing our process.
  final process = Win32Process(pid);

  // Suspend the process.
  final suspended = process.suspend();
  if (!suspended) {
    // Error handling.
  }
  print('Process suspended.\nWaiting 10 seconds.');

  // Give a chance to see the process is suspended / unresponsive.
  sleep(Duration(seconds: 10));

  // Resume the process.
  final resumed = process.resume();
  if (!resumed) {
    // Error handling.
  }
  print('Process resumed.');
}
