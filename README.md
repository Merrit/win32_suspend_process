A simple library for Dart & Flutter providing an easy way to suspend and resume
processes on the Windows platform from native dart code.

# Using

To suspend:

```dart
final process = Win32Process($pid);

process.suspend();
```

Then resume:

```dart
process.resume();
```

The underlying Windows API supplies no return or confirmation, therefore these methods
do not either.

Further examples are provided in the examples directory.
