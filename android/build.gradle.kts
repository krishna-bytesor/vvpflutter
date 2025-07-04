buildscript {
    dependencies {
        classpath("com.google.gms:google-services:4.3.15")
    }
    repositories {
        google()
        mavenCentral()
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Set JVM compatibility globally (Kotlin & Java)
subprojects {
    afterEvaluate {
        // Kotlin JVM target
        tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
            kotlinOptions {
                jvmTarget = "17"
            }
        }

        // Java compileOptions
        plugins.withId("com.android.application") {
            extensions.configure<com.android.build.gradle.AppExtension>("android") {
                compileOptions.apply {
                    sourceCompatibility = JavaVersion.VERSION_17
                    targetCompatibility = JavaVersion.VERSION_17
                }
            }
        }

        plugins.withId("com.android.library") {
            extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
                compileOptions.apply {
                    sourceCompatibility = JavaVersion.VERSION_17
                    targetCompatibility = JavaVersion.VERSION_17
                }
            }
        }
    }
}

// ✅ Project build directories
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    evaluationDependsOn(":app")
}

// ✅ Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
