Copy _gradle.properties.default_ to _gradle.properties_ then choose one of project building options.

You have 2 options to develope Z8 porject:
# Using Z8 Project sources from Git - _z8.home_ must point to Z8 Project folder, Gradle build script assumes Z8 Project is in Eclipse workspace
# Using Z8 Project binaries - _z8.home_ must not be set

Eclipse workspace configuration:
# If you use Z8 Project sources, Z8 Project must be in the same workspace.
# If you use Z8 Project binaries, subproject _org.zenframework.z8.lang_ must be in the same workspace. Other Z8 dependencies are resolved with Maven plugin.