cmake_minimum_required(VERSION 3.20)

project(analogclock VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

set(CMAKE_BUILD_WITH_INSTALL_RPATH YES)
set(CMAKE_INSTALL_RPATH "@executable_path/Frameworks")

find_package(Qt5 COMPONENTS Widgets REQUIRED)

# create MyLib shared lib
add_library(MyLib SHARED
    MyLib.cpp
    MyLib.h
)

# configure MyLib as "framework" on iOS
set_target_properties(MyLib PROPERTIES
    FRAMEWORK TRUE
    MACOSX_FRAMEWORK_IDENTIFIER com.mycompany.MyLib
)


add_executable(AnalogClock MACOSX_BUNDLE
    main.cpp
    rasterwindow.cpp
    rasterwindow.h
)

target_link_libraries(AnalogClock PRIVATE
    MyLib
    Qt5::Widgets
)

set_target_properties(AnalogClock PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER AnalogClock2   # must be unique
    XCODE_LINK_BUILD_PHASE_MODE BUILT_ONLY
    XCODE_EMBED_FRAMEWORKS MyLib
    XCODE_EMBED_FRAMEWORKS_CODE_SIGN_ON_COPY ON
)

# Temporary solution until Qt6 (https://bugreports.qt.io/browse/QTBUG-87060)
target_link_options(AnalogClock PRIVATE "-Wl,-e,_qt_main_wrapper")
