/// Simple dart code to suspend and resume processes on Microsoft Windows.

// Third-Party Packages
import 'package:win32/src/kernel32.dart';
import 'package:win32/win32.dart';

// Local Packages
import 'ntdll.dart';

/// Suspend or resume processes on Microsoft Windows.
///
/// Pass in the process id number when instantiating this object,
/// then call the `suspend()` or `resume()` methods.
///
/// Returns true if successful, false if the call failed.
///
/// #### Example
///
/// ```dart
/// var process = Win32Process([pid]);
///
/// var result = process.suspend();
///
/// if (result != true) {
///   // Handle error.
/// }
/// ```
class Win32Process {
  Win32Process(this.pid)
      : processHandle = OpenProcess(PROCESS_SUSPEND_RESUME, FALSE, pid);

  final int pid;

  final int processHandle;

  bool suspend() {
    var result = NtSuspendProcess(processHandle);
    return (result == 0) ? true : false;
  }

  bool resume() {
    var result = NtResumeProcess(processHandle);
    return (result == 0) ? true : false;
  }
}
