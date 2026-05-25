#!/bin/bash
LIBS=~/SNJ/server/swiftandjava/libraries

CP_ARGS=$(find $LIBS -name "*.jar" | xargs -I {} echo "--cp {}" | tr '\n' ' ')
CP_ARGS="$CP_ARGS --cp /Users/oleksijbrikin/SNJ/projects/SNJShop/java/build/libs/SNJShop.jar"

swift run --package-path ~/SNJ/libs/swift-java swift-java wrap-java \
  --swift-module PaperAPI \
  $CP_ARGS \
  --output-directory ~/SNJ/projects/SNJShop/Sources/PaperAPI
