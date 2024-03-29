/// Simple dart code to suspend and resume processes on Microsoft Windows.

// Third-Party Packages
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
/// final process = Win32Process([pid]);
///
/// final result = process.suspend();
///
/// if (result != true) {
///   // Handle error.
/// }
/// ```
class Win32Process {
  Win32Process(this.pid);

  /// The process id of the process to be acted on.
  final int pid;

  /// Returns true if the process was successfully suspended,
  /// returns false if it failed.
  bool suspend() {
    final processHandle = OpenProcess(PROCESS_SUSPEND_RESUME, FALSE, pid);
    final result = NtSuspendProcess(processHandle);
    CloseHandle(processHandle);
    return (result == 0) ? true : false;
  }

  /// Returns true if the process was successfully resumed,
  /// returns false if it failed.
  bool resume() {
    final processHandle = OpenProcess(PROCESS_SUSPEND_RESUME, FALSE, pid);
    final result = NtResumeProcess(processHandle);
    CloseHandle(processHandle);
    return (result == 0) ? true : false;
  }
}
