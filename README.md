# QtCmakeIOS

Sample project for experimenting with shared libraries (frameworks) on iOS when using CMake as build system and Qt as GUI library.

CMake properties used:
* [FRAMEWORK](https://cmake.org/cmake/help/latest/prop_tgt/FRAMEWORK.html) for annotating shared-lib as a framework
* [XCODE_LINK_BUILD_PHASE_MODE](https://cmake.org/cmake/help/latest/prop_tgt/XCODE_LINK_BUILD_PHASE_MODE.html) for "Link Binary With Libraries" (since CMake 3.19)
* [XCODE_EMBED_FRAMEWORKS](https://cmake.org/cmake/help/latest/prop_tgt/XCODE_EMBED_type.html) for "Embed Frameworks" (since CMake 3.20)
