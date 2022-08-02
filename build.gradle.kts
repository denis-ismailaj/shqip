plugins {
    kotlin("jvm") version "1.7.10"
    java
    antlr
}

repositories {
    mavenCentral()
}

dependencies {
    antlr("org.antlr:antlr4:4.10.1")

    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
    testLogging {
        events("passed", "skipped", "failed")
    }
}

tasks.compileKotlin {
    dependsOn(tasks.generateGrammarSource)
}

tasks.compileTestKotlin {
    dependsOn(tasks.generateTestGrammarSource)
}

tasks.generateGrammarSource {
    arguments = arguments + listOf(
        "-package", "org.example.shqip",
        "-visitor",
        "-no-listener",
    )
}
