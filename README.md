A simple library for Dart & Flutter providing an easy way to suspend and resume
processes on the Windows platform from native dart code.

# Using

To suspend:

```dart
final process = Win32Process($pid);

final bool suspended = process.suspend();

if (!suspended) {
    // Handle failure.
}
```

Then resume:

```dart
final bool resumed = process.resume();

if (!resumed) {
    // Handle failure.
}
```


Further examples are provided in the examples directory.
