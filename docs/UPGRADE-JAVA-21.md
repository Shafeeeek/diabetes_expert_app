# Upgrade to Java 21 (LTS) — Guidance for this repository

This document explains how to upgrade your local/build environment to use JDK 21 and lists safe, minimal changes you can add to the repository to prefer JDK 21 via Gradle toolchains or Gradle properties. I attempted to run the automated GitHub Copilot Java upgrade plan tool, but the hosted tool is unavailable for this account. The steps below let you complete the upgrade manually and verify the project.

IMPORTANT NOTES / ASSUMPTIONS
- You have admin rights to install a JDK on your machine.
- You will verify compatibility for Android Gradle Plugin (AGP) and Gradle versions. Some AGP/Gradle combinations may not support compiling with newer Java language features; test locally.
- This repo is a Flutter project with Android subproject. Upgrading the JDK affects Gradle/Android builds, not Dart/Flutter code.

Step 0 — Install JDK 21
1. Download and install a JDK 21 distribution (Eclipse Temurin / Adoptium, Oracle, Azul, Amazon Corretto, etc.).
   - Example: https://adoptium.net/ (choose Temurin 21 LTS for your OS)
2. Note the install path. On Windows typical path: `C:\Program Files\Java\jdk-21`.

Step 1 — Point Gradle / Android Studio to JDK 21 (two safe options)

Option A — Set JAVA_HOME and use system JDK
- In PowerShell (set only for current session):

```powershell
$env:JAVA_HOME = 'C:\Program Files\Java\jdk-21'
setx JAVA_HOME 'C:\Program Files\Java\jdk-21'  # sets persistent user ENV (needs new shell)
.\gradlew.bat --version
```

- Confirm Gradle uses JDK 21 by running `.\gradlew.bat --version` from the repo root.

Option B — Configure Gradle to use a specific JDK for the project
- Add (or edit) `gradle.properties` in project root (or `~/.gradle/gradle.properties`) with:

```
org.gradle.java.home=C:\Program Files\Java\jdk-21
```

- This forces Gradle to run with that JDK regardless of system JAVA_HOME.

Step 2 — (Optional) Add Gradle Java toolchain to build files (recommended, non-destructive)

Adding a toolchain tells Gradle to compile with the requested language level. This is safe and can be added to JVM modules. For Kotlin DSL (`build.gradle.kts`) you can add to the top-level `build.gradle.kts` or the `app/` module `build.gradle.kts`.

Example snippet for `app/build.gradle.kts` (Android module):

```kotlin
// In module (app) build.gradle.kts, inside the android { } block or top-level:
android {
    compileOptions {
        // Note: JavaVersion enum might not have VERSION_21 depending on Gradle/AGP version.
        // Keep toolchain below as the canonical source of truth.
        sourceCompatibility = JavaVersion.VERSION_17 // fallback used by some AGP versions
        targetCompatibility = JavaVersion.VERSION_17
    }
}

// Add a java toolchain at project level (create in top-level build.gradle.kts if present):
java {
    toolchain {
        languageVersion.set(org.gradle.jvm.toolchain.JavaLanguageVersion.of(21))
    }
}

// For Kotlin (if kotlin code in the project needs jvmTarget):
// in module-level build.gradle.kts where kotlinOptions is set:
// kotlinOptions {
//     jvmTarget = "21"
// }
```

Caveat: Android Gradle Plugin historically expects certain maximum language levels for `compileOptions`. If AGP complains, keep the `compileOptions` at a compatible version (for example 17) and rely on the Gradle toolchain to provide the JDK runtime for Gradle and annotation processors.

Step 3 — Update CI (if you have automated pipelines)
- Ensure CI uses JDK 21 where required. For GitHub Actions add `actions/setup-java@v4` with `java-version: '21'`.

Example:
```yaml
- uses: actions/setup-java@v4
  with:
    distribution: 'temurin'
    java-version: '21'
```

Step 4 — Verify build locally
1. From repo root (PowerShell):

```powershell
# ensure env points to JDK 21
$env:JAVA_HOME = 'C:\Program Files\Java\jdk-21'
.\gradlew.bat clean assembleDebug --stacktrace
```

2. Fix any compilation or AGP issues. Typical problems:
   - AGP or Gradle not compatible with the JDK version: update Gradle wrapper and AGP.
   - Kotlin `jvmTarget` mismatch: update `kotlinOptions.jvmTarget`.

Troubleshooting notes
- If Gradle fails with `Unsupported class file major version 65` or similar, that means Gradle/AGP uses older Java to run — ensure `org.gradle.java.home` or JAVA_HOME points to JDK 21.
- If Android Studio still uses a different JDK, set the Gradle JDK in Settings > Build Tools > Gradle.

Safe, reversible repo edits I can apply for you (if you want me to make them):
- Add a commented `org.gradle.java.home` entry to `gradle.properties` with instructions (no breakage, user can enable by setting path).
- Add `java { toolchain { languageVersion.set(JavaLanguageVersion.of(21)) } }` in `build.gradle.kts` or a new top-level `gradle` snippet guarded by Gradle version checks.
- Add a `docs/UPGRADE-JAVA-21.md` (this file) explaining next steps and verification commands.

If you want me to proceed automatically
- I can add the documentation file (already added) and optionally add a safe, commented property to `gradle.properties` and a toolchain snippet to the top-level `build.gradle.kts` or `app/build.gradle.kts`.
- Tell me whether you want me to: (A) insert a commented `org.gradle.java.home` line into `gradle.properties` or (B) add a toolchain snippet into `app/build.gradle.kts` (I will not change any existing compileOptions unless you ask).

Summary of what happened in this session
- I attempted to run the automated Java upgrade plan tool but it is not available on this account.
- I created `docs/UPGRADE-JAVA-21.md` with manual, step-by-step instructions and safe repo edits to prefer JDK 21.

Next steps (pick one):
- I can add safe, minimal changes to the repo (commented `gradle.properties` line and/or toolchain snippet). If you want that, tell me which file(s) to modify.
- Or follow the instructions in `docs/UPGRADE-JAVA-21.md` and run the verification commands locally.

