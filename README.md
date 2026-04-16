# BrokenSwiftUIMenu

Minimal reproducible example for a SwiftUI bug on iOS 26 where presenting a `Menu` causes the software keyboard to appear unexpectedly.

## Bug Description

On iOS 26, when a `Menu` is presented while a `focusable` view with `onKeyPress` has focus, the software keyboard appears. This does not happen on iOS 18 or earlier.

Additionally, the following runtime issue (`com.apple.runtime-issues`) is logged as **fatal**:

> Adding '\_UIReparentingView' as a subview of UIHostingController.view is not supported and may result in a broken view hierarchy. Add your view above UIHostingController.view in a common superview or insert it into your SwiftUI content in a UIViewRepresentable instead.

## Workaround Attempt

Adding `.compositingGroup()` to the `Menu` suppresses the `_UIReparentingView` fatal log, but the software keyboard still appears unexpectedly. The root cause of the keyboard issue remains unresolved.

## Steps to Reproduce

1. Open the project in Xcode 26.4.0 and run on an iOS 26 simulator or device
2. The `FocusableView` automatically receives focus on appear
3. Tap "Open Menu (Keyboard will appear)"
4. Observe: the software keyboard appears unexpectedly

## Demo

[demo.mp4](demo.mp4)

https://github.com/user-attachments/assets/9724f151-48c0-40db-9fe7-8102da16cdf5

## Environment

- Xcode 26.4.0
- iOS 26 (iPhone Simulator / Device)
