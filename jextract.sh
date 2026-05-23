#!/bin/bash
swift run --package-path ~/SNJ/libs/swift-java swift-java jextract \
  --mode jni \
  --input-swift ~/SNJ/projects/SNJShop/Sources/SNJShop \
  --swift-module SNJShop \
  --output-swift ~/SNJ/projects/SNJShop/Sources/SNJShop/generated \
  --output-java ~/SNJ/projects/SNJShop/java/generated/java \
  --java-package com.snj
