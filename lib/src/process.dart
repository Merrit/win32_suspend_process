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

  /// The process id of the process to be acted on.
  final int pid;

  /// The win32 process handle.
  final int processHandle;

  /// Returns true if the process was successfully suspended,
  /// returns false if it failed.
  bool suspend() {
    var result = NtSuspendProcess(processHandle);
    return (result == 0) ? true : false;
  }

  /// Returns true if the process was successfully resumed,
  /// returns false if it failed.
  bool resume() {
    var result = NtResumeProcess(processHandle);
    return (result == 0) ? true : false;
  }
}
