cmake_minimum_required(VERSION 3.16) # 3.20

project(analogclock VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Widgets REQUIRED)

add_library(MyLib
    Mylib.cpp
    Mylib.h
)

add_executable(helloworld MACOSX_BUNDLE
    main.cpp
    rasterwindow.cpp
    rasterwindow.h
)

target_link_libraries(helloworld PRIVATE
    MyLib
    Qt5::Widgets
)

if(IOS)
    set_target_properties(helloworld PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER helloworld23     # must be unique
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
        XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{XCODE_ATTRIBUTE_DEVELOPMENT_TEAM}
    )

    target_link_options(helloworld PRIVATE "-Wl,-e,_qt_main_wrapper")
endif()
