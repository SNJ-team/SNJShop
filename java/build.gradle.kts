plugins {
    java
}

group = "com.snj"
version = "1.0.0"

repositories {
    mavenLocal()
    mavenCentral()
    maven("https://repo.papermc.io/repository/maven-public/")
}

dependencies {
    compileOnly("io.papermc.paper:paper-api:1.21.4-R0.1-SNAPSHOT")
    compileOnly(files("/Users/oleksijbrikin/SNJ/server/swiftandjava/plugins/Vault.jar"))
    implementation("org.swift.swiftkit:swiftkit-core:1.0-SNAPSHOT")
    implementation("org.swift.swiftkit:swiftkit-ffm:1.0-SNAPSHOT")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(25))
    }
}

sourceSets {
    main {
        java {
            srcDirs("src/main/java", "generated/java")
        }
        resources {
            srcDirs("src/main/resources")
        }
    }
}

tasks.withType<ProcessResources> {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}

tasks.jar {
    from("/Users/oleksijbrikin/SNJ/projects/SNJShop/.build/arm64-apple-macosx/debug/libSNJShop.dylib")
    from("/Users/oleksijbrikin/SNJ/projects/SNJShop/.build/arm64-apple-macosx/debug/libSwiftJava.dylib")
    from("/Users/oleksijbrikin/SNJ/libs/swift-java/.build/arm64-apple-macosx/debug/libSwiftRuntimeFunctions.dylib")
    from(configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) })
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}
