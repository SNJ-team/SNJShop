#!/bin/bash
set -e
echo "Building Swift..."
swift build --package-path ~/SNJ/projects/SNJShop

echo "Building Java..."
cd ~/SNJ/projects/SNJShop/java
gradle build

echo "Deploying..."
cp build/libs/java-1.0.0.jar ~/SNJ/server/swiftandjava/plugins/

echo "Done!"
