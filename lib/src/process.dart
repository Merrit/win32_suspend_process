/// Simple dart code to suspend and resume processes on Microsoft Windows.

// Standard Library
import 'package:meta/meta.dart';

// Third-Party Packages
import 'package:win32/src/kernel32.dart';
import 'package:win32/win32.dart';

// Local Packages
import 'ntdll.dart';

/// Suspend or resume processes on Microsoft Windows.
///
/// Pass in the process id number and then call `suspend()` or `resume()`.
///
/// #### Example
///
/// ```dart
/// var process = Win32Process([pid]);
///
/// process.suspend();
/// ```
class Win32Process {
  Win32Process({@required this.pid})
      : processHandle = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);

  final int pid;

  final int processHandle;

  void suspend() => NtSuspendProcess(processHandle);

  void resume() => NtResumeProcess(processHandle);
}
