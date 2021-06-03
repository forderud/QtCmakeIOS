# Script assumes the following:
# * XCODE_ATTRIBUTE_DEVELOPMENT_TEAM env.var
# * IOS_TOOLCHAIN env.var pointing to a CMake toolchain for iOS (e.g. from https://github.com/leetal/ios-cmake )
# * Qt SDK "bin" folder added to PATH

echo Cleaning clone...
git clean -fxd
git pull

echo Creating CMake project...
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=$IOS_TOOLCHAIN -DPLATFORM=OS64 -DARCHS=arm64 -DENABLE_BITCODE=0 -DDEPLOYMENT_TARGET=12.0 -DENABLE_VISIBILITY=1 -DENABLE_ARC=0 -DXCODE_ATTRIBUTE_CODE_SIGN_IDENTITY=\"iPhone Developer\" -DCMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM=$XCODE_ATTRIBUTE_DEVELOPMENT_TEAM .

echo Opening project in Xcode...
open analogclock.xcodeproj
