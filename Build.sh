# Script assumes that the following env.vars have already been set:
# * XCODE_ATTRIBUTE_DEVELOPMENT_TEAM
# * IOS_TOOLCHAIN
# * Qt SDK added to PATH

echo Clearing clone...
git clean -fxd
git pull

echo Creating CMake project...
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=$IOS_TOOLCHAIN -DPLATFORM=OS64 -DARCHS=arm64 -DENABLE_BITCODE=0 -DDEPLOYMENT_TARGET=12.0 -DENABLE_VISIBILITY=1 -DENABLE_ARC=0 -DCMAKE_SYSTEM_VERSION=14.0 .

echo Opening project in Xcode...
open analogclock.xcodeproj
