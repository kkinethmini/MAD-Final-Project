plugins {
    id("com.android.application") // ✅
    id("kotlin-android") // ✅
    id("dev.flutter.flutter-gradle-plugin") // ✅
    // ❌ REMOVE this line:
    // id("com.google.gms.google-services")
}

android {
    namespace = "com.example.black_hole"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.black_hole"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ✅ ADD THIS LINE at the bottom (outside of any block)
apply(plugin = "com.google.gms.google-services")
