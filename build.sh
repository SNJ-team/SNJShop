#!/bin/bash
set -e

# Fix libswiftCompatibilitySpan if needed
if [ ! -f ~/SNJ/libs/swift-java/.build/arm64-apple-macosx/debug/libswiftCompatibilitySpan.dylib ]; then
    echo "Fixing libswiftCompatibilitySpan..."
    cp "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift-6.2/macosx/libswiftCompatibilitySpan.dylib" "/Users/oleksijbrikin/SNJ/libs/swift-java/.build/arm64-apple-macosx/debug/"
fi

echo "Building Java..."
cd ~/SNJ/projects/SNJShop/java
gradle build

echo "Wrapping Java classes..."
cd ~/SNJ/projects/SNJShop
./wrap-java.sh

echo "Extracting Java bindings from Swift..."
./jextract.sh

echo "Building Swift..."
swift build -c release --package-path ~/SNJ/projects/SNJShop

if [ ! -f ~/SNJ/libs/swift-java/.build/arm64-apple-macosx/debug/libSwiftRuntimeFunctions.dylib ]; then
    echo "Building SwiftRuntimeFunctions..."
    swift build --package-path ~/SNJ/libs/swift-java --product SwiftRuntimeFunctions
fi

echo "Copying Swift libraries..."
mkdir -p ~/SNJ/server/swiftandjava/plugins/swiftlibs
mkdir -p ~/SNJ/projects/SNJShop/dist/swiftlibs
cp ~/SNJ/projects/SNJShop/.build/arm64-apple-macosx/release/libSNJShop.dylib ~/SNJ/projects/SNJShop/dist/swiftlibs/
cp ~/SNJ/projects/SNJShop/.build/arm64-apple-macosx/release/libSwiftJava.dylib ~/SNJ/projects/SNJShop/dist/swiftlibs/
cp ~/SNJ/libs/swift-java/.build/arm64-apple-macosx/debug/libSwiftRuntimeFunctions.dylib ~/SNJ/projects/SNJShop/dist/swiftlibs/
cp ~/SNJ/projects/SNJShop/java/build/libs/SNJShop.jar ~/SNJ/projects/SNJShop/dist/


echo "Building Java jar with updated bindings..."
cd ~/SNJ/projects/SNJShop/java
gradle build

echo "Deploying..."
cp build/libs/SNJShop.jar ~/SNJ/server/swiftandjava/plugins/
cp ~/SNJ/projects/SNJShop/dist/swiftlibs/*.dylib ~/SNJ/server/swiftandjava/plugins/swiftlibs/

echo "Done!"
