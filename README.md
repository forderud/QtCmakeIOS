# QtCmakeIOS

Sample project for experimenting with shared libraries (frameworks) on iOS when using [CMake](https://cmake.org/) as build system and [Qt](https://www.qt.io/) as GUI library.

Run `Build.sh` from the macOS terminal to get started.

### CMake properties used
* [FRAMEWORK](https://cmake.org/cmake/help/latest/prop_tgt/FRAMEWORK.html) for annotating shared-lib as a framework
* [XCODE_LINK_BUILD_PHASE_MODE](https://cmake.org/cmake/help/latest/prop_tgt/XCODE_LINK_BUILD_PHASE_MODE.html) for "Link Binary With Libraries" (since CMake 3.19)
* [XCODE_EMBED_FRAMEWORKS](https://cmake.org/cmake/help/latest/prop_tgt/XCODE_EMBED_type.html) for "Embed Frameworks" (since CMake 3.20)

Limitation: The shared library does not use Qt directly, since that's not supported before https://bugreports.qt.io/browse/QTBUG-85974 is fixed.

### Observed problems
**WARNING: Doesn`t work yet!** App startup fails with the following error:
```
dyld: Library not loaded: @rpath/MyLib.framework/MyLib
  Referenced from: /private/var/containers/Bundle/Application/CAD1EF2E-BA61-4B55-A3CA-27B05729C13D/helloworld.app/helloworld
  Reason: image not found
dyld: launch, loading dependent libraries
DYLD_LIBRARY_PATH=/usr/lib/system/introspection
DYLD_INSERT_LIBRARIES=/Developer/usr/lib/libBacktraceRecording.dylib:/Developer/usr/lib/libMainThreadChecker.dylib:/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib:/Developer/Library/PrivateFrameworks/GPUTools.framework/libglInterpose.dylib:/usr/lib/libMTLCapture.dylib
```

Work-around: Remove and add "MyLib.framework/MyLib" back again from "Frameworks, Libraries, and Embedded Content" in Xcode.
